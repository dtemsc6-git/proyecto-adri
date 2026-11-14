create or replace editionable trigger wksp_dtesc.trg_audit_sgt_zonas after
    insert or update or delete on wksp_dtesc.sgt_zonas
    for each row
declare
    v_audit_id    number;
    v_pk_value    varchar2(100);
    v_action_type varchar2(10);
begin  
    -- Determinar el tipo de acción y el valor de la clave primaria  
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
  
    -- Iniciar la auditoría usando el paquete  
    v_audit_id := audit_pkg.start_audit(
        p_table_name => 'SGT_ZONAS',
        p_action     => v_action_type
    );
    if inserting then
        if :new.nombre is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ZONAS',
                                  'ID',
                                  v_pk_value,
                                  'NOMBRE',
                                  null,
                                  :new.nombre);
        end if;

        if :new.parent_id is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ZONAS',
                                  'ID',
                                  v_pk_value,
                                  'PARENT_ID',
                                  null,
                                  to_char(:new.parent_id));

        end if;

        if :new.descripcion is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ZONAS',
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
                                  'SGT_ZONAS',
                                  'ID',
                                  v_pk_value,
                                  'NOMBRE',
                                  :old.nombre,
                                  :new.nombre);
        end if;

        if nvl(:old.parent_id,
               -1) != nvl(:new.parent_id,
                          -1) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ZONAS',
                                  'ID',
                                  v_pk_value,
                                  'PARENT_ID',
                                  to_char(:old.parent_id),
                                  to_char(:new.parent_id));

        end if;

        if nvl(:old.descripcion,
               'NULL') != nvl(:new.descripcion,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ZONAS',
                                  'ID',
                                  v_pk_value,
                                  'DESCRIPCION',
                                  :old.descripcion,
                                  :new.descripcion);
        end if;

    elsif deleting then
        if :old.nombre is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ZONAS',
                                  'ID',
                                  v_pk_value,
                                  'NOMBRE',
                                  :old.nombre,
                                  null);
        end if;

        if :old.parent_id is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ZONAS',
                                  'ID',
                                  v_pk_value,
                                  'PARENT_ID',
                                  to_char(:old.parent_id),
                                  null);

        end if;

        if :old.descripcion is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ZONAS',
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
end trg_audit_sgt_zonas;
/

alter trigger wksp_dtesc.trg_audit_sgt_zonas enable;


-- sqlcl_snapshot {"hash":"9a65b67f5693ae93c63b652fae4cfaffc5e1e868","type":"TRIGGER","name":"TRG_AUDIT_SGT_ZONAS","schemaName":"WKSP_DTESC","sxml":""}