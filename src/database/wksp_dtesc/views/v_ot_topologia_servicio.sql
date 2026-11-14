create or replace force editionable view wksp_dtesc.v_ot_topologia_servicio (
    ot_id,
    servicio_id,
    servicio_nombre,
    sitio_id,
    sitio_siglas,
    sitio_nombre,
    rack_id,
    rack_nombre,
    equipo_id,
    equipo_nombre,
    enlace_tramo_id,
    enlace_tramo_nombre
) as
    select
        os.ot_id,
        s.id      as servicio_id,
        s.nombre  as servicio_nombre,
        ss.sitio_id,
        si.siglas as sitio_siglas,
        si.nombre as sitio_nombre,
        r.id      as rack_id,
        r.nombre  as rack_nombre,
        e.id      as equipo_id,
        e.nombre  as equipo_nombre,
        cs.enlace_tramo_id,
        et.nombre as enlace_tramo_nombre
    from
             sgt_ot_servicio os
        join sgt_servicios           s on s.id = os.servicio_id
        left join sgt_sitios_servicio     ss on ss.servicio_id = os.servicio_id
        left join sgt_sitios              si on si.id = ss.sitio_id
        left join sgt_salas               sa on sa.sitio_id = si.id
        left join sgt_racks               r on r.sala_id = sa.id
        left join sgt_equipos             e on e.rack_id = r.id
        left join sgt_conexiones_servicio cs on cs.servicio_id = os.servicio_id
        left join sgt_enlaces_tramos      et on et.id = cs.enlace_tramo_id;


-- sqlcl_snapshot {"hash":"a489d73dd37178f15821a5024dccb39d6a76893d","type":"VIEW","name":"V_OT_TOPOLOGIA_SERVICIO","schemaName":"WKSP_DTESC","sxml":""}