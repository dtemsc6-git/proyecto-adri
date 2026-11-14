create or replace force editionable view wksp_dtesc.v_audit_dashboard_ejecutivo (
    modulo,
    total_cambios,
    registros_afectados,
    usuarios_activos,
    cambios_criticos,
    cambios_medios,
    cambios_bajos,
    cambios_hoy,
    cambios_semana,
    cambios_mes,
    total_inserts,
    total_updates,
    total_deletes,
    primer_cambio,
    ultimo_cambio,
    pct_criticos,
    pct_hoy,
    ranking_actividad
) as
    with datos_modulos as (
        select
            modulo,
            count(*)                    as total_cambios,
            count(distinct id_registro) as registros_afectados,
            count(distinct usuario)     as usuarios_activos,
            sum(
                case
                    when criticidad = 'ALTA' then
                        1
                    else
                        0
                end
            )                           as cambios_criticos,
            sum(
                case
                    when criticidad = 'MEDIA' then
                        1
                    else
                        0
                end
            )                           as cambios_medios,
            sum(
                case
                    when criticidad = 'BAJA' then
                        1
                    else
                        0
                end
            )                           as cambios_bajos,
            sum(
                case
                    when periodo = 'HOY' then
                        1
                    else
                        0
                end
            )                           as cambios_hoy,
            sum(
                case
                    when periodo = 'ESTA_SEMANA' then
                        1
                    else
                        0
                end
            )                           as cambios_semana,
            sum(
                case
                    when periodo = 'ESTE_MES' then
                        1
                    else
                        0
                end
            )                           as cambios_mes,
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
            to_char(
                min(fecha_hora),
                'DD/MM/YYYY HH24:MI'
            )                           as primer_cambio,
            to_char(
                max(fecha_hora),
                'DD/MM/YYYY HH24:MI'
            )                           as ultimo_cambio,
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
                  2)                    as pct_criticos,
            round((sum(
                case
                    when periodo = 'HOY' then
                        1
                    else
                        0
                end
            ) * 100.0 / nullif(
                count(*),
                0
            )),
                  2)                    as pct_hoy
        from
            v_audit_general
        where
            fecha_hora >= sysdate - 30  -- Últimos 30 días  
        group by
            modulo
    ), totales_generales as (
        select
            'RESUMEN GENERAL'           as modulo,
            count(*)                    as total_cambios,
            count(distinct id_registro) as registros_afectados,
            count(distinct usuario)     as usuarios_activos,
            sum(
                case
                    when criticidad = 'ALTA' then
                        1
                    else
                        0
                end
            )                           as cambios_criticos,
            sum(
                case
                    when criticidad = 'MEDIA' then
                        1
                    else
                        0
                end
            )                           as cambios_medios,
            sum(
                case
                    when criticidad = 'BAJA' then
                        1
                    else
                        0
                end
            )                           as cambios_bajos,
            sum(
                case
                    when periodo = 'HOY' then
                        1
                    else
                        0
                end
            )                           as cambios_hoy,
            sum(
                case
                    when periodo = 'ESTA_SEMANA' then
                        1
                    else
                        0
                end
            )                           as cambios_semana,
            sum(
                case
                    when periodo = 'ESTE_MES' then
                        1
                    else
                        0
                end
            )                           as cambios_mes,
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
            to_char(
                min(fecha_hora),
                'DD/MM/YYYY HH24:MI'
            )                           as primer_cambio,
            to_char(
                max(fecha_hora),
                'DD/MM/YYYY HH24:MI'
            )                           as ultimo_cambio,
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
                  2)                    as pct_criticos,
            round((sum(
                case
                    when periodo = 'HOY' then
                        1
                    else
                        0
                end
            ) * 100.0 / nullif(
                count(*),
                0
            )),
                  2)                    as pct_hoy
        from
            v_audit_general
        where
            fecha_hora >= sysdate - 30
    )
    select
        modulo,
        total_cambios,
        registros_afectados,
        usuarios_activos,
        cambios_criticos,
        cambios_medios,
        cambios_bajos,
        cambios_hoy,
        cambios_semana,
        cambios_mes,
        total_inserts,
        total_updates,
        total_deletes,
        primer_cambio,
        ultimo_cambio,
        pct_criticos,
        pct_hoy,  
    -- Ranking por actividad  
        case
            when modulo = 'RESUMEN GENERAL' then
                0
            else
                row_number()
                over(
                    order by
                        total_cambios desc
                )
        end as ranking_actividad
    from
        (
            select
                *
            from
                datos_modulos
            union all
            select
                *
            from
                totales_generales
        )
    order by
        case
            when modulo = 'RESUMEN GENERAL' then
                0
            else
                1
        end,
        total_cambios desc;


-- sqlcl_snapshot {"hash":"5c9328bc5dbdb7d2e62fd2381af849dabbe86446","type":"VIEW","name":"V_AUDIT_DASHBOARD_EJECUTIVO","schemaName":"WKSP_DTESC","sxml":""}