create or replace editionable trigger wksp_dtesc.trg_audit_sgt_enlaces_fo after
    insert or update or delete on wksp_dtesc.sgt_enlaces_fo
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
        p_table_name => 'SGT_ENLACES_FO',
        p_action     => v_action_type
    );
    if inserting then
        audit_pkg.log_changes(v_audit_id,
                              'SGT_ENLACES_FO',
                              'ID',
                              v_pk_value,
                              'ID',
                              null,
                              to_char(:new.id));

        if :new.nombre is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'NOMBRE',
                                  null,
                                  :new.nombre);

        end if;

        if :new.puertos_lado_a is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'PUERTOS_LADO_A',
                                  null,
                                  :new.puertos_lado_a);
        end if;

        if :new.puertos_lado_b is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'PUERTOS_LADO_B',
                                  null,
                                  :new.puertos_lado_b);
        end if;

        if :new.sitio_id_a is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'SITIO_ID_A',
                                  null,
                                  to_char(:new.sitio_id_a));
        end if;

        if :new.equipo_id_a is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'EQUIPO_ID_A',
                                  null,
                                  to_char(:new.equipo_id_a));
        end if;

        if :new.sitio_id_b is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'SITIO_ID_B',
                                  null,
                                  to_char(:new.sitio_id_b));
        end if;

        if :new.equipo_id_b is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'EQUIPO_ID_B',
                                  null,
                                  to_char(:new.equipo_id_b));
        end if;

        if :new.certificación is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'CERTIFICACIÓN',
                                  null,
                                  to_char(:new.certificación));
        end if;

        if :new.unidad_medida is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'UNIDAD_MEDIDA',
                                  null,
                                  :new.unidad_medida);
        end if;

        if :new.abs_longitud is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'ABS_LONGITUD',
                                  null,
                                  to_char(:new.abs_longitud));
        end if;

        if :new.cantidad_de_pelos is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'CANTIDAD_DE_PELOS',
                                  null,
                                  to_char(:new.cantidad_de_pelos));
        end if;

        if :new.tipo_de_fo is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'TIPO_DE_FO',
                                  null,
                                  :new.tipo_de_fo);
        end if;

        if :new.tipo is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'TIPO',
                                  null,
                                  :new.tipo);
        end if;

        if :new.lt is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'LT',
                                  null,
                                  :new.lt);
        end if;

        if :new.conector is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'CONECTOR',
                                  null,
                                  :new.conector);
        end if;

        if :new.estado is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'ESTADO',
                                  null,
                                  :new.estado);
        end if;  
        /*IF :NEW.COMENTARIOS IS NOT NULL THEN  
            AUDIT_PKG.LOG_CHANGES(v_audit_id, 'SGT_ENLACES_FO', 'ID', v_pk_value, 'COMENTARIOS', NULL, :NEW.COMENTARIOS);  
        END IF;  */
        if :new.proyecto_de_implementación is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'PROYECTO_DE_IMPLEMENTACIÓN',
                                  null,
                                  :new.proyecto_de_implementación);
        end if;

        if :new.fecha_implementación is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'FECHA_IMPLEMENTACIÓN',
                                  null,
                                  to_char(:new.fecha_implementación,
                                          'DD/MM/YYYY HH24:MI:SS'));
        end if;

        if :new.unidad_encargada_actual is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'UNIDAD_ENCARGADA_ACTUAL',
                                  null,
                                  :new.unidad_encargada_actual);
        end if;

        if :new.tipo_cable is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'TIPO_CABLE',
                                  null,
                                  :new.tipo_cable);
        end if;

        if :new.tipo_tendido is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'TIPO_TENDIDO',
                                  null,
                                  :new.tipo_tendido);
        end if;

    elsif updating then
        if nvl(:old.id,
               -1) != nvl(:new.id,
                          -1) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'ID',
                                  to_char(:old.id),
                                  to_char(:new.id));
        end if;

        if nvl(:old.nombre,
               'NULL') != nvl(:new.nombre,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'NOMBRE',
                                  :old.nombre,
                                  :new.nombre);

        end if;

        if nvl(:old.puertos_lado_a,
               'NULL') != nvl(:new.puertos_lado_a,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'PUERTOS_LADO_A',
                                  :old.puertos_lado_a,
                                  :new.puertos_lado_a);
        end if;

        if nvl(:old.puertos_lado_b,
               'NULL') != nvl(:new.puertos_lado_b,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'PUERTOS_LADO_B',
                                  :old.puertos_lado_b,
                                  :new.puertos_lado_b);
        end if;

        if nvl(:old.sitio_id_a,
               -1) != nvl(:new.sitio_id_a,
                          -1) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'SITIO_ID_A',
                                  to_char(:old.sitio_id_a),
                                  to_char(:new.sitio_id_a));
        end if;

        if nvl(:old.equipo_id_a,
               -1) != nvl(:new.equipo_id_a,
                          -1) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'EQUIPO_ID_A',
                                  to_char(:old.equipo_id_a),
                                  to_char(:new.equipo_id_a));
        end if;

        if nvl(:old.sitio_id_b,
               -1) != nvl(:new.sitio_id_b,
                          -1) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'SITIO_ID_B',
                                  to_char(:old.sitio_id_b),
                                  to_char(:new.sitio_id_b));
        end if;

        if nvl(:old.equipo_id_b,
               -1) != nvl(:new.equipo_id_b,
                          -1) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'EQUIPO_ID_B',
                                  to_char(:old.equipo_id_b),
                                  to_char(:new.equipo_id_b));
        end if;

        if nvl(:old.certificación,
               -1) != nvl(:new.certificación,
                          -1) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'CERTIFICACIÓN',
                                  to_char(:old.certificación),
                                  to_char(:new.certificación));
        end if;

        if nvl(:old.unidad_medida,
               'NULL') != nvl(:new.unidad_medida,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'UNIDAD_MEDIDA',
                                  :old.unidad_medida,
                                  :new.unidad_medida);
        end if;

        if nvl(:old.abs_longitud,
               -1) != nvl(:new.abs_longitud,
                          -1) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'ABS_LONGITUD',
                                  to_char(:old.abs_longitud),
                                  to_char(:new.abs_longitud));
        end if;

        if nvl(:old.cantidad_de_pelos,
               -1) != nvl(:new.cantidad_de_pelos,
                          -1) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'CANTIDAD_DE_PELOS',
                                  to_char(:old.cantidad_de_pelos),
                                  to_char(:new.cantidad_de_pelos));
        end if;

        if nvl(:old.tipo_de_fo,
               'NULL') != nvl(:new.tipo_de_fo,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'TIPO_DE_FO',
                                  :old.tipo_de_fo,
                                  :new.tipo_de_fo);
        end if;

        if nvl(:old.tipo,
               'NULL') != nvl(:new.tipo,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'TIPO',
                                  :old.tipo,
                                  :new.tipo);
        end if;

        if nvl(:old.lt,
               'NULL') != nvl(:new.lt,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'LT',
                                  :old.lt,
                                  :new.lt);
        end if;

        if nvl(:old.conector,
               'NULL') != nvl(:new.conector,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'CONECTOR',
                                  :old.conector,
                                  :new.conector);
        end if;

        if nvl(:old.estado,
               'NULL') != nvl(:new.estado,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'ESTADO',
                                  :old.estado,
                                  :new.estado);
        end if;  
        /*IF NVL(:OLD.COMENTARIOS, 'NULL') != NVL(:NEW.COMENTARIOS, 'NULL') THEN  
            AUDIT_PKG.LOG_CHANGES(v_audit_id, 'SGT_ENLACES_FO', 'ID', v_pk_value, 'COMENTARIOS', :OLD.COMENTARIOS, :NEW.COMENTARIOS);  
        END IF; */
        if nvl(:old.proyecto_de_implementación,
               'NULL') != nvl(:new.proyecto_de_implementación,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'PROYECTO_DE_IMPLEMENTACIÓN',
                                  :old.proyecto_de_implementación,
                                  :new.proyecto_de_implementación);
        end if;

        if nvl(:old.fecha_implementación,
               to_timestamp('1900-01-01',
               'YYYY-MM-DD')) != nvl(:new.fecha_implementación,
                                     to_timestamp('1900-01-01',
                                     'YYYY-MM-DD')) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'FECHA_IMPLEMENTACIÓN',
                                  to_char(:old.fecha_implementación,
                                          'DD/MM/YYYY HH24:MI:SS'),
                                  to_char(:new.fecha_implementación,
                                          'DD/MM/YYYY HH24:MI:SS'));
        end if;

        if nvl(:old.unidad_encargada_actual,
               'NULL') != nvl(:new.unidad_encargada_actual,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'UNIDAD_ENCARGADA_ACTUAL',
                                  :old.unidad_encargada_actual,
                                  :new.unidad_encargada_actual);
        end if;

        if nvl(:old.tipo_cable,
               'NULL') != nvl(:new.tipo_cable,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'TIPO_CABLE',
                                  :old.tipo_cable,
                                  :new.tipo_cable);
        end if;

        if nvl(:old.tipo_tendido,
               'NULL') != nvl(:new.tipo_tendido,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'TIPO_TENDIDO',
                                  :old.tipo_tendido,
                                  :new.tipo_tendido);
        end if;

    elsif deleting then
        audit_pkg.log_changes(v_audit_id,
                              'SGT_ENLACES_FO',
                              'ID',
                              v_pk_value,
                              'ID',
                              to_char(:old.id),
                              null);

        if :old.nombre is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'NOMBRE',
                                  :old.nombre,
                                  null);

        end if;

        if :old.puertos_lado_a is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'PUERTOS_LADO_A',
                                  :old.puertos_lado_a,
                                  null);
        end if;

        if :old.puertos_lado_b is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'PUERTOS_LADO_B',
                                  :old.puertos_lado_b,
                                  null);
        end if;

        if :old.sitio_id_a is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'SITIO_ID_A',
                                  to_char(:old.sitio_id_a),
                                  null);
        end if;

        if :old.equipo_id_a is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'EQUIPO_ID_A',
                                  to_char(:old.equipo_id_a),
                                  null);
        end if;

        if :old.sitio_id_b is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'SITIO_ID_B',
                                  to_char(:old.sitio_id_b),
                                  null);
        end if;

        if :old.equipo_id_b is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'EQUIPO_ID_B',
                                  to_char(:old.equipo_id_b),
                                  null);
        end if;

        if :old.certificación is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'CERTIFICACIÓN',
                                  to_char(:old.certificación),
                                  null);
        end if;

        if :old.unidad_medida is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'UNIDAD_MEDIDA',
                                  :old.unidad_medida,
                                  null);
        end if;

        if :old.abs_longitud is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'ABS_LONGITUD',
                                  to_char(:old.abs_longitud),
                                  null);
        end if;

        if :old.cantidad_de_pelos is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'CANTIDAD_DE_PELOS',
                                  to_char(:old.cantidad_de_pelos),
                                  null);
        end if;

        if :old.tipo_de_fo is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'TIPO_DE_FO',
                                  :old.tipo_de_fo,
                                  null);
        end if;

        if :old.tipo is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'TIPO',
                                  :old.tipo,
                                  null);
        end if;

        if :old.lt is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'LT',
                                  :old.lt,
                                  null);
        end if;

        if :old.conector is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'CONECTOR',
                                  :old.conector,
                                  null);
        end if;

        if :old.estado is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'ESTADO',
                                  :old.estado,
                                  null);
        end if;  
        /*IF :OLD.COMENTARIOS IS NOT NULL THEN  
            AUDIT_PKG.LOG_CHANGES(v_audit_id, 'SGT_ENLACES_FO', 'ID', v_pk_value, 'COMENTARIOS', :OLD.COMENTARIOS, NULL);  
        END IF;  */
        if :old.proyecto_de_implementación is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'PROYECTO_DE_IMPLEMENTACIÓN',
                                  :old.proyecto_de_implementación,
                                  null);
        end if;

        if :old.fecha_implementación is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'FECHA_IMPLEMENTACIÓN',
                                  to_char(:old.fecha_implementación,
                                          'DD/MM/YYYY HH24:MI:SS'),
                                  null);
        end if;

        if :old.unidad_encargada_actual is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'UNIDAD_ENCARGADA_ACTUAL',
                                  :old.unidad_encargada_actual,
                                  null);
        end if;

        if :old.tipo_cable is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'TIPO_CABLE',
                                  :old.tipo_cable,
                                  null);
        end if;

        if :old.tipo_tendido is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_ENLACES_FO',
                                  'ID',
                                  v_pk_value,
                                  'TIPO_TENDIDO',
                                  :old.tipo_tendido,
                                  null);
        end if;

    end if;

exception
    when others then
        null;
end trg_audit_sgt_enlaces_fo;
/

alter trigger wksp_dtesc.trg_audit_sgt_enlaces_fo enable;


-- sqlcl_snapshot {"hash":"b26d6440473837018820b987b67d94740e0c3307","type":"TRIGGER","name":"TRG_AUDIT_SGT_ENLACES_FO","schemaName":"WKSP_DTESC","sxml":""}