create or replace editionable trigger wksp_dtesc.trg_audit_sgt_tipo_equipos after
    insert or update or delete on wksp_dtesc.sgt_tipo_equipos
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
        p_table_name => 'SGT_TIPO_EQUIPOS',
        p_action     => v_action_type
    );
    if inserting then
        if :new.nombre is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_TIPO_EQUIPOS',
                                  'ID',
                                  v_pk_value,
                                  'NOMBRE',
                                  null,
                                  :new.nombre);
        end if;

        if :new.descripcion is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_TIPO_EQUIPOS',
                                  'ID',
                                  v_pk_value,
                                  'DESCRIPCION',
                                  null,
                                  :new.descripcion);

        end if;

    elsif updating then
        if nvl(:old.nombre,
               'NULL') != nvl(:new.nombre,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_TIPO_EQUIPOS',
                                  'ID',
                                  v_pk_value,
                                  'NOMBRE',
                                  :old.nombre,
                                  :new.nombre);
        end if;

        if nvl(:old.descripcion,
               'NULL') != nvl(:new.descripcion,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_TIPO_EQUIPOS',
                                  'ID',
                                  v_pk_value,
                                  'DESCRIPCION',
                                  :old.descripcion,
                                  :new.descripcion);

        end if;

    elsif deleting then
        if :old.nombre is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_TIPO_EQUIPOS',
                                  'ID',
                                  v_pk_value,
                                  'NOMBRE',
                                  :old.nombre,
                                  null);
        end if;

        if :old.descripcion is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_TIPO_EQUIPOS',
                                  'ID',
                                  v_pk_value,
                                  'DESCRIPCION',
                                  :old.descripcion,
                                  null);

        end if;

    end if;

exception
    when others then
        null;
end trg_audit_sgt_tipo_equipos;
/

alter trigger wksp_dtesc.trg_audit_sgt_tipo_equipos enable;


-- sqlcl_snapshot {"hash":"fd1a0364371909193d9bf5cd14d37d0e9c2f2e09","type":"TRIGGER","name":"TRG_AUDIT_SGT_TIPO_EQUIPOS","schemaName":"WKSP_DTESC","sxml":""}