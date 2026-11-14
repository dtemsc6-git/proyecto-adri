create or replace editionable trigger wksp_dtesc.trg_audit_sgt_depto after
    insert or update or delete on wksp_dtesc.sgt_depto
    for each row
declare
    v_audit_id    number;
    v_pk_value    varchar2(100);
    v_action_type varchar2(10);
begin
    if inserting then
        v_action_type := 'INSERT';
        v_pk_value := to_char(:new.id);
    elsif updating then
        v_action_type := 'UPDATE';
        v_pk_value := to_char(:new.id);
    elsif deleting then
        v_action_type := 'DELETE';
        v_pk_value := to_char(:old.id);
    end if;

    v_audit_id := audit_pkg.start_audit(
        p_table_name => 'SGT_DEPTO',
        p_action     => v_action_type
    );
    if inserting then
        if :new.nombre is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_DEPTO',
                                  'ID',
                                  v_pk_value,
                                  'NOMBRE',
                                  null,
                                  :new.nombre);
        end if;

        if :new.capital is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_DEPTO',
                                  'ID',
                                  v_pk_value,
                                  'CAPITAL',
                                  null,
                                  :new.capital);

        end if;

    elsif updating then
        if nvl(:old.nombre,
               'NULL') != nvl(:new.nombre,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_DEPTO',
                                  'ID',
                                  v_pk_value,
                                  'NOMBRE',
                                  :old.nombre,
                                  :new.nombre);
        end if;

        if nvl(:old.capital,
               'NULL') != nvl(:new.capital,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_DEPTO',
                                  'ID',
                                  v_pk_value,
                                  'CAPITAL',
                                  :old.capital,
                                  :new.capital);

        end if;

    elsif deleting then
        if :old.nombre is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_DEPTO',
                                  'ID',
                                  v_pk_value,
                                  'NOMBRE',
                                  :old.nombre,
                                  null);
        end if;

        if :old.capital is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_DEPTO',
                                  'ID',
                                  v_pk_value,
                                  'CAPITAL',
                                  :old.capital,
                                  null);

        end if;

    end if;

exception
    when others then
        null;
end trg_audit_sgt_depto;
/

alter trigger wksp_dtesc.trg_audit_sgt_depto enable;


-- sqlcl_snapshot {"hash":"483dda90c2317e3f75ef56f7a61bd6a114fda9fd","type":"TRIGGER","name":"TRG_AUDIT_SGT_DEPTO","schemaName":"WKSP_DTESC","sxml":""}