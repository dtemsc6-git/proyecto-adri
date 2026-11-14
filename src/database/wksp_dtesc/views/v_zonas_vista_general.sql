create or replace force editionable view wksp_dtesc.v_zonas_vista_general (
    z_id,
    z_nombre,
    sitio_id,
    sitio_nombre,
    sitio_siglas,
    sala_id,
    sala_nombre,
    sala_siglas,
    rack_id,
    rack_nombre,
    equipo_id,
    equipo_nombre,
    tipo_equipo_id,
    tipo_equipo_nombre
) as
    select
        z.id,
        z.nombre,
        s.id,
        s.nombre,
        s.siglas,
        sa.id,
        sa.nombre,
        sa.siglas,
        ra.id,
        ra.nombre,
        e.id,
        e.nombre,
        te.id,
        te.nombre
    from
             sgt_zonas z
        inner join sgt_sitios       s on z.id = s.zona_id
        inner join sgt_salas        sa on s.id = sa.sitio_id
        inner join sgt_racks        ra on sa.id = ra.sala_id
        inner join sgt_equipos      e on ra.id = e.rack_id
        inner join sgt_tipo_equipos te on te.id = e.tipo_equipo_id
    where
        z.parent_id is not null;


-- sqlcl_snapshot {"hash":"280786e85d543f214612fe91ac541cc05626ed6c","type":"VIEW","name":"V_ZONAS_VISTA_GENERAL","schemaName":"WKSP_DTESC","sxml":""}