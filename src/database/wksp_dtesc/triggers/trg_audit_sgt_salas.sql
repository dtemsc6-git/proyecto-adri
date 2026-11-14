create or replace editionable trigger wksp_dtesc.trg_audit_sgt_salas after
    insert or update or delete on wksp_dtesc.sgt_salas
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
        p_table_name => 'SGT_SALAS',
        p_action     => v_action_type
    );
    if inserting then
        if :new.sitio_id is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SALAS',
                                  'ID',
                                  v_pk_value,
                                  'SITIO_ID',
                                  null,
                                  to_char(:new.sitio_id));
        end if;

        if :new.siglas is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SALAS',
                                  'ID',
                                  v_pk_value,
                                  'SIGLAS',
                                  null,
                                  :new.siglas);

        end if;

        if :new.nombre is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SALAS',
                                  'ID',
                                  v_pk_value,
                                  'NOMBRE',
                                  null,
                                  :new.nombre);
        end if;

    elsif updating then
        if nvl(:old.sitio_id,
               -1) != nvl(:new.sitio_id,
                          -1) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SALAS',
                                  'ID',
                                  v_pk_value,
                                  'SITIO_ID',
                                  to_char(:old.sitio_id),
                                  to_char(:new.sitio_id));
        end if;

        if nvl(:old.siglas,
               'NULL') != nvl(:new.siglas,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SALAS',
                                  'ID',
                                  v_pk_value,
                                  'SIGLAS',
                                  :old.siglas,
                                  :new.siglas);

        end if;

        if nvl(:old.nombre,
               'NULL') != nvl(:new.nombre,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SALAS',
                                  'ID',
                                  v_pk_value,
                                  'NOMBRE',
                                  :old.nombre,
                                  :new.nombre);
        end if;

    elsif deleting then
        if :old.sitio_id is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SALAS',
                                  'ID',
                                  v_pk_value,
                                  'SITIO_ID',
                                  to_char(:old.sitio_id),
                                  null);
        end if;

        if :old.siglas is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SALAS',
                                  'ID',
                                  v_pk_value,
                                  'SIGLAS',
                                  :old.siglas,
                                  null);

        end if;

        if :old.nombre is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SALAS',
                                  'ID',
                                  v_pk_value,
                                  'NOMBRE',
                                  :old.nombre,
                                  null);
        end if;

    end if;

exception
    when others then
        null;
end trg_audit_sgt_salas;
/

alter trigger wksp_dtesc.trg_audit_sgt_salas enable;


-- sqlcl_snapshot {"hash":"bdff954ada0e49c1202eaec6ec94939682ce4127","type":"TRIGGER","name":"TRG_AUDIT_SGT_SALAS","schemaName":"WKSP_DTESC","sxml":""}