create or replace force editionable view wksp_dtesc.v_audit_consolidado (
    audit_id,
    usuario,
    usuario_bd,
    tipo_operacion,
    fecha_hora,
    fecha,
    hora,
    app_id,
    page_id,
    ip_address,
    tabla,
    campos_modificados,
    campos_lista,
    detalle_old_value,
    detalle_new_value,
    modulo,
    tipo_cambio,
    nivel_criticidad,
    turno,
    periodo,
    indicador_visual,
    fecha_hora_filtro
) as
    select  
    -- Información base de AUDIT_MASTER 
        am.audit_id,
        am.apex_user                        as usuario,
        am.db_user                          as usuario_bd,
        am.action_type                      as tipo_operacion,
        am.timestamp                        as fecha_hora,
        to_char(am.timestamp, 'DD/MM/YYYY') as fecha,
        to_char(am.timestamp, 'HH24:MI:SS') as hora,
        am.app_id,
        am.page_id,
        am.ip_address, 
     
    -- Información de la tabla afectada (toma la primera tabla si hay múltiples) 
        (
            select
                ad1.table_name
            from
                audit_detail ad1
            where
                    ad1.audit_id = am.audit_id
                and rownum = 1
        )                                   as tabla, 
     
    -- NUEVO: Número total de campos modificados 
        (
            select
                count(*)
            from
                audit_detail ad2
            where
                ad2.audit_id = am.audit_id
        )                                   as campos_modificados, 
     
    -- NUEVO: Lista concatenada de campos modificados 
        (
            select
                listagg(ad3.column_name, ', ') within group(
                order by
                    ad3.column_name
                )
            from
                audit_detail ad3
            where
                ad3.audit_id = am.audit_id
        )                                   as campos_lista, 
     
    -- Solo valores anteriores concatenados (Campo: Valor_Anterior) 
        (
            select
                listagg(ad4a.column_name
                        || ': '
                        ||
                        case
                            when ad4a.old_value is null then
                                '[NULL]'
                            when length(ad4a.old_value) > 50 then
                                substr(ad4a.old_value, 1, 47)
                                || '...'
                            else
                                ad4a.old_value
                        end,
                        ' | ') within group(
                order by
                    ad4a.column_name
                )
            from
                audit_detail ad4a
            where
                ad4a.audit_id = am.audit_id
        )                                   as detalle_old_value, 
     
    -- Solo valores actuales concatenados (Campo: Valor_Nuevo) 
        (
            select
                listagg(ad4b.column_name
                        || ': '
                        ||
                        case
                            when ad4b.new_value is null then
                                '[NULL]'
                            when length(ad4b.new_value) > 50 then
                                substr(ad4b.new_value, 1, 47)
                                || '...'
                            else
                                ad4b.new_value
                        end,
                        ' | ') within group(
                order by
                    ad4b.column_name
                )
            from
                audit_detail ad4b
            where
                ad4b.audit_id = am.audit_id
        )                                   as detalle_new_value, 
     
    -- Información derivada para compatibilidad con filtros existentes 
        case
            when (
                select
                    ad5.table_name
                from
                    audit_detail ad5
                where
                        ad5.audit_id = am.audit_id
                    and rownum = 1
            ) like 'SGT_EQUIPOS' then
                'GESTION_ACTIVOS'
            when (
                select
                    ad5.table_name
                from
                    audit_detail ad5
                where
                        ad5.audit_id = am.audit_id
                    and rownum = 1
            ) like 'SGT_SITIOS' then
                'GESTION_ACTIVOS'
            when (
                select
                    ad5.table_name
                from
                    audit_detail ad5
                where
                        ad5.audit_id = am.audit_id
                    and rownum = 1
            ) like 'SGT_INTERFACES' then
                'GESTION_ACTIVOS'
            when (
                select
                    ad5.table_name
                from
                    audit_detail ad5
                where
                        ad5.audit_id = am.audit_id
                    and rownum = 1
            ) like 'SGT_ENLACES%' then
                'GESTION_ENLACES'
            when (
                select
                    ad5.table_name
                from
                    audit_detail ad5
                where
                        ad5.audit_id = am.audit_id
                    and rownum = 1
            ) like 'SGT_SERVICIOS%' then
                'GESTION_SERVICIOS'
            else
                'OTROS'
        end                                 as modulo, 
     
    -- Categorización de la transacción 
        case
            when (
                select
                    count(*)
                from
                    audit_detail ad6
                where
                    ad6.audit_id = am.audit_id
            ) = 1  then
                'Cambio Simple'
            when (
                select
                    count(*)
                from
                    audit_detail ad6
                where
                    ad6.audit_id = am.audit_id
            ) <= 5 then
                'Cambio Múltiple'
            else
                'Cambio Masivo'
        end                                 as tipo_cambio, 
     
    -- Nivel de criticidad de la transacción 
        case
            when (
                select
                    ad7.table_name
                from
                    audit_detail ad7
                where
                        ad7.audit_id = am.audit_id
                    and rownum = 1
            ) in ( 'USUARIOS', 'ROLES', 'PERMISOS', 'SGT_USUARIOS' ) then
                'Crítico'
            when (
                select
                    ad7.table_name
                from
                    audit_detail ad7
                where
                        ad7.audit_id = am.audit_id
                    and rownum = 1
            ) like '%CONFIG%'
                 or (
                select
                    ad7.table_name
                from
                    audit_detail ad7
                where
                        ad7.audit_id = am.audit_id
                    and rownum = 1
            ) like '%PARAM%' then
                'Alto'
            when am.action_type in ( 'DELETE', 'Eliminación' ) then
                'Alto'
            when (
                select
                    count(*)
                from
                    audit_detail ad8
                where
                    ad8.audit_id = am.audit_id
            ) > 10 then
                'Alto'
            else
                'Normal'
        end                                 as nivel_criticidad, 
     
    -- Turno laboral 
        case
            when to_char(am.timestamp, 'HH24:MI:SS') between '00:00:00' and '07:59:59' then
                'Nocturno'
            when to_char(am.timestamp, 'HH24:MI:SS') between '08:00:00' and '17:59:59' then
                'Laboral'
            else
                'Vespertino'
        end                                 as turno, 
     
    -- Período relativo 
        case
            when trunc(am.timestamp) = trunc(sysdate)      then
                'Hoy'
            when trunc(am.timestamp) = trunc(sysdate - 1)  then
                'Ayer'
            when trunc(am.timestamp) >= trunc(sysdate - 7) then
                'Esta Semana'
            else
                'Anterior'
        end                                 as periodo,
        case
            when (
                select
                    count(distinct ad9.column_name)
                from
                    audit_detail ad9
                where
                    ad9.audit_id = am.audit_id
            ) > 5 then
                '🔴'
            when (
                select
                    count(distinct ad9.column_name)
                from
                    audit_detail ad9
                where
                    ad9.audit_id = am.audit_id
            ) > 2 then
                '🟡'
            else
                '🟢'
        end                                 as indicador_visual,
        am.timestamp                        as fecha_hora_filtro
    from
        audit_master am
    where
        exists (
            select
                1
            from
                audit_detail ad
            where
                ad.audit_id = am.audit_id
        )
    order by
        am.timestamp desc;


-- sqlcl_snapshot {"hash":"916c3a6eb5ebf31f0735ad96a577253f60dda0dc","type":"VIEW","name":"V_AUDIT_CONSOLIDADO","schemaName":"WKSP_DTESC","sxml":""}