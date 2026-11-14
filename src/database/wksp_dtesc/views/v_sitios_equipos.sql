create or replace force editionable view wksp_dtesc.v_sitios_equipos (
    sitio_id,
    equipo_id
) as
    select
        ss.id sitio_id,
        e.id  equipo_id
    from
             sgt_equipos e
        inner join sgt_racks  r on e.rack_id = r.id
        inner join sgt_salas  s on r.sala_id = s.id
        inner join sgt_sitios ss on s.sitio_id = ss.id;


-- sqlcl_snapshot {"hash":"3957fa3636e026dd14112393d0f64adcd1571df6","type":"VIEW","name":"V_SITIOS_EQUIPOS","schemaName":"WKSP_DTESC","sxml":""}