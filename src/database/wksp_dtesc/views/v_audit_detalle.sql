create or replace force editionable view wksp_dtesc.v_audit_detalle (
    audit_id,
    id_registro,
    tabla,
    nombre_registro,
    usuario,
    usuario_bd,
    ip_address,
    app_id,
    page_id,
    tipo_operacion,
    accion,
    campo,
    valor_anterior,
    valor_nuevo,
    tipo_cambio,
    modulo,
    criticidad,
    categoria_campo,
    periodo,
    fecha_hora,
    fecha,
    hora,
    dia_semana,
    mes_anio,
    longitud_valor,
    es_critico,
    es_hoy,
    es_eliminacion,
    tipo_horario,
    tabla_campo,
    modulo_detallado,
    ranking_cambio_tabla,
    secuencia_cambio_registro
) as
    select
        audit_id,
        id_registro,
        tabla,
        nombre_registro,
        usuario,
        usuario_bd,
        ip_address,
        app_id,
        page_id,
        tipo_operacion,
        accion,
        campo,
        valor_anterior,
        valor_nuevo,
        tipo_cambio,
        modulo,
        criticidad,
        categoria_campo,
        periodo,
        fecha_hora,
        fecha,
        hora,
        to_char(fecha_hora, 'Day')        as dia_semana,
        to_char(fecha_hora, 'Month YYYY') as mes_anio,
        case
            when valor_anterior is null then
                length(valor_nuevo)
            when valor_nuevo is null then
                length(valor_anterior)
            else
                greatest(
                    length(valor_anterior),
                    length(valor_nuevo)
                )
        end                               as longitud_valor,
        case
            when criticidad = 'ALTA' then
                1
            else
                0
        end                               as es_critico,
        case
            when periodo = 'HOY' then
                1
            else
                0
        end                               as es_hoy,
        case
            when accion = 'DELETE' then
                1
            else
                0
        end                               as es_eliminacion,
        case
            when hora between '08:00:00' and '14:59:59' then
                'HORARIO_LABORAL'
            when hora between '14:00:00' and '19:59:59' then
                'HORARIO_EXTENDIDO'
            else
                'HORARIO_NOCTURNO'
        end                               as tipo_horario,  
      
    -- Para agrupaciones en reportes  
        tabla
        || ' - '
        || campo                          as tabla_campo,
        modulo
        || ' ('
        || tabla
        || ')'                            as modulo_detallado,  
      
    -- Ranking de cambios por usuario (útil para análisis)  
        dense_rank()
        over(partition by tabla
             order by
                 fecha_hora desc
        )                                 as ranking_cambio_tabla,  
      
    -- Secuencia de cambios por registro  
        row_number()
        over(partition by tabla, id_registro
             order by
                 fecha_hora desc
        )                                 as secuencia_cambio_registro
    from
        v_audit_general
    order by
        fecha_hora desc,
        tabla,
        campo;


-- sqlcl_snapshot {"hash":"7375aca6a02cd48c6a18a2a8d5d7b85934e6920a","type":"VIEW","name":"V_AUDIT_DETALLE","schemaName":"WKSP_DTESC","sxml":""}