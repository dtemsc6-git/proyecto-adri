create or replace force editionable view wksp_dtesc.v_audit_general (
    audit_id,
    usuario,
    usuario_bd,
    accion,
    fecha_hora,
    fecha,
    hora,
    app_id,
    page_id,
    ip_address,
    tabla,
    campo,
    valor_anterior,
    valor_nuevo,
    id_registro,
    columna_pk,
    tipo_operacion,
    tipo_cambio,
    modulo,
    criticidad,
    periodo,
    categoria_campo,
    nombre_registro
) as
    select
        am.audit_id,
        am.apex_user                        as usuario,
        am.db_user                          as usuario_bd,
        am.action_type                      as accion,
        am.timestamp                        as fecha_hora,
        to_char(am.timestamp, 'DD/MM/YYYY') as fecha,
        to_char(am.timestamp, 'HH24:MI:SS') as hora,
        am.app_id,
        am.page_id,
        am.ip_address,
        ad.table_name                       as tabla,
        ad.column_name                      as campo,
        ad.old_value                        as valor_anterior,
        ad.new_value                        as valor_nuevo,
        ad.pk_value                         as id_registro,
        ad.pk_column                        as columna_pk,
        case
            when am.action_type = 'INSERT' then
                'Creación'
            when am.action_type = 'UPDATE' then
                'Modificación'
            when am.action_type = 'DELETE' then
                'Eliminación'
            else
                am.action_type
        end                                 as tipo_operacion,
        case
            when ad.old_value is null
                 and ad.new_value is not null then
                'CREADO'
            when ad.old_value is not null
                 and ad.new_value is null then
                'ELIMINADO'
            when ad.old_value != ad.new_value then
                'MODIFICADO'
            else
                'SIN_CAMBIO'
        end                                 as tipo_cambio,
        case
            when ad.table_name = 'SGT_SITIOS'                then
                'Gestión de Sitios'
            when ad.table_name = 'SGT_EQUIPOS'               then
                'Gestión de Equipos'
            when ad.table_name = 'SGT_INTERFACES'            then
                'Gestión de Interfaces'
            when ad.table_name = 'SGT_ENLACES_FO'            then
                'Gestión de Enlaces de Fibra Óptica'
            when ad.table_name = 'SGT_ENLACES_TRAMOS'        then
                'Gestión de Enlaces - Tramos' 
       -- WHEN ad.TABLE_NAME = 'SGT_ENLACES_LOGICOS' THEN 'Gestión de Enlaces Lógicos' 
       -- WHEN ad.TABLE_NAME = 'SGT_ENLACE_LOGICO_TRAMO' THEN 'Gestión de Enlace Lógico - Tramos' 
            when ad.table_name = 'SGT_SERVICIOS'             then
                'Gestión de Servicios'
            when ad.table_name = 'SGT_RACKS'                 then
                'Gestión de Racks'
            when ad.table_name = 'SGT_CONEXIONES_SERVICIO'   then
                'Gestión de Conexiones - Servicio'
            when ad.table_name = 'SGT_ENLACES_WAN_SERVICIO'  then
                'Gestión de Servicios - Enlaces WAN'
            when ad.table_name = 'SGT_CONEXIONES_ENLACE_WAN' then
                'Gestión de Conexiones - Enlace WAN'
            when ad.table_name = 'SGT_SITIOS_SERVICIO'       then
                'Gestión de Sitios - Servicios'
            when ad.table_name = 'SGT_SITIOS_ENLACE_WAN'     then
                'Gestión de Sitios - Enlaces WAN'
            when ad.table_name = 'SGT_ZONAS'                 then
                'Gestión de Zonas'
            when ad.table_name = 'SGT_TIPO_INTERFAZ'         then
                'Gestión de Tipos de Interfaz'
            when ad.table_name = 'SGT_TIPO_EQUIPOS'          then
                'Gestión de Tipos de Equipos'
            when ad.table_name = 'SGT_TIPO_CABLE'            then
                'Gestión de Tipos de Cable'
            when ad.table_name = 'SGT_SALAS'                 then
                'Gestión de Salas'
            when ad.table_name = 'SGT_DEPTO'                 then
                'Gestión de Departamentos'
            when ad.table_name = 'SGT_CIUDAD'                then
                'Gestión de Ciudades'
            else
                replace(ad.table_name, 'SGT_', 'Sistema ')
        end                                 as modulo,
        case  
        -- Criticidad basada en el campo principalmente, con DELETE como excepción 
            when ad.column_name in ( 'ESTADO', 'ACTIVO', 'PRECIO', 'COSTO', 'VALOR',
                                     'NOMBRE', 'IP_GESTION', 'VERSION_SOFTWARE', 'SITIO_ID', 'TX_EN_DBM',
                                     'RX_EN_DBM', 'MAC_ADDRESS', 'CERTIFICACIÓN', 'ABS_LONGITUD', 'TIPO_CONEXION',
                                     'SITIO_A_ID', 'SITIO_B_ID', 'EQUIPO_A_ID', 'EQUIPO_B_ID', 'INTERFAZ_A_ID',
                                     'INTERFAZ_B_ID', 'ENLACE_LOGICO_ID', 'ENLACE_WAN_ID', 'TRAMO_ID', 'SERVICIO_ID',
                                     'NIVEL_DE_PRIORIDAD', 'SALA_ID', 'CAPITAL', 'DEPTO_ID' ) then
                'ALTA'
            when ad.column_name in ( 'TIPO_EQUIPO_ID', 'MARCA', 'MODELO', 'SERIAL_NUMBER', 'VERSION_HARDWARE',
                                     'MODO', 'DUPLEX', 'TIPO_INTERFACE_ID', 'NUMERO_SERIE', 'HW_VERSION',
                                     'SW_VERSION', 'SITIO_ID_A', 'SITIO_ID_B', 'EQUIPO_ID_A', 'EQUIPO_ID_B',
                                     'TIPO_DE_FO', 'TIPO', 'CANTIDAD_DE_PELOS', 'LADO_ID', 'GRUPO_RED',
                                     'ALTURA_U', 'VALOR', 'MOSTRAR', 'GRUPO_CABLES', 'SIGLAS' ) then
                'MEDIA'
            when ad.column_name in ( 'ENLACE_ID', 'COMENTARIOS', 'OBSERVACIONES', 'OBSERVACION', 'PROYECTO_DE_IMPLEMENTACIÓN',
                                     'PROYECTO_ID', 'FECHA_IMPLEMENTACIÓN', 'FECHA_IMPLE', 'UNIDAD_ENCARGADA_ACTUAL', 'UNIDAD_ENCARGADA'
                                     ,
                                     'PROPIETARIO', 'ETIQUETA', 'TIPO_CABLE', 'TIPO_TENDIDO', 'CONECTOR',
                                     'LT', 'UNIDAD_MEDIDA', 'INFORMACIÓN_ADICIONAL', 'DETALLE', 'DIMENSIONES' ) then
                'BAJA' 
        -- DELETE siempre es ALTA independientemente del campo 
            when am.action_type = 'DELETE' then
                'ALTA' 
        -- INSERT por defecto es MEDIA si no está clasificado específicamente 
            when am.action_type = 'INSERT' then
                'MEDIA'
            else
                'BAJA'
        end                                 as criticidad,
        case
            when am.timestamp >= sysdate - 1  then
                'HOY'
            when am.timestamp >= sysdate - 7  then
                'ESTA_SEMANA'
            when am.timestamp >= sysdate - 30 then
                'ESTE_MES'
            else
                'ANTERIOR'
        end                                 as periodo, 
 
    -- Categorización de campos para análisis 
        case
            when ad.column_name in ( 'NOMBRE', 'SIGLAS', 'NI_ANDE', 'SERIAL_NUMBER', 'NUMERO_SERIE',
                                     'ETIQUETA' ) then
                'IDENTIFICACIÓN'
            when ad.column_name in ( 'ESTADO', 'ACTIVO', 'MODO', 'DUPLEX', 'NIVEL_DE_PRIORIDAD' ) then
                'ESTADO'
            when ad.column_name in ( 'TIPO_EQUIPO_ID', 'SUB_TIPO_EQUIPO', 'TIPO_DE_SITIO', 'TIPO_RED', 'TIPO_INTERFACE_ID',
                                     'TIPO_DE_FO', 'TIPO', 'TIPO_CABLE', 'TIPO_TENDIDO', 'TIPO_CONEXION' ) then
                'CLASIFICACIÓN'
            when ad.column_name in ( 'MARCA', 'MODELO', 'VERSION_HARDWARE', 'HW_VERSION' ) then
                'HARDWARE'
            when ad.column_name in ( 'VERSION_SOFTWARE', 'VERSION_PATCH', 'SW_VERSION' ) then
                'SOFTWARE'
            when ad.column_name in ( 'IP_GESTION', 'TIPO_RED', 'MAC_ADDRESS' ) then
                'CONECTIVIDAD'
            when ad.column_name in ( 'SITIO_ID', 'RACK_ID', 'U', 'ALTURA_U', 'POSICION',
                                     'ZONA_ID', 'CIUDAD_ID', 'LATITUD', 'LONGITUD', 'UBICACIÓN',
                                     'EQUIPO_ID', 'SITIO_ID_A', 'SITIO_ID_B', 'EQUIPO_ID_A', 'EQUIPO_ID_B',
                                     'EQUIPO_A_ID', 'EQUIPO_B_ID', 'LADO_ID', 'SITIO_A_ID', 'SITIO_B_ID',
                                     'SALA_ID', 'DIMENSIONES', 'PARENT_ID', 'DEPTO_ID', 'CAPITAL' ) then
                'UBICACIÓN'
            when ad.column_name in ( 'ALIMENTACION1_ID', 'ALIMENTACION2_ID' ) then
                'INFRAESTRUCTURA'
            when ad.column_name in ( 'UNIDAD_ENCARGADA', 'PROPIETARIO', 'UNIDAD_ENCARGADA_ACTUAL' ) then
                'RESPONSABILIDAD'
            when ad.column_name in ( 'PROYECTO_ID', 'FECHA_IMPLE', 'PROYECTO_DE_IMPLEMENTACIÓN', 'FECHA_IMPLEMENTACIÓN' ) then
                'GESTIÓN'
            when ad.column_name in ( 'OBSERVACION', 'OBSERVACIONES', 'COMENTARIOS', 'DESCRIPCION', 'DETALLE',
                                     'VALOR', 'MOSTRAR', 'GRUPO_CABLES' ) then
                'DOCUMENTACIÓN'
            when ad.column_name in ( 'TX_EN_DBM', 'RX_EN_DBM' ) then
                'SEÑAL_ÓPTICA'
            when ad.column_name in ( 'CERTIFICACIÓN', 'ABS_LONGITUD', 'UNIDAD_MEDIDA', 'CANTIDAD_DE_PELOS', 'LT',
                                     'CONECTOR' ) then
                'FIBRA_ÓPTICA'
            when ad.column_name in ( 'INTERFAZ_A_ID', 'INTERFAZ_B_ID', 'ENLACE_ID', 'ENLACE_WAN_ID', 'GRUPO_RED',
                                     'ENLACE_LOGICO_ID', 'TRAMO_ID', 'SERVICIO_ID' ) then
                'CONECTIVIDAD_LÓGICA'
            else
                'OTROS'
        end                                 as categoria_campo, 
 
    -- Información contextual del registro 
        case
            when ad.table_name = 'SGT_SITIOS'                then
                coalesce((
                    select
                        s.nombre
                    from
                        sgt_sitios s
                    where
                        s.id = to_number(ad.pk_value)
                ),
                         'Sitio ID: ' || ad.pk_value)
            when ad.table_name = 'SGT_EQUIPOS'               then
                coalesce((
                    select
                        e.nombre
                    from
                        sgt_equipos e
                    where
                        e.id = to_number(ad.pk_value)
                ),
                         'Equipo ID: ' || ad.pk_value)
            when ad.table_name = 'SGT_INTERFACES'            then
                coalesce((
                    select
                        i.nombre
                    from
                        sgt_interfaces i
                    where
                        i.id = to_number(ad.pk_value)
                ),
                         'Interface ID: ' || ad.pk_value)
            when ad.table_name = 'SGT_ENLACES_FO'            then
                coalesce((
                    select
                        ef.nombre
                    from
                        sgt_enlaces_fo ef
                    where
                        ef.id = to_number(ad.pk_value)
                ),
                         'Enlace FO ID: ' || ad.pk_value)
            when ad.table_name = 'SGT_ENLACES_TRAMOS'        then
                coalesce((
                    select
                        et.nombre
                    from
                        sgt_enlaces_tramos et
                    where
                        et.id = to_number(ad.pk_value)
                ),
                         'Enlace Tramo ID: ' || ad.pk_value) 
       /* WHEN ad.TABLE_NAME = 'SGT_ENLACES_LOGICOS' THEN  
            COALESCE( 
                (SELECT el.NOMBRE FROM SGT_ENLACES_LOGICOS el WHERE el.ID = TO_NUMBER(ad.PK_VALUE)), 
                'Enlace Lógico ID: ' || ad.PK_VALUE 
            )*/
            when ad.table_name = 'SGT_SERVICIOS'             then
                coalesce((
                    select
                        s.nombre
                    from
                        sgt_servicios s
                    where
                        s.id = to_number(ad.pk_value)
                ),
                         'Servicio ID: ' || ad.pk_value)
            when ad.table_name = 'SGT_RACKS'                 then
                coalesce((
                    select
                        r.nombre
                    from
                        sgt_racks r
                    where
                        r.id = to_number(ad.pk_value)
                ),
                         'Rack ID: ' || ad.pk_value)
            when ad.table_name = 'SGT_ZONAS'                 then
                coalesce((
                    select
                        z.nombre
                    from
                        sgt_zonas z
                    where
                        z.id = to_number(ad.pk_value)
                ),
                         'Zona ID: ' || ad.pk_value)
            when ad.table_name = 'SGT_TIPO_INTERFAZ'         then
                coalesce((
                    select
                        ti.nombre
                    from
                        sgt_tipo_interfaz ti
                    where
                        ti.id = to_number(ad.pk_value)
                ),
                         'Tipo Interfaz ID: ' || ad.pk_value)
            when ad.table_name = 'SGT_TIPO_EQUIPOS'          then
                coalesce((
                    select
                        te.nombre
                    from
                        sgt_tipo_equipos te
                    where
                        te.id = to_number(ad.pk_value)
                ),
                         'Tipo Equipo ID: ' || ad.pk_value)
            when ad.table_name = 'SGT_TIPO_CABLE'            then
                coalesce((
                    select
                        tc.nombre
                    from
                        sgt_tipo_cable tc
                    where
                        tc.id = to_number(ad.pk_value)
                ),
                         'Tipo Cable ID: ' || ad.pk_value)
            when ad.table_name = 'SGT_SALAS'                 then
                coalesce((
                    select
                        s.nombre
                    from
                        sgt_salas s
                    where
                        s.id = to_number(ad.pk_value)
                ),
                         'Sala ID: ' || ad.pk_value)
            when ad.table_name = 'SGT_DEPTO'                 then
                coalesce((
                    select
                        d.nombre
                    from
                        sgt_depto d
                    where
                        d.id = to_number(ad.pk_value)
                ),
                         'Departamento ID: ' || ad.pk_value)
            when ad.table_name = 'SGT_CIUDAD'                then
                coalesce((
                    select
                        c.nombre
                    from
                        sgt_ciudad c
                    where
                        c.id = to_number(ad.pk_value)
                ),
                         'Ciudad ID: ' || ad.pk_value) 
        /*WHEN ad.TABLE_NAME = 'SGT_ENLACE_LOGICO_TRAMO' THEN  
            'Relación Enlace-Tramo ID: ' || ad.PK_VALUE || 
            COALESCE( 
                ' (EL:' || (SELECT elt.ENLACE_LOGICO_ID FROM SGT_ENLACE_LOGICO_TRAMO elt WHERE elt.ID = TO_NUMBER(ad.PK_VALUE)) || 
                ' - TR:' || (SELECT elt.TRAMO_ID FROM SGT_ENLACE_LOGICO_TRAMO elt WHERE elt.ID = TO_NUMBER(ad.PK_VALUE)) || ')', 
                '' 
            )*/
            when ad.table_name = 'SGT_CONEXIONES_SERVICIO'   then
                'Conexión Servicio ID: '
                || ad.pk_value
                || coalesce(' (SRV:'
                            ||(
                    select
                        cs.servicio_id
                    from
                        sgt_conexiones_servicio cs
                    where
                        cs.id = to_number(ad.pk_value)
                )
                            || ' - ENL_TRAMO:'
                            ||(
                    select
                        cs.enlace_tramo_id
                    from
                        sgt_conexiones_servicio cs
                    where
                        cs.id = to_number(ad.pk_value)
                )
                            || ')',
                            '')
            when ad.table_name = 'SGT_ENLACES_WAN_SERVICIO'  then
                'Relación Servicio-Enlace WAN ID: '
                || ad.pk_value
                || coalesce(' (SRV:'
                            ||(
                    select
                        ews.servicio_id
                    from
                        sgt_enlaces_wan_servicio ews
                    where
                        ews.id = to_number(ad.pk_value)
                )
                            || ' - ENL:'
                            ||(
                    select
                        ews.enlace_id
                    from
                        sgt_enlaces_wan_servicio ews
                    where
                        ews.id = to_number(ad.pk_value)
                )
                            || ')',
                            '')
            when ad.table_name = 'SGT_SITIOS_ENLACE_WAN'     then
                'Relación Sitio-Enlace WAN ID: '
                || ad.pk_value
                || coalesce(' (SITIO:'
                            ||(
                    select
                        sew.sitio_id
                    from
                        sgt_sitios_enlace_wan sew
                    where
                        sew.id = to_number(ad.pk_value)
                )
                            || ' - ENL_WAN:'
                            ||(
                    select
                        sew.enlace_wan_id
                    from
                        sgt_sitios_enlace_wan sew
                    where
                        sew.id = to_number(ad.pk_value)
                )
                            || ')',
                            '')
            when ad.table_name = 'SGT_CONEXIONES_ENLACE_WAN' then
                'Conexión Enlace WAN ID: '
                || ad.pk_value
                || coalesce(' (ENL_TRAMO:'
                            ||(
                    select
                        cew.enlace_tramo_id
                    from
                        sgt_conexiones_enlace_wan cew
                    where
                        cew.id = to_number(ad.pk_value)
                )
                            || ' - ENL_WAN:'
                            ||(
                    select
                        cew.enlace_wan_id
                    from
                        sgt_conexiones_enlace_wan cew
                    where
                        cew.id = to_number(ad.pk_value)
                )
                            || ')',
                            '')
            when ad.table_name = 'SGT_SITIOS_SERVICIO'       then
                'Relación Sitio-Servicio ID: '
                || ad.pk_value
                || coalesce(' (SITIO:'
                            ||(
                    select
                        sss.sitio_id
                    from
                        sgt_sitios_servicio sss
                    where
                        sss.id = to_number(ad.pk_value)
                )
                            || ' - SRV:'
                            ||(
                    select
                        sss.servicio_id
                    from
                        sgt_sitios_servicio sss
                    where
                        sss.id = to_number(ad.pk_value)
                )
                            || ')',
                            '')
            else
                'Registro ID: ' || ad.pk_value
        end                                 as nombre_registro
    from
             audit_master am
        join audit_detail ad on am.audit_id = ad.audit_id
    order by
        am.timestamp desc,
        ad.column_name;


-- sqlcl_snapshot {"hash":"35d2020a8c6d9f636dffa9f47a65aeb34b3b3304","type":"VIEW","name":"V_AUDIT_GENERAL","schemaName":"WKSP_DTESC","sxml":""}