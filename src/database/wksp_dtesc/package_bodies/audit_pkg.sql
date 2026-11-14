create or replace package body wksp_dtesc.audit_pkg as

    function start_audit (
        p_table_name in varchar2,
        p_action     in varchar2
    ) return number is

        v_audit_id  number;
        v_apex_user varchar2(30) := null;
        v_app_id    number := null;
        v_page_id   number := null;
    begin
        begin
            v_apex_user := nvl(apex_application.g_user, user);
            v_app_id := apex_application.g_flow_id;
            v_page_id := apex_application.g_flow_step_id;
        exception
            when others then
                v_apex_user := user;
        end;

        insert into audit_master (
            audit_id,
            db_user,
            app_user,
            apex_user,
            app_id,
            page_id,
            ip_address,
            action_type
        ) values
            ( audit_seq.nextval,
              user,
              v_apex_user,
              v_apex_user,
              v_app_id,
              v_page_id,
              sys_context('USERENV', 'IP_ADDRESS'),
              p_action )
        returning audit_id into v_audit_id;

        return v_audit_id;
    end start_audit;

    procedure log_changes (
        p_audit_id    in number,
        p_table_name  in varchar2,
        p_record_key  in varchar2,
        p_key_value   in varchar2,
        p_column_name in varchar2,
        p_old_value   in varchar2,
        p_new_value   in varchar2
    ) is
    begin
        insert into audit_detail (
            audit_detail_id,
            audit_id,
            table_name,
            column_name,
            old_value,
            new_value,
            pk_column,
            pk_value
        ) values
            ( audit_detail_seq.nextval,
              p_audit_id,
              p_table_name,
              p_column_name,
              p_old_value,
              p_new_value,
              p_record_key,
              p_key_value );

    exception
        when others then
            null;
    end log_changes;

end audit_pkg;
/


-- sqlcl_snapshot {"hash":"f68862d389e2373e39db7614a486c39eb798d478","type":"PACKAGE_BODY","name":"AUDIT_PKG","schemaName":"WKSP_DTESC","sxml":""}