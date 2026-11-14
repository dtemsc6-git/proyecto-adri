create or replace editionable trigger wksp_dtesc.trg_audit_sgt_ciudad after
    insert or update or delete on wksp_dtesc.sgt_ciudad
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
        p_table_name => 'SGT_CIUDAD',
        p_action     => v_action_type
    );
    if inserting then
        if :new.nombre is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_CIUDAD',
                                  'ID',
                                  v_pk_value,
                                  'NOMBRE',
                                  null,
                                  :new.nombre);
        end if;

        if :new.depto_id is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_CIUDAD',
                                  'ID',
                                  v_pk_value,
                                  'DEPTO_ID',
                                  null,
                                  to_char(:new.depto_id));

        end if;

    elsif updating then
        if nvl(:old.nombre,
               'NULL') != nvl(:new.nombre,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_CIUDAD',
                                  'ID',
                                  v_pk_value,
                                  'NOMBRE',
                                  :old.nombre,
                                  :new.nombre);
        end if;

        if nvl(:old.depto_id,
               -1) != nvl(:new.depto_id,
                          -1) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_CIUDAD',
                                  'ID',
                                  v_pk_value,
                                  'DEPTO_ID',
                                  to_char(:old.depto_id),
                                  to_char(:new.depto_id));

        end if;

    elsif deleting then
        if :old.nombre is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_CIUDAD',
                                  'ID',
                                  v_pk_value,
                                  'NOMBRE',
                                  :old.nombre,
                                  null);
        end if;

        if :old.depto_id is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_CIUDAD',
                                  'ID',
                                  v_pk_value,
                                  'DEPTO_ID',
                                  to_char(:old.depto_id),
                                  null);

        end if;

    end if;

exception
    when others then
        null;
end trg_audit_sgt_ciudad;
/

alter trigger wksp_dtesc.trg_audit_sgt_ciudad enable;


-- sqlcl_snapshot {"hash":"1ce933b907844b833f7ba3befa5fab9b33c13f35","type":"TRIGGER","name":"TRG_AUDIT_SGT_CIUDAD","schemaName":"WKSP_DTESC","sxml":""}