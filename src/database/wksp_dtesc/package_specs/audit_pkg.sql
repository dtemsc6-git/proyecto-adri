create or replace package wksp_dtesc.audit_pkg as
    function start_audit (
        p_table_name in varchar2,
        p_action     in varchar2
    ) return number;

    procedure log_changes (
        p_audit_id    in number,
        p_table_name  in varchar2,
        p_record_key  in varchar2,
        p_key_value   in varchar2,
        p_column_name in varchar2,
        p_old_value   in varchar2,
        p_new_value   in varchar2
    );

end audit_pkg;
/


-- sqlcl_snapshot {"hash":"ab8eb1a2d21ec91fc5533dd8ab3c439aae5ccdec","type":"PACKAGE_SPEC","name":"AUDIT_PKG","schemaName":"WKSP_DTESC","sxml":""}