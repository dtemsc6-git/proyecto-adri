create or replace editionable trigger wksp_dtesc.trg_audit_sgt_sitios after
    insert or update or delete on wksp_dtesc.sgt_sitios
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

    v_audit_id := audit_pkg.start_audit('SGT_SITIOS', v_action);
    if inserting then  
        -- Campos obligatorios  
        audit_pkg.log_changes(v_audit_id,
                              'SGT_SITIOS',
                              'ID',
                              :new.id,
                              'SIGLAS',
                              null,
                              :new.siglas);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_SITIOS',
                              'ID',
                              :new.id,
                              'NOMBRE',
                              null,
                              :new.nombre);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_SITIOS',
                              'ID',
                              :new.id,
                              'TIPO_DE_SITIO',
                              null,
                              :new.tipo_de_sitio);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_SITIOS',
                              'ID',
                              :new.id,
                              'PROPIETARIO',
                              null,
                              :new.propietario);  
          
        -- Campos que pueden ser nulos  
        if :new.zona_id is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SITIOS',
                                  'ID',
                                  :new.id,
                                  'ZONA_ID',
                                  null,
                                  to_char(:new.zona_id));
        end if;

        if :new.ciudad_id is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SITIOS',
                                  'ID',
                                  :new.id,
                                  'CIUDAD_ID',
                                  null,
                                  to_char(:new.ciudad_id));
        end if;

        if :new.latitud is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SITIOS',
                                  'ID',
                                  :new.id,
                                  'LATITUD',
                                  null,
                                  :new.latitud);
        end if;

        if :new.longitud is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SITIOS',
                                  'ID',
                                  :new.id,
                                  'LONGITUD',
                                  null,
                                  :new.longitud);
        end if;

        if :new.ubicación is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SITIOS',
                                  'ID',
                                  :new.id,
                                  'UBICACIÓN',
                                  null,
                                  :new.ubicación);
        end if;

    elsif updating then  
        -- Campos obligatorios  
        if :old.siglas != :new.siglas
        or (
            :old.siglas is null
            and :new.siglas is not null
        )
        or (
            :old.siglas is not null
            and :new.siglas is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SITIOS',
                                  'ID',
                                  :new.id,
                                  'SIGLAS',
                                  :old.siglas,
                                  :new.siglas);
        end if;

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
                                  'SGT_SITIOS',
                                  'ID',
                                  :new.id,
                                  'NOMBRE',
                                  :old.nombre,
                                  :new.nombre);

        end if;  
          
        -- TIPO_DE_SITIO  
        if :old.tipo_de_sitio != :new.tipo_de_sitio
        or (
            :old.tipo_de_sitio is null
            and :new.tipo_de_sitio is not null
        )
        or (
            :old.tipo_de_sitio is not null
            and :new.tipo_de_sitio is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SITIOS',
                                  'ID',
                                  :new.id,
                                  'TIPO_DE_SITIO',
                                  :old.tipo_de_sitio,
                                  :new.tipo_de_sitio);
        end if;  
          
        -- PROPIETARIO  
        if :old.propietario != :new.propietario
        or (
            :old.propietario is null
            and :new.propietario is not null
        )
        or (
            :old.propietario is not null
            and :new.propietario is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SITIOS',
                                  'ID',
                                  :new.id,
                                  'PROPIETARIO',
                                  :old.propietario,
                                  :new.propietario);
        end if;  
          
        -- ZONA_ID (campo numérico)  
        if :old.zona_id != :new.zona_id
        or (
            :old.zona_id is null
            and :new.zona_id is not null
        )
        or (
            :old.zona_id is not null
            and :new.zona_id is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SITIOS',
                                  'ID',
                                  :new.id,
                                  'ZONA_ID',
                                  to_char(:old.zona_id),
                                  to_char(:new.zona_id));
        end if;  
          
        -- CIUDAD_ID (campo numérico)  
        if :old.ciudad_id != :new.ciudad_id
        or (
            :old.ciudad_id is null
            and :new.ciudad_id is not null
        )
        or (
            :old.ciudad_id is not null
            and :new.ciudad_id is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SITIOS',
                                  'ID',
                                  :new.id,
                                  'CIUDAD_ID',
                                  to_char(:old.ciudad_id),
                                  to_char(:new.ciudad_id));
        end if;  
          
        -- LATITUD  
        if :old.latitud != :new.latitud
        or (
            :old.latitud is null
            and :new.latitud is not null
        )
        or (
            :old.latitud is not null
            and :new.latitud is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SITIOS',
                                  'ID',
                                  :new.id,
                                  'LATITUD',
                                  :old.latitud,
                                  :new.latitud);
        end if;  
          
        -- LONGITUD  
        if :old.longitud != :new.longitud
        or (
            :old.longitud is null
            and :new.longitud is not null
        )
        or (
            :old.longitud is not null
            and :new.longitud is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SITIOS',
                                  'ID',
                                  :new.id,
                                  'LONGITUD',
                                  :old.longitud,
                                  :new.longitud);
        end if;  
          
        -- UBICACIÓN  
        if :old.ubicación != :new.ubicación
        or (
            :old.ubicación is null
            and :new.ubicación is not null
        )
        or (
            :old.ubicación is not null
            and :new.ubicación is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SITIOS',
                                  'ID',
                                  :new.id,
                                  'UBICACIÓN',
                                  :old.ubicación,
                                  :new.ubicación);
        end if;  
          
      
    -- Para eliminaciones - registramos los valores que se están eliminando  
    elsif deleting then
        audit_pkg.log_changes(v_audit_id,
                              'SGT_SITIOS',
                              'ID',
                              :old.id,
                              'SIGLAS',
                              :old.siglas,
                              null);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_SITIOS',
                              'ID',
                              :old.id,
                              'NOMBRE',
                              :old.nombre,
                              null);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_SITIOS',
                              'ID',
                              :old.id,
                              'TIPO_DE_SITIO',
                              :old.tipo_de_sitio,
                              null);

        audit_pkg.log_changes(v_audit_id,
                              'SGT_SITIOS',
                              'ID',
                              :old.id,
                              'PROPIETARIO',
                              :old.propietario,
                              null);  
          
        -- Campos que pueden ser nulos  
        if :old.zona_id is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SITIOS',
                                  'ID',
                                  :old.id,
                                  'ZONA_ID',
                                  to_char(:old.zona_id),
                                  null);
        end if;

        if :old.ciudad_id is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SITIOS',
                                  'ID',
                                  :old.id,
                                  'CIUDAD_ID',
                                  to_char(:old.ciudad_id),
                                  null);
        end if;

        if :old.latitud is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SITIOS',
                                  'ID',
                                  :old.id,
                                  'LATITUD',
                                  :old.latitud,
                                  null);
        end if;

        if :old.longitud is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SITIOS',
                                  'ID',
                                  :old.id,
                                  'LONGITUD',
                                  :old.longitud,
                                  null);
        end if;

        if :old.ubicación is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_SITIOS',
                                  'ID',
                                  :old.id,
                                  'UBICACIÓN',
                                  :old.ubicación,
                                  null);
        end if;

    end if;

end;
/

alter trigger wksp_dtesc.trg_audit_sgt_sitios enable;


-- sqlcl_snapshot {"hash":"8b087cb5fe157091e9763ee77a57eb9df134cf60","type":"TRIGGER","name":"TRG_AUDIT_SGT_SITIOS","schemaName":"WKSP_DTESC","sxml":""}