create or replace force editionable view wksp_dtesc.v_archivos_entidades (
    arch_id,
    sitio_id,
    sitio_nombre,
    sala_id,
    sala_nombre,
    rack_id,
    rack_nombre,
    equipo_id,
    equipo_nombre,
    fullname,
    pk_id,
    estado,
    file_name,
    file_mimetype,
    file_charset,
    file_blob,
    creado_por,
    creado_el,
    observaciones,
    internal_attr,
    entidad
) as
    select
        sgt_archivos.id as arch_id,
        sitio.id        as sitio_id,
        sitio.nombre    as sitio_nombre,
        null            as sala_id,
        null            as sala_nombre,
        null            as rack_id,
        null            as rack_nombre,
        null            as equipo_id,
        null            as equipo_nombre,
        sitio.siglas    as fullname,
        pk_id,
        estado,
        file_name,
        file_mimetype,
        file_charset,
        file_blob,
        sgt_archivos.creado_por,
        sgt_archivos.creado_el,
        observaciones,
        internal_attr,
        entidad
    from
             sgt_sitios sitio
        join sgt_archivos on pk_id = sitio.id
    where
        entidad = 1
    union all
    select
        sgt_archivos.id as arch_id,
        sitio.id        as sitio_id,
        sitio.nombre    as sitio_nombre,
        sala.id         as sala_id,
        sala.nombre     as sala_nombre,
        null            as rack_id,
        null            as rack_nombre,
        null            as equipo_id,
        null            as equipo_nombre,
        sitio.siglas
        || '.'
        || sala.siglas  as fullname,
        pk_id,
        estado,
        file_name,
        file_mimetype,
        file_charset,
        file_blob,
        sgt_archivos.creado_por,
        sgt_archivos.creado_el,
        observaciones,
        internal_attr,
        entidad
    from
             sgt_sitios sitio
        join sgt_salas sala on sitio.id = sala.sitio_id
        join sgt_archivos on pk_id = sala.id
    where
        entidad = 2
    union all
    select
        sgt_archivos.id as arch_id,
        sitio.id        as sitio_id,
        sitio.nombre    as sitio_nombre,
        sala.id         as sala_id,
        sala.nombre     as sala_nombre,
        rack.id         as rack_id,
        rack.nombre     as rack_nombre,
        null            as equipo_id,
        null            as equipo_nombre,
        sitio.siglas
        || '.'
        || sala.siglas
        || '.'
        || rack.nombre  as fullname,
        pk_id,
        estado,
        file_name,
        file_mimetype,
        file_charset,
        file_blob,
        sgt_archivos.creado_por,
        sgt_archivos.creado_el,
        observaciones,
        internal_attr,
        entidad
    from
             sgt_sitios sitio
        join sgt_salas sala on sitio.id = sala.sitio_id
        join sgt_racks rack on sala.id = rack.sala_id
        join sgt_archivos on pk_id = rack.id
    where
        entidad = 3
    union all
    select
        sgt_archivos.id  as arch_id,
        sitio.id         as sitio_id,
        sitio.nombre     as sitio_nombre,
        sala.id          as sala_id,
        sala.nombre      as sala_nombre,
        rack.id          as rack_id,
        rack.nombre      as rack_nombre,
        equipo.id        as equipo_id,
        equipo.nombre    as equipo_nombre,
        sitio.siglas
        || '.'
        || sala.siglas
        || '.'
        || rack.nombre
        || '.'
        || equipo.nombre as fullname,
        pk_id,
        sgt_archivos.estado,
        file_name,
        file_mimetype,
        file_charset,
        sgt_archivos.file_blob,
        sgt_archivos.creado_por,
        sgt_archivos.creado_el,
        sgt_archivos.observaciones,
        internal_attr,
        entidad
    from
             sgt_sitios sitio
        join sgt_salas   sala on sitio.id = sala.sitio_id
        join sgt_racks   rack on sala.id = rack.sala_id
        join sgt_equipos equipo on rack.id = equipo.rack_id
        join sgt_archivos on pk_id = equipo.id
    where
        entidad = 4
    union all
    select
        sgt_archivos.id as arch_id,
        null            as sitio_id,
        null            as sitio_nombre,
        null            as sala_id,
        null            as sala_nombre,
        null            as rack_id,
        null            as rack_nombre,
        null            as equipo_id,
        null            as equipo_nombre,
        fo.nombre       as fullname,
        pk_id,
        sgt_archivos.estado,
        file_name,
        file_mimetype,
        file_charset,
        sgt_archivos.file_blob,
        sgt_archivos.creado_por,
        sgt_archivos.creado_el,
        sgt_archivos.observaciones,
        internal_attr,
        entidad
    from
             sgt_enlaces_fo fo
        join sgt_archivos on pk_id = fo.id
    where
        entidad = 5
    union all
    select
        sgt_archivos.id as arch_id,
        null            as sitio_id,
        null            as sitio_nombre,
        null            as sala_id,
        null            as sala_nombre,
        null            as rack_id,
        null            as rack_nombre,
        null            as equipo_id,
        null            as equipo_nombre,
        file_name       as fullname,
        pk_id,
        sgt_archivos.estado,
        file_name,
        file_mimetype,
        file_charset,
        sgt_archivos.file_blob,
        sgt_archivos.creado_por,
        sgt_archivos.creado_el,
        sgt_archivos.observaciones,
        internal_attr,
        entidad
    from
        sgt_archivos
    where
        entidad in ( 6, 7 );


-- sqlcl_snapshot {"hash":"ee96bc68b922a846b06c9f6edd28640621c6cfa4","type":"VIEW","name":"V_ARCHIVOS_ENTIDADES","schemaName":"WKSP_DTESC","sxml":""}