create or replace editionable trigger wksp_dtesc.trg_audit_sgt_tipo_cable after
    insert or update or delete on wksp_dtesc.sgt_tipo_cable
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
        p_table_name => 'SGT_TIPO_CABLE',
        p_action     => v_action_type
    );
    if inserting then
        if :new.nombre is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_TIPO_CABLE',
                                  'ID',
                                  v_pk_value,
                                  'NOMBRE',
                                  null,
                                  :new.nombre);
        end if;

        if :new.mostrar is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_TIPO_CABLE',
                                  'ID',
                                  v_pk_value,
                                  'MOSTRAR',
                                  null,
                                  :new.mostrar);

        end if;

        if :new.grupo_cables is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_TIPO_CABLE',
                                  'ID',
                                  v_pk_value,
                                  'GRUPO_CABLES',
                                  null,
                                  :new.grupo_cables);
        end if;

        if :new.comentarios is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_TIPO_CABLE',
                                  'ID',
                                  v_pk_value,
                                  'COMENTARIOS',
                                  null,
                                  :new.comentarios);
        end if;

    elsif updating then
        if nvl(:old.nombre,
               'NULL') != nvl(:new.nombre,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_TIPO_CABLE',
                                  'ID',
                                  v_pk_value,
                                  'NOMBRE',
                                  :old.nombre,
                                  :new.nombre);
        end if;

        if nvl(:old.mostrar,
               'NULL') != nvl(:new.mostrar,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_TIPO_CABLE',
                                  'ID',
                                  v_pk_value,
                                  'MOSTRAR',
                                  :old.mostrar,
                                  :new.mostrar);

        end if;

        if nvl(:old.grupo_cables,
               'NULL') != nvl(:new.grupo_cables,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_TIPO_CABLE',
                                  'ID',
                                  v_pk_value,
                                  'GRUPO_CABLES',
                                  :old.grupo_cables,
                                  :new.grupo_cables);
        end if;

        if nvl(:old.comentarios,
               'NULL') != nvl(:new.comentarios,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_TIPO_CABLE',
                                  'ID',
                                  v_pk_value,
                                  'COMENTARIOS',
                                  :old.comentarios,
                                  :new.comentarios);
        end if;

    elsif deleting then
        if :old.nombre is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_TIPO_CABLE',
                                  'ID',
                                  v_pk_value,
                                  'NOMBRE',
                                  :old.nombre,
                                  null);
        end if;

        if :old.mostrar is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_TIPO_CABLE',
                                  'ID',
                                  v_pk_value,
                                  'MOSTRAR',
                                  :old.mostrar,
                                  null);

        end if;

        if :old.grupo_cables is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_TIPO_CABLE',
                                  'ID',
                                  v_pk_value,
                                  'GRUPO_CABLES',
                                  :old.grupo_cables,
                                  null);
        end if;

        if :old.comentarios is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_TIPO_CABLE',
                                  'ID',
                                  v_pk_value,
                                  'COMENTARIOS',
                                  :old.comentarios,
                                  null);
        end if;

    end if;

exception
    when others then
        null;
end trg_audit_sgt_tipo_cable;
/

alter trigger wksp_dtesc.trg_audit_sgt_tipo_cable enable;


-- sqlcl_snapshot {"hash":"37f829b9fef7279fdbda83088b34355c5c934877","type":"TRIGGER","name":"TRG_AUDIT_SGT_TIPO_CABLE","schemaName":"WKSP_DTESC","sxml":""}