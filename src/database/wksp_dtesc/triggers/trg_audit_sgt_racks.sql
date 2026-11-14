create or replace editionable trigger wksp_dtesc.trg_audit_sgt_racks after
    insert or update or delete on wksp_dtesc.sgt_racks
    for each row
declare
    v_audit_id number;
begin  
    -- INSERT  
    if inserting then
        v_audit_id := audit_pkg.start_audit('SGT_RACKS', 'INSERT');
        audit_pkg.log_changes(v_audit_id,
                              'SGT_RACKS',
                              'ID',
                              :new.id,
                              'ID',
                              null,
                              :new.id);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_RACKS',
                              'ID',
                              :new.id,
                              'SALA_ID',
                              null,
                              :new.sala_id);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_RACKS',
                              'ID',
                              :new.id,
                              'NOMBRE',
                              null,
                              :new.nombre);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_RACKS',
                              'ID',
                              :new.id,
                              'DETALLE',
                              null,
                              :new.detalle);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_RACKS',
                              'ID',
                              :new.id,
                              'UNIDAD_ENCARGADA',
                              null,
                              :new.unidad_encargada);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_RACKS',
                              'ID',
                              :new.id,
                              'MARCA',
                              null,
                              :new.marca);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_RACKS',
                              'ID',
                              :new.id,
                              'MODELO',
                              null,
                              :new.modelo);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_RACKS',
                              'ID',
                              :new.id,
                              'DIMENSIONES',
                              null,
                              :new.dimensiones);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_RACKS',
                              'ID',
                              :new.id,
                              'ALTURA_U',
                              null,
                              :new.altura_u);

    end if;  
      
    -- UPDATE  
    if updating then
        v_audit_id := audit_pkg.start_audit('SGT_RACKS', 'UPDATE');
        if nvl(:old.sala_id,
               -99999) != nvl(:new.sala_id,
                              -99999) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_RACKS',
                                  'ID',
                                  :new.id,
                                  'SALA_ID',
                                  :old.sala_id,
                                  :new.sala_id);

        end if;

        if nvl(:old.nombre,
               'NULL') != nvl(:new.nombre,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_RACKS',
                                  'ID',
                                  :new.id,
                                  'NOMBRE',
                                  :old.nombre,
                                  :new.nombre);
        end if;

        if nvl(:old.detalle,
               'NULL') != nvl(:new.detalle,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_RACKS',
                                  'ID',
                                  :new.id,
                                  'DETALLE',
                                  :old.detalle,
                                  :new.detalle);
        end if;

        if nvl(:old.unidad_encargada,
               'NULL') != nvl(:new.unidad_encargada,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_RACKS',
                                  'ID',
                                  :new.id,
                                  'UNIDAD_ENCARGADA',
                                  :old.unidad_encargada,
                                  :new.unidad_encargada);
        end if;

        if nvl(:old.marca,
               'NULL') != nvl(:new.marca,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_RACKS',
                                  'ID',
                                  :new.id,
                                  'MARCA',
                                  :old.marca,
                                  :new.marca);
        end if;

        if nvl(:old.modelo,
               'NULL') != nvl(:new.modelo,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_RACKS',
                                  'ID',
                                  :new.id,
                                  'MODELO',
                                  :old.modelo,
                                  :new.modelo);
        end if;

        if nvl(:old.dimensiones,
               'NULL') != nvl(:new.dimensiones,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_RACKS',
                                  'ID',
                                  :new.id,
                                  'DIMENSIONES',
                                  :old.dimensiones,
                                  :new.dimensiones);
        end if;

        if nvl(:old.altura_u,
               'NULL') != nvl(:new.altura_u,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_RACKS',
                                  'ID',
                                  :new.id,
                                  'ALTURA_U',
                                  :old.altura_u,
                                  :new.altura_u);
        end if;

    end if;  
      
    -- DELETE  
    if deleting then
        v_audit_id := audit_pkg.start_audit('SGT_RACKS', 'DELETE');
        audit_pkg.log_changes(v_audit_id,
                              'SGT_RACKS',
                              'ID',
                              :old.id,
                              'ID',
                              :old.id,
                              null);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_RACKS',
                              'ID',
                              :old.id,
                              'SALA_ID',
                              :old.sala_id,
                              null);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_RACKS',
                              'ID',
                              :old.id,
                              'NOMBRE',
                              :old.nombre,
                              null);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_RACKS',
                              'ID',
                              :old.id,
                              'DETALLE',
                              :old.detalle,
                              null);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_RACKS',
                              'ID',
                              :old.id,
                              'UNIDAD_ENCARGADA',
                              :old.unidad_encargada,
                              null);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_RACKS',
                              'ID',
                              :old.id,
                              'MARCA',
                              :old.marca,
                              null);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_RACKS',
                              'ID',
                              :old.id,
                              'MODELO',
                              :old.modelo,
                              null);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_RACKS',
                              'ID',
                              :old.id,
                              'DIMENSIONES',
                              :old.dimensiones,
                              null);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_RACKS',
                              'ID',
                              :old.id,
                              'ALTURA_U',
                              :old.altura_u,
                              null);

    end if;

exception
    when others then
        null;
end;
/

alter trigger wksp_dtesc.trg_audit_sgt_racks enable;


-- sqlcl_snapshot {"hash":"1d2fce8c2fac92f813f5d9ea4fcdfc69f85a7d9b","type":"TRIGGER","name":"TRG_AUDIT_SGT_RACKS","schemaName":"WKSP_DTESC","sxml":""}