create or replace force editionable view wksp_dtesc.v_legajo_activo (
    tipo_activo,
    activo_id,
    identificador_activo,
    evento_id,
    evento_codigo,
    ot_id,
    actividad,
    resultado,
    detalle,
    fecha_evento,
    usuario_evento
) as
    select
        ta.codigo         as tipo_activo,
        ea.activo_id,
        ea.identificador_activo,
        eo.id             as evento_id,
        eo.codigo         as evento_codigo,
        eo.ot_id,
        a.accion          as actividad,
        a.resultado,
        a.detalle,
        a.fecha_ejecucion as fecha_evento,
        a.ejecutado_por   as usuario_evento
    from
             sgt_evento_accion a
        join sgt_evento_activo          ea on ea.id = a.evento_activo_id
        join sgt_evento_operativo       eo on eo.id = ea.evento_id
        join sgt_cat_tipo_activo_evento ta on ta.id = ea.tipo_activo_id
    union all
    select
        ta.codigo          as tipo_activo,
        ea.activo_id,
        ea.identificador_activo,
        eo.id              as evento_id,
        eo.codigo          as evento_codigo,
        eo.ot_id,
        st.subtarea        as actividad,
        st.resultado,
        st.detalle,
        st.fecha_ejecucion as fecha_evento,
        st.ejecutado_por   as usuario_evento
    from
             sgt_evento_subtarea st
        join sgt_evento_accion          a on a.id = st.evento_accion_id
        join sgt_evento_activo          ea on ea.id = a.evento_activo_id
        join sgt_evento_operativo       eo on eo.id = ea.evento_id
        join sgt_cat_tipo_activo_evento ta on ta.id = ea.tipo_activo_id
    union all
    select
        ta.codigo                                 as tipo_activo,
        nvl(ea.activo_id, eo.activo_principal_id) as activo_id,
        ea.identificador_activo,
        eo.id                                     as evento_id,
        eo.codigo                                 as evento_codigo,
        eo.ot_id,
        'Evidencia: ' || ev.nombre_archivo        as actividad,
        'CARGADO'                                 as resultado,
        ev.descripcion                            as detalle,
        ev.fecha_carga                            as fecha_evento,
        ev.cargado_por                            as usuario_evento
    from
             sgt_evento_evidencia ev
        join sgt_evento_operativo       eo on eo.id = ev.evento_id
        left join sgt_evento_accion          a on a.id = ev.evento_accion_id
        left join sgt_evento_activo          ea on ea.id = a.evento_activo_id
        left join sgt_cat_tipo_activo_evento ta on ta.id = nvl(ea.tipo_activo_id, eo.tipo_activo_principal_id);


-- sqlcl_snapshot {"hash":"819a4291d9035e3ba985cc1fe6cb3be713367721","type":"VIEW","name":"V_LEGAJO_ACTIVO","schemaName":"WKSP_DTESC","sxml":""}