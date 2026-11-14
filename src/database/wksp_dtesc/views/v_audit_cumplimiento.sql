create or replace force editionable view wksp_dtesc.v_audit_cumplimiento (
    tabla,
    campo,
    criticidad,
    categoria_campo,
    modulo,
    frecuencia_cambios,
    usuarios_involucrados,
    registros_afectados,
    total_inserts,
    total_updates,
    total_deletes,
    primer_cambio,
    ultimo_cambio,
    horas_entre_primer_ultimo,
    cambios_horario_laboral,
    cambios_horario_extendido,
    cambios_horario_nocturno,
    cambios_fines_semana,
    nivel_riesgo,
    estado_cumplimiento,
    pct_cambios_criticos,
    pct_eliminaciones,
    pct_horario_nocturno,
    ranking_criticidad
) as
    select   
    -- Información básica  
        tabla,
        campo,
        criticidad,
        categoria_campo,
        modulo,  
      
    -- Métricas de actividad  
        count(*)                    as frecuencia_cambios,
        count(distinct usuario)     as usuarios_involucrados,
        count(distinct id_registro) as registros_afectados,  
      
    -- Análisis por tipo de operación  
        sum(
            case
                when accion = 'INSERT' then
                    1
                else
                    0
            end
        )                           as total_inserts,
        sum(
            case
                when accion = 'UPDATE' then
                    1
                else
                    0
            end
        )                           as total_updates,
        sum(
            case
                when accion = 'DELETE' then
                    1
                else
                    0
            end
        )                           as total_deletes,  
      
    -- Análisis temporal  
        to_char(
            min(fecha_hora),
            'DD/MM/YYYY HH24:MI'
        )                           as primer_cambio,
        to_char(
            max(fecha_hora),
            'DD/MM/YYYY HH24:MI'
        )                           as ultimo_cambio,
        round((cast(max(fecha_hora) as date) - cast(min(fecha_hora) as date)) * 24,
              2)                    as horas_entre_primer_ultimo,  
      
    -- Análisis de cumplimiento por horario  
        sum(
            case
                when to_number(to_char(fecha_hora, 'HH24')) between 8 and 18 then
                    1
                else
                    0
            end
        )                           as cambios_horario_laboral,
        sum(
            case
                when to_number(to_char(fecha_hora, 'HH24')) between 19 and 23 then
                    1
                else
                    0
            end
        )                           as cambios_horario_extendido,
        sum(
            case
                when to_number(to_char(fecha_hora, 'HH24')) between 0 and 7 then
                    1
                else
                    0
            end
        )                           as cambios_horario_nocturno,  
      
    -- Análisis por día de semana  
        sum(
            case
                when to_char(fecha_hora, 'D') in('1', '7') then
                    1
                else
                    0
            end
        )                           as cambios_fines_semana,  
      
    -- Cálculo de nivel de riesgo  
        case
            when tabla in ( 'SGT_SITIOS', 'SGT_EQUIPOS', 'SGT_SERVICIOS', 'SGT_ENLACES_FO', 'SGT_ENLACES_LOGICOS',
                            'SGT_INTERFACES', 'SGT_ENLACES_TRAMOS' )
                 and sum(
                case
                    when accion = 'DELETE' then
                        1
                    else
                        0
                end
            ) > 0 then
                'ALTO_RIESGO'
            when criticidad = 'ALTA'
                 and count(*) > 50 then
                'MEDIO_RIESGO'
            else
                'BAJO_RIESGO'
        end                         as nivel_riesgo,  
      
    -- Estado de cumplimiento  
        case
            when sum(
                    case
                        when accion = 'DELETE' then
                            1
                        else
                            0
                    end
                ) > 0
                 and tabla in ( 'SGT_SITIOS', 'SGT_EQUIPOS', 'SGT_SERVICIOS', 'SGT_ENLACES_FO', 'SGT_ENLACES_LOGICOS',
                                'SGT_INTERFACES', 'SGT_ENLACES_TRAMOS' )
                 and sum(
                case
                    when to_number(to_char(fecha_hora, 'HH24')) between 0 and 7 then
                        1
                    else
                        0
                end
            ) > 0 then
                'VIOLACION_POLITICA'
            when sum(
                    case
                        when to_char(fecha_hora, 'D') in('1', '7') then
                            1
                        else
                            0
                    end
                ) > 0
                 and tabla in ( 'SGT_SITIOS', 'SGT_EQUIPOS', 'SGT_ENLACES_FO', 'SGT_ENLACES_LOGICOS', 'SGT_INTERFACES',
                                'SGT_ENLACES_TRAMOS', 'SGT_SERVICIOS' )
                 and sum(
                case
                    when accion in('UPDATE', 'DELETE') then
                        1
                    else
                        0
                end
            ) > 0 then
                'REVISION_REQUERIDA'
            else
                'CUMPLE_POLITICAS'
        end                         as estado_cumplimiento,  
      
    -- Porcentajes para análisis  
        round((sum(
            case
                when criticidad = 'ALTA' then
                    1
                else
                    0
            end
        ) * 100.0 / nullif(
            count(*),
            0
        )),
              2)                    as pct_cambios_criticos,
        round((sum(
            case
                when accion = 'DELETE' then
                    1
                else
                    0
            end
        ) * 100.0 / nullif(
            count(*),
            0
        )),
              2)                    as pct_eliminaciones,
        round((sum(
            case
                when to_number(to_char(fecha_hora, 'HH24')) between 0 and 7 then
                    1
                else
                    0
            end
        ) * 100.0 / nullif(
            count(*),
            0
        )),
              2)                    as pct_horario_nocturno,  
      
    -- Ranking de criticidad  
        dense_rank()
        over(
            order by
                sum(
                    case
                        when criticidad = 'ALTA' then
                            1
                        else
                            0
                    end
                ) desc,
                count(*) desc
        )                           as ranking_criticidad
    from
        v_audit_general
    where
            criticidad = 'ALTA'  -- Solo cambios críticos para cumplimiento  
        and fecha_hora >= sysdate - 90  -- Últimos 90 días  
    group by
        tabla,
        campo,
        criticidad,
        categoria_campo,
        modulo
    having
        count(*) >= 1  -- Al menos un cambio  
    order by
        frecuencia_cambios desc,
        ultimo_cambio desc;


-- sqlcl_snapshot {"hash":"9c9c8720e936a2c9766c26aa044290eb313f0541","type":"VIEW","name":"V_AUDIT_CUMPLIMIENTO","schemaName":"WKSP_DTESC","sxml":""}