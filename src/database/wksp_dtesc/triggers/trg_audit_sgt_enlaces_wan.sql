create or replace editionable trigger wksp_dtesc.trg_audit_sgt_enlaces_wan after
    insert or update or delete on wksp_dtesc.sgt_enlaces_wan
    for each row
declare
    v_action   varchar2(10);
    v_audit_id number;
begin  
    -- Determinar tipo de operación  
    if inserting then
        v_action := 'INSERT';
    elsif updating then
        v_action := 'UPDATE';
    elsif deleting then
        v_action := 'DELETE';
    end if;

    v_audit_id := audit_pkg.start_audit('SGT_ENLACES_WAN', v_action);
    if inserting then  
        -- Campos obligatorios  
        audit_pkg.log_changes(v_audit_id,
                              'SGT_ENLACES_WAN',
                              'ID',
                              :new.id,
                              'NOMBRE',
                              null,
                              :new.nombre);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_ENLACES_WAN',
                              'ID',
                              :new.id,
                              'GRUPO_RED',
                              null,
                              :new.grupo_red);  
          
        -- Campos de auditoría que pueden ser nulos  
    elsif updating then  
        -- NOMBRE  
        if :old.nombre != :new.nombre
        or (
            :old.nombre is null
            and :new.nombre is not null
        )
        or (
            :old.nombre is not null
            and :new.nombre is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_WAN',
                                  'ID',
                                  :new.id,
                                  'NOMBRE',
                                  :old.nombre,
                                  :new.nombre);
        end if;  
          
        -- GRUPO_RED  
        if :old.grupo_red != :new.grupo_red
        or (
            :old.grupo_red is null
            and :new.grupo_red is not null
        )
        or (
            :old.grupo_red is not null
            and :new.grupo_red is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_WAN',
                                  'ID',
                                  :new.id,
                                  'GRUPO_RED',
                                  :old.grupo_red,
                                  :new.grupo_red);

        end if;  
          
          
          
          
          
          
      
    -- Para eliminaciones - registramos los valores que se están eliminando  
    elsif deleting then
        audit_pkg.log_changes(v_audit_id,
                              'SGT_ENLACES_WAN',
                              'ID',
                              :old.id,
                              'NOMBRE',
                              :old.nombre,
                              null);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_ENLACES_WAN',
                              'ID',
                              :old.id,
                              'GRUPO_RED',
                              :old.grupo_red,
                              null);

    end if;

end;
/

alter trigger wksp_dtesc.trg_audit_sgt_enlaces_wan enable;


-- sqlcl_snapshot {"hash":"d6eed27098934aa0855fde0efdc5eccd22b0ab86","type":"TRIGGER","name":"TRG_AUDIT_SGT_ENLACES_WAN","schemaName":"WKSP_DTESC","sxml":""}