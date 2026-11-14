create or replace editionable trigger wksp_dtesc.trg_audit_sgt_equipos after
    insert or update or delete on wksp_dtesc.sgt_equipos
    for each row
declare
    v_action   varchar2(10);
    v_audit_id number;
begin  
    -- Determinar el tipo de operación  
    if inserting then
        v_action := 'INSERT';
    elsif updating then
        v_action := 'UPDATE';
    elsif deleting then
        v_action := 'DELETE';
    end if;  
  
    -- Crear el registro maestro de auditoría usando la función actual  
    v_audit_id := audit_pkg.start_audit('SGT_EQUIPOS', v_action);
    if inserting then  
        -- Campos que pueden ser nulos - solo registrar si tienen valor  
        if :new.unidad_encargada is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'UNIDAD_ENCARGADA',
                                  null,
                                  :new.unidad_encargada);
        end if;

        if :new.rack_id is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'RACK_ID',
                                  null,
                                  to_char(:new.rack_id));

        end if;

        if :new.u is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'U',
                                  null,
                                  to_char(:new.u));
        end if;

        if :new.tipo_red is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'TIPO_RED',
                                  null,
                                  :new.tipo_red);
        end if;

        if :new.nombre is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'NOMBRE',
                                  null,
                                  :new.nombre);
        end if;

        if :new.tipo_equipo_id is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'TIPO_EQUIPO_ID',
                                  null,
                                  to_char(:new.tipo_equipo_id));
        end if;  
          
        /*IF :NEW.SUB_TIPO_EQUIPO IS NOT NULL THEN  
            AUDIT_PKG.LOG_CHANGES(v_audit_id, 'SGT_EQUIPOS', 'ID', :NEW.ID, 'SUB_TIPO_EQUIPO', NULL, :NEW.SUB_TIPO_EQUIPO);  
        END IF; */

        if :new.marca is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'MARCA',
                                  null,
                                  :new.marca);
        end if;

        if :new.modelo is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'MODELO',
                                  null,
                                  :new.modelo);
        end if;

        if :new.estado is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'ESTADO',
                                  null,
                                  :new.estado);
        end if;  
          
        /*IF :NEW.OBSERVACIONES IS NOT NULL THEN  
            AUDIT_PKG.LOG_CHANGES(v_audit_id, 'SGT_EQUIPOS', 'ID', :NEW.ID, 'OBSERVACIONES', NULL, :NEW.OBSERVACIONES);  
        END IF;  */

        if :new.ni_ande is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'NI_ANDE',
                                  null,
                                  :new.ni_ande);
        end if;

        if :new.serial_number is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'SERIAL_NUMBER',
                                  null,
                                  :new.serial_number);
        end if;

        if :new.version_hardware is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'VERSION_HARDWARE',
                                  null,
                                  :new.version_hardware);
        end if;

        if :new.version_software is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'VERSION_SOFTWARE',
                                  null,
                                  :new.version_software);
        end if;

        if :new.version_patch is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'VERSION_PATCH',
                                  null,
                                  :new.version_patch);
        end if;

        if :new.ip_gestion is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'IP_GESTION',
                                  null,
                                  :new.ip_gestion);
        end if;

        if :new.alimentacion1_id is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'ALIMENTACION1_ID',
                                  null,
                                  :new.alimentacion1_id);
        end if;

        if :new.alimentacion2_id is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'ALIMENTACION2_ID',
                                  null,
                                  :new.alimentacion2_id);
        end if;

        if :new.proyecto_id is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'PROYECTO_ID',
                                  null,
                                  :new.proyecto_id);
        end if;

        if :new.fecha_imple is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'FECHA_IMPLE',
                                  null,
                                  to_char(:new.fecha_imple,
                                          'DD/MM/YYYY HH24:MI:SS'));
        end if;

        if :new.altura_u is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'ALTURA_U',
                                  null,
                                  to_char(:new.altura_u));
        end if;

        if :new.posicion is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'POSICION',
                                  null,
                                  :new.posicion);
        end if;

        if :new.sitio_id is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'SITIO_ID',
                                  null,
                                  to_char(:new.sitio_id));
        end if;

    elsif updating then
        if :old.unidad_encargada != :new.unidad_encargada
        or (
            :old.unidad_encargada is null
            and :new.unidad_encargada is not null
        )
        or (
            :old.unidad_encargada is not null
            and :new.unidad_encargada is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'UNIDAD_ENCARGADA',
                                  :old.unidad_encargada,
                                  :new.unidad_encargada);
        end if;

        if :old.rack_id != :new.rack_id
        or (
            :old.rack_id is null
            and :new.rack_id is not null
        )
        or (
            :old.rack_id is not null
            and :new.rack_id is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'RACK_ID',
                                  to_char(:old.rack_id),
                                  to_char(:new.rack_id));

        end if;

        if :old.u != :new.u
        or (
            :old.u is null
            and :new.u is not null
        )
        or (
            :old.u is not null
            and :new.u is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'U',
                                  to_char(:old.u),
                                  to_char(:new.u));
        end if;

        if :old.tipo_red != :new.tipo_red
        or (
            :old.tipo_red is null
            and :new.tipo_red is not null
        )
        or (
            :old.tipo_red is not null
            and :new.tipo_red is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'TIPO_RED',
                                  :old.tipo_red,
                                  :new.tipo_red);
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
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'NOMBRE',
                                  :old.nombre,
                                  :new.nombre);
        end if;

        if :old.tipo_equipo_id != :new.tipo_equipo_id
        or (
            :old.tipo_equipo_id is null
            and :new.tipo_equipo_id is not null
        )
        or (
            :old.tipo_equipo_id is not null
            and :new.tipo_equipo_id is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'TIPO_EQUIPO_ID',
                                  to_char(:old.tipo_equipo_id),
                                  to_char(:new.tipo_equipo_id));
        end if;  
          
        /*
        IF :OLD.SUB_TIPO_EQUIPO != :NEW.SUB_TIPO_EQUIPO OR   
           (:OLD.SUB_TIPO_EQUIPO IS NULL AND :NEW.SUB_TIPO_EQUIPO IS NOT NULL) OR  
           (:OLD.SUB_TIPO_EQUIPO IS NOT NULL AND :NEW.SUB_TIPO_EQUIPO IS NULL) THEN  
            AUDIT_PKG.LOG_CHANGES(v_audit_id, 'SGT_EQUIPOS', 'ID', :NEW.ID, 'SUB_TIPO_EQUIPO', :OLD.SUB_TIPO_EQUIPO, :NEW.SUB_TIPO_EQUIPO);  
        END IF;  
        */
        if :old.marca != :new.marca
        or (
            :old.marca is null
            and :new.marca is not null
        )
        or (
            :old.marca is not null
            and :new.marca is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'MARCA',
                                  :old.marca,
                                  :new.marca);
        end if;

        if :old.modelo != :new.modelo
        or (
            :old.modelo is null
            and :new.modelo is not null
        )
        or (
            :old.modelo is not null
            and :new.modelo is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'MODELO',
                                  :old.modelo,
                                  :new.modelo);
        end if;

        if :old.estado != :new.estado
        or (
            :old.estado is null
            and :new.estado is not null
        )
        or (
            :old.estado is not null
            and :new.estado is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'ESTADO',
                                  :old.estado,
                                  :new.estado);
        end if;  
          
        /*IF :OLD.OBSERVACIONES != :NEW.OBSERVACIONES OR   
           (:OLD.OBSERVACIONES IS NULL AND :NEW.OBSERVACIONES IS NOT NULL) OR  
           (:OLD.OBSERVACIONES IS NOT NULL AND :NEW.OBSERVACIONES IS NULL) THEN  
            AUDIT_PKG.LOG_CHANGES(v_audit_id, 'SGT_EQUIPOS', 'ID', :NEW.ID, 'OBSERVACIONES', :OLD.OBSERVACIONES, :NEW.OBSERVACIONES);  
        END IF;  */

        if :old.ni_ande != :new.ni_ande
        or (
            :old.ni_ande is null
            and :new.ni_ande is not null
        )
        or (
            :old.ni_ande is not null
            and :new.ni_ande is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'NI_ANDE',
                                  :old.ni_ande,
                                  :new.ni_ande);
        end if;

        if :old.serial_number != :new.serial_number
        or (
            :old.serial_number is null
            and :new.serial_number is not null
        )
        or (
            :old.serial_number is not null
            and :new.serial_number is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'SERIAL_NUMBER',
                                  :old.serial_number,
                                  :new.serial_number);
        end if;

        if :old.version_hardware != :new.version_hardware
        or (
            :old.version_hardware is null
            and :new.version_hardware is not null
        )
        or (
            :old.version_hardware is not null
            and :new.version_hardware is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'VERSION_HARDWARE',
                                  :old.version_hardware,
                                  :new.version_hardware);
        end if;

        if :old.version_software != :new.version_software
        or (
            :old.version_software is null
            and :new.version_software is not null
        )
        or (
            :old.version_software is not null
            and :new.version_software is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'VERSION_SOFTWARE',
                                  :old.version_software,
                                  :new.version_software);
        end if;

        if :old.version_patch != :new.version_patch
        or (
            :old.version_patch is null
            and :new.version_patch is not null
        )
        or (
            :old.version_patch is not null
            and :new.version_patch is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'VERSION_PATCH',
                                  :old.version_patch,
                                  :new.version_patch);
        end if;

        if :old.ip_gestion != :new.ip_gestion
        or (
            :old.ip_gestion is null
            and :new.ip_gestion is not null
        )
        or (
            :old.ip_gestion is not null
            and :new.ip_gestion is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'IP_GESTION',
                                  :old.ip_gestion,
                                  :new.ip_gestion);
        end if;

        if :old.alimentacion1_id != :new.alimentacion1_id
        or (
            :old.alimentacion1_id is null
            and :new.alimentacion1_id is not null
        )
        or (
            :old.alimentacion1_id is not null
            and :new.alimentacion1_id is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'ALIMENTACION1_ID',
                                  :old.alimentacion1_id,
                                  :new.alimentacion1_id);
        end if;

        if :old.alimentacion2_id != :new.alimentacion2_id
        or (
            :old.alimentacion2_id is null
            and :new.alimentacion2_id is not null
        )
        or (
            :old.alimentacion2_id is not null
            and :new.alimentacion2_id is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'ALIMENTACION2_ID',
                                  :old.alimentacion2_id,
                                  :new.alimentacion2_id);
        end if;

        if :old.proyecto_id != :new.proyecto_id
        or (
            :old.proyecto_id is null
            and :new.proyecto_id is not null
        )
        or (
            :old.proyecto_id is not null
            and :new.proyecto_id is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'PROYECTO_ID',
                                  :old.proyecto_id,
                                  :new.proyecto_id);
        end if;

        if :old.fecha_imple != :new.fecha_imple
        or (
            :old.fecha_imple is null
            and :new.fecha_imple is not null
        )
        or (
            :old.fecha_imple is not null
            and :new.fecha_imple is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'FECHA_IMPLE',
                                  to_char(:old.fecha_imple,
                                          'DD/MM/YYYY HH24:MI:SS'),
                                  to_char(:new.fecha_imple,
                                          'DD/MM/YYYY HH24:MI:SS'));
        end if;

        if :old.altura_u != :new.altura_u
        or (
            :old.altura_u is null
            and :new.altura_u is not null
        )
        or (
            :old.altura_u is not null
            and :new.altura_u is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'ALTURA_U',
                                  to_char(:old.altura_u),
                                  to_char(:new.altura_u));
        end if;

        if :old.posicion != :new.posicion
        or (
            :old.posicion is null
            and :new.posicion is not null
        )
        or (
            :old.posicion is not null
            and :new.posicion is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'POSICION',
                                  :old.posicion,
                                  :new.posicion);
        end if;

        if :old.sitio_id != :new.sitio_id
        or (
            :old.sitio_id is null
            and :new.sitio_id is not null
        )
        or (
            :old.sitio_id is not null
            and :new.sitio_id is null
        ) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :new.id,
                                  'SITIO_ID',
                                  to_char(:old.sitio_id),
                                  to_char(:new.sitio_id));
        end if;

    elsif deleting then
        if :old.unidad_encargada is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :old.id,
                                  'UNIDAD_ENCARGADA',
                                  :old.unidad_encargada,
                                  null);
        end if;

        if :old.rack_id is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :old.id,
                                  'RACK_ID',
                                  to_char(:old.rack_id),
                                  null);

        end if;

        if :old.u is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :old.id,
                                  'U',
                                  to_char(:old.u),
                                  null);
        end if;

        if :old.tipo_red is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :old.id,
                                  'TIPO_RED',
                                  :old.tipo_red,
                                  null);
        end if;

        if :old.nombre is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :old.id,
                                  'NOMBRE',
                                  :old.nombre,
                                  null);
        end if;

        if :old.tipo_equipo_id is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :old.id,
                                  'TIPO_EQUIPO_ID',
                                  to_char(:old.tipo_equipo_id),
                                  null);
        end if;  
          
        /*
        IF :OLD.SUB_TIPO_EQUIPO IS NOT NULL THEN  
            AUDIT_PKG.LOG_CHANGES(v_audit_id, 'SGT_EQUIPOS', 'ID', :OLD.ID, 'SUB_TIPO_EQUIPO', :OLD.SUB_TIPO_EQUIPO, NULL);  
        END IF;  
        */

        if :old.marca is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :old.id,
                                  'MARCA',
                                  :old.marca,
                                  null);
        end if;

        if :old.modelo is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :old.id,
                                  'MODELO',
                                  :old.modelo,
                                  null);
        end if;

        if :old.estado is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :old.id,
                                  'ESTADO',
                                  :old.estado,
                                  null);
        end if;  
          
        /*IF :OLD.OBSERVACIONES IS NOT NULL THEN  
            AUDIT_PKG.LOG_CHANGES(v_audit_id, 'SGT_EQUIPOS', 'ID', :OLD.ID, 'OBSERVACIONES', :OLD.OBSERVACIONES, NULL);  
        END IF;  */

        if :old.ni_ande is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :old.id,
                                  'NI_ANDE',
                                  :old.ni_ande,
                                  null);
        end if;

        if :old.serial_number is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :old.id,
                                  'SERIAL_NUMBER',
                                  :old.serial_number,
                                  null);
        end if;

        if :old.version_hardware is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :old.id,
                                  'VERSION_HARDWARE',
                                  :old.version_hardware,
                                  null);
        end if;

        if :old.version_software is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :old.id,
                                  'VERSION_SOFTWARE',
                                  :old.version_software,
                                  null);
        end if;

        if :old.version_patch is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :old.id,
                                  'VERSION_PATCH',
                                  :old.version_patch,
                                  null);
        end if;

        if :old.ip_gestion is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :old.id,
                                  'IP_GESTION',
                                  :old.ip_gestion,
                                  null);
        end if;

        if :old.alimentacion1_id is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :old.id,
                                  'ALIMENTACION1_ID',
                                  :old.alimentacion1_id,
                                  null);
        end if;

        if :old.alimentacion2_id is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :old.id,
                                  'ALIMENTACION2_ID',
                                  :old.alimentacion2_id,
                                  null);
        end if;

        if :old.proyecto_id is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :old.id,
                                  'PROYECTO_ID',
                                  :old.proyecto_id,
                                  null);
        end if;

        if :old.fecha_imple is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :old.id,
                                  'FECHA_IMPLE',
                                  to_char(:old.fecha_imple,
                                          'DD/MM/YYYY HH24:MI:SS'),
                                  null);
        end if;

        if :old.altura_u is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :old.id,
                                  'ALTURA_U',
                                  to_char(:old.altura_u),
                                  null);
        end if;

        if :old.posicion is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :old.id,
                                  'POSICION',
                                  :old.posicion,
                                  null);
        end if;

        if :old.sitio_id is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_EQUIPOS',
                                  'ID',
                                  :old.id,
                                  'SITIO_ID',
                                  to_char(:old.sitio_id),
                                  null);
        end if;

    end if;

exception
    when others then
        null;
end trg_audit_sgt_equipos;
/

alter trigger wksp_dtesc.trg_audit_sgt_equipos enable;


-- sqlcl_snapshot {"hash":"356c7cdcd4d7fcf658f52301d5e576caab50746c","type":"TRIGGER","name":"TRG_AUDIT_SGT_EQUIPOS","schemaName":"WKSP_DTESC","sxml":""}