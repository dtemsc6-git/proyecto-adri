create or replace force editionable view wksp_dtesc.v_tarea (
    id,
    entidad,
    pk_id,
    activo_label,
    tipo_activo,
    tipo_tarea_id,
    tipo_tarea,
    tipo_tarea_codigo,
    descripcion,
    estado,
    evento_id,
    tiene_evento,
    comentarios_cant,
    ultimo_comentario,
    creado_por,
    creado_el,
    actualizado_por,
    actualizado_el
) as
    select
        t.id,
        t.entidad,
        t.pk_id,
        case t.entidad
            when 4 then
                (
                    select
                        e.nombre
                    from
                        sgt_equipos e
                    where
                        e.id = t.pk_id
                )
        -- WHEN <sitio>   THEN (SELECT s.NOMBRE        FROM SGT_SITIOS s            WHERE s.ID  = t.PK_ID)
        -- WHEN <sala>    THEN (SELECT sa.NOMBRE       FROM SGT_SALAS sa            WHERE sa.ID = t.PK_ID)
        -- WHEN <rack>    THEN (SELECT r.CODIGO        FROM SGT_RACKS r             WHERE r.ID  = t.PK_ID)
        -- WHEN <enl_fo>  THEN (SELECT f.CODIGO_ENLACE FROM SGT_ENLACE_TRAMOS_FO f  WHERE f.ID  = t.PK_ID)
        -- WHEN <enl_log> THEN (SELECT l.CODIGO        FROM SGT_ENLACES_LOGICOS l   WHERE l.ID  = t.PK_ID)
        -- WHEN <servic>  THEN (SELECT sv.NRO_SERVICIO FROM SGT_SERVICIOS sv        WHERE sv.ID = t.PK_ID)
            else
                null
        end            as activo_label,
        case t.entidad
            when 4 then
                'Equipo'
        -- WHEN <sitio>   THEN 'Sitio'
        -- WHEN <sala>    THEN 'Sala'
        -- WHEN <rack>    THEN 'Rack'
        -- WHEN <enl_fo>  THEN 'Enlace FO'
        -- WHEN <enl_log> THEN 'Enlace logico'
        -- WHEN <servic>  THEN 'Servicio'
            else
                'ENTIDAD ' || t.entidad
        end            as tipo_activo,
        t.tipo_tarea_id,
        ct.nombre      as tipo_tarea,
        ct.codigo      as tipo_tarea_codigo,
        t.descripcion,
        t.estado,
        t.evento_id,
        case
            when t.evento_id is null then
                'No'
            else
                'Si'
        end            as tiene_evento,
        nvl(uc.cnt, 0) as comentarios_cant,
        uc.comentario  as ultimo_comentario,
        t.creado_por,
        t.creado_el,
        t.actualizado_por,
        t.actualizado_el
    from
             sgt_tarea t
        join sgt_cat_tipo_accion_evento ct on ct.id = t.tipo_tarea_id
        left join (
            select
                pk_id,
                comentario,
                cnt
            from
                (
                    select
                        c.pk_id,
                        c.comentario,
                        count(*)
                        over(partition by c.pk_id) as cnt,
                        row_number()
                        over(partition by c.pk_id
                             order by
                                 c.creado_el desc, c.id desc
                        )                          as rn
                    from
                        sgt_comentarios c
                    where
                        c.entidad = 10
                )
            where
                rn = 1
        )                          uc on uc.pk_id = t.id;


-- sqlcl_snapshot {"hash":"166a6545915717a65cae0d0598a41f838d5ce3d1","type":"VIEW","name":"V_TAREA","schemaName":"WKSP_DTESC","sxml":""}