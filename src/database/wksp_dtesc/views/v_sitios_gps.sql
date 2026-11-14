create or replace force editionable view wksp_dtesc.v_sitios_gps (
    id,
    zona_id,
    zona,
    departamento,
    ciudad,
    siglas,
    tipo_sitio,
    lat,
    lon,
    url
) as
    select
        s.id,
        z.id,
        z.nombre,
        d.nombre,
        c.nombre,
        s.siglas,
        s.tipo_de_sitio,
        ( latitud ),
        ( longitud ),
        "UBICACIÓN"
    from
        sgt_sitios s
        left join sgt_ciudad c on s.ciudad_id = c.id
        left join sgt_depto  d on c.depto_id = d.id
        join sgt_zonas  z on s.zona_id = z.id;


-- sqlcl_snapshot {"hash":"e07e0e0a917a02f518f85e97bb1e982c496d6109","type":"VIEW","name":"V_SITIOS_GPS","schemaName":"WKSP_DTESC","sxml":""}