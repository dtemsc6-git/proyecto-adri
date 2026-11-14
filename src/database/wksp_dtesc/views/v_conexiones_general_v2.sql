create or replace force editionable view wksp_dtesc.v_conexiones_general_v2 (
    serv_id,
    servicio,
    nivel_de_prioridad,
    eq_id,
    eq,
    iface_id,
    iface,
    eq_b_id,
    eq_b,
    iface_b_id,
    iface_b,
    conn_id,
    tipo_conexion,
    fo_id,
    fo_nombre,
    seq,
    wan_id,
    wan,
    seq_wan
) as
    select
        serv.id                     as serv_id,
        serv.nombre                 as servicio,
        serv.nivel_de_prioridad,
        et.equipo_a_id              as eq_id,
        eq_a.nombre                 as eq,
        et.interfaz_a_id            as iface_id,
        iface_a.nombre              as iface,
        et.equipo_b_id              as eq_b_id,
        eq_b.nombre                 as eq_b,
        et.interfaz_b_id            as iface_b_id,
        iface_b.nombre              as iface_b,
        et.id                       as conn_id,
        et.tipo_conexion,
        fo.id                       as fo_id,
        fo.nombre                   as fo_nombre,
        conexionesserv.seq,
        conexioneswan.enlace_wan_id as wan_id,
        wan.nombre                  as wan,
        conexioneswan.secuencia     as seq_wan
    from
        sgt_enlaces_tramos        et
        left join sgt_conexiones_servicio   conexionesserv on conexionesserv.enlace_tramo_id = et.id
        left join sgt_servicios             serv on serv.id = conexionesserv.servicio_id
        left join sgt_conexiones_enlace_wan conexioneswan on conexioneswan.enlace_tramo_id = et.id
        left join sgt_enlaces_wan           wan on wan.id = conexioneswan.enlace_wan_id
        join sgt_interfaces            iface_a on iface_a.id = et.interfaz_a_id
        join sgt_interfaces            iface_b on iface_b.id = et.interfaz_b_id
        join sgt_equipos               eq_a on eq_a.id = et.equipo_a_id
        join sgt_equipos               eq_b on eq_b.id = et.equipo_b_id
        left join sgt_enlaces_fo            fo on fo.equipo_id_a = et.equipo_a_id
                                       and fo.equipo_id_b = et.equipo_b_id
    order by
        serv.id,
        et.id,
        conexionesserv.seq;


-- sqlcl_snapshot {"hash":"37bc6690bace9bd2053b6b65e12c347123e24698","type":"VIEW","name":"V_CONEXIONES_GENERAL_V2","schemaName":"WKSP_DTESC","sxml":""}