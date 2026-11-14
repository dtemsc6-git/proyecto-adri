create or replace force editionable view wksp_dtesc.v_servicios (
    id_srv,
    servicio,
    nivel_de_prioridad,
    sitios,
    wan,
    equipo,
    interface,
    fo,
    seq,
    wan_seq
) as
    select
        ss.id,
        ss.nombre      servicio,
        ss.nivel_de_prioridad,
        s.siglas,
        null           as wan,
        equipos.nombre equipo,
        iface.nombre   interface,
        fo.nombre      as fo,
        es.seq,
        null           as wan_seq
    from
             sgt_equipos_servicio es
        join sgt_equipos    equipos on equipos.id = es.equipo_a_id
        left join sgt_interfaces iface on iface.id = es.interfaz_a_id
        left join sgt_sitios     s on s.id = equipos.sitio_id
        left join sgt_servicios  ss on ss.id = es.servicio_id
        left join sgt_enlaces_fo fo on fo.id = es.fo_id
    union
    select
        ss.id,
        ss.nombre      servicio,
        ss.nivel_de_prioridad,
        s.siglas,
        wan.nombre,
        equipos.nombre equipo,
        iface.nombre   interface,
        fo.nombre      as fo,
        es.seq, 
--2026-06-04: DMF: Agregada condicion para ordenar correctamente la secuencia 

        case
            when ew.parent_wan_id is null then
                ew.seq
            else
                ew.seq + parent_wan.seq / 10
        end            as wan_seq
    from
        sgt_equipos_wan      ew
--2026-06-04: Se Agregar consulta para ver los enlaces wan anidados.
        left join sgt_equipos_wan      parent_wan on ew.parent_wan_id = parent_wan.wan_id

--2026-05-29: Se hace un join para mostrar todos los enlaces independiente que tengan servicio o no
        join sgt_enlaces_wan      wan on wan.id = ew.wan_id
        left join sgt_equipos_servicio es on es.wan_id = ew.wan_id
--2026-06-04: Se modifica la condicion del join
        join sgt_equipos          equipos on equipos.id = coalesce(ew.equipo_a_id, parent_wan.equipo_a_id)
        left join sgt_interfaces       iface on iface.id = coalesce(ew.interfaz_a_id, parent_wan.interfaz_a_id)
--Fin de las modificaciones.
        left join sgt_sitios           s on s.id = equipos.sitio_id
        left join sgt_servicios        ss on ss.id = es.servicio_id
--2026-08-01: Falla la consulta para parent wan con FO_ID asignado
        left join sgt_enlaces_fo       fo on fo.id = coalesce(ew.fo_id, parent_wan.fo_id)
    order by
        servicio,
        seq,
        wan_seq;


-- sqlcl_snapshot {"hash":"10d3e59e066ffceb5946a4955b8d826b9ff9c0e7","type":"VIEW","name":"V_SERVICIOS","schemaName":"WKSP_DTESC","sxml":""}