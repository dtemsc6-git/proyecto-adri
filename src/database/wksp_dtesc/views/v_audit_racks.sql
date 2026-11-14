create or replace force editionable view wksp_dtesc.v_audit_racks (
    audit_id,
    usuario,
    tipo_operacion,
    fecha_hora,
    fecha,
    hora,
    tabla_origen,
    rack_id,
    detalle_old_value,
    detalle_new_value
) as
    select
        am.audit_id,
        am.apex_user                        as usuario,
        am.action_type                      as tipo_operacion,
        am.timestamp                        as fecha_hora,
        to_char(am.timestamp, 'DD/MM/YYYY') as fecha,
        to_char(am.timestamp, 'HH24:MI:SS') as hora,
        'SGT_RACKS'                         as tabla_origen,
        to_number(min(ad.pk_value))         as rack_id,
        listagg(
            case
                when ad.old_value is not null
                     or ad.new_value is not null then
                    ad.column_name
                    || ': '
                    || coalesce(ad.old_value, '[NULL]')
            end,
            ' | ') within group(
        order by
            ad.column_name
        )                                   as detalle_old_value,
        listagg(
            case
                when ad.old_value is not null
                     or ad.new_value is not null then
                    ad.column_name
                    || ': '
                    || coalesce(ad.new_value, '[NULL]')
            end,
            ' | ') within group(
        order by
            ad.column_name
        )                                   as detalle_new_value
    from
             audit_master am
        join audit_detail ad on ad.audit_id = am.audit_id
                                and ad.table_name = 'SGT_RACKS'
    where
        am.action_type not in ( 'INSERT', 'Inserción' )
    group by
        am.audit_id,
        am.apex_user,
        am.action_type,
        am.timestamp
    order by
        am.timestamp desc,
        am.audit_id desc;


-- sqlcl_snapshot {"hash":"4d945fc3fc3c479d0ae9326277d06c1548168eb1","type":"VIEW","name":"V_AUDIT_RACKS","schemaName":"WKSP_DTESC","sxml":""}