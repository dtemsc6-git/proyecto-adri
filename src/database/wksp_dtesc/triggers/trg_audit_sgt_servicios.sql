create or replace editionable trigger wksp_dtesc.trg_audit_sgt_servicios after
    insert or update or delete on wksp_dtesc.sgt_servicios
    for each row
declare
    v_audit_id number;
begin  
    -- INSERT  
    if inserting then
        v_audit_id := audit_pkg.start_audit('SGT_SERVICIOS', 'INSERT');
        audit_pkg.log_changes(v_audit_id,
                              'SGT_SERVICIOS',
                              'ID',
                              :new.id,
                              'ID',
                              null,
                              :new.id);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_SERVICIOS',
                              'ID',
                              :new.id,
                              'NOMBRE',
                              null,
                              :new.nombre);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_SERVICIOS',
                              'ID',
                              :new.id,
                              'NIVEL_DE_PRIORIDAD',
                              null,
                              :new.nivel_de_prioridad);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_SERVICIOS',
                              'ID',
                              :new.id,
                              'DESCRIPCION',
                              null,
                              :new.descripcion);

    end if;  
      
    -- UPDATE  
    if updating then
        v_audit_id := audit_pkg.start_audit('SGT_SERVICIOS', 'UPDATE');
        if nvl(:old.nombre,
               'NULL') != nvl(:new.nombre,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SERVICIOS',
                                  'ID',
                                  :new.id,
                                  'NOMBRE',
                                  :old.nombre,
                                  :new.nombre);

        end if;

        if nvl(:old.nivel_de_prioridad,
               -99999) != nvl(:new.nivel_de_prioridad,
                              -99999) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SERVICIOS',
                                  'ID',
                                  :new.id,
                                  'NIVEL_DE_PRIORIDAD',
                                  :old.nivel_de_prioridad,
                                  :new.nivel_de_prioridad);
        end if;

        if nvl(:old.descripcion,
               'NULL') != nvl(:new.descripcion,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SERVICIOS',
                                  'ID',
                                  :new.id,
                                  'DESCRIPCION',
                                  :old.descripcion,
                                  :new.descripcion);
        end if;

    end if;  
      
    -- DELETE  
    if deleting then
        v_audit_id := audit_pkg.start_audit('SGT_SERVICIOS', 'DELETE');
        audit_pkg.log_changes(v_audit_id,
                              'SGT_SERVICIOS',
                              'ID',
                              :old.id,
                              'ID',
                              :old.id,
                              null);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_SERVICIOS',
                              'ID',
                              :old.id,
                              'NOMBRE',
                              :old.nombre,
                              null);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_SERVICIOS',
                              'ID',
                              :old.id,
                              'NIVEL_DE_PRIORIDAD',
                              :old.nivel_de_prioridad,
                              null);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_SERVICIOS',
                              'ID',
                              :old.id,
                              'DESCRIPCION',
                              :old.descripcion,
                              null);

    end if;

exception
    when others then
        null;
end;
/

alter trigger wksp_dtesc.trg_audit_sgt_servicios enable;


-- sqlcl_snapshot {"hash":"177f42ddcd14d8c08888ad7cef8ab9814b9482ca","type":"TRIGGER","name":"TRG_AUDIT_SGT_SERVICIOS","schemaName":"WKSP_DTESC","sxml":""}