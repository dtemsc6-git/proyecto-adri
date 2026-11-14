create or replace package wksp_dtesc.sgt_evento_pkg as
    procedure iniciar_sesion (
        p_tipo_activo_principal_id in number,
        p_activo_principal_id      in number,
        p_tipo_caso                in varchar2,
        p_titulo                   in varchar2,
        p_descripcion              in varchar2,
        p_reportado_por            in varchar2,
        p_evento_id                out number,
        p_codigo                   out varchar2
    );

    procedure iniciar_sesion_con_activo (
        p_tipo_activo_principal_id in number,
        p_activo_principal_id      in number,
        p_tipo_caso                in varchar2,
        p_titulo                   in varchar2,
        p_descripcion              in varchar2,
        p_reportado_por            in varchar2,
        p_identificador_activo     in varchar2,
        p_descripcion_activo       in varchar2,
        p_evento_id                out number,
        p_codigo                   out varchar2
    );

    procedure registrar_activo (
        p_evento_id            in number,
        p_tipo_activo_id       in number,
        p_activo_id            in number,
        p_identificador_activo in varchar2,
        p_descripcion_activo   in varchar2,
        p_es_principal         in number,
        p_actualizado_por      in varchar2
    );

    procedure registrar_accion (
        p_evento_activo_id    in number,
        p_tipo_accion_id      in number,
        p_accion              in varchar2,
        p_resultado           in varchar2,
        p_detalle             in varchar2,
        p_tiempo_empleado_min in number,
        p_ejecutado_por       in varchar2,
        p_evento_accion_id    out number
    );

    procedure editar_accion (
        p_evento_accion_id    in number,
        p_tipo_accion_id      in number,
        p_accion              in varchar2,
        p_resultado           in varchar2,
        p_detalle             in varchar2,
        p_tiempo_empleado_min in number,
        p_evento_activo_id    in number default null
    );

    procedure registrar_subtarea (
        p_evento_accion_id    in number,
        p_subtarea            in varchar2,
        p_resultado           in varchar2,
        p_detalle             in varchar2,
        p_tiempo_empleado_min in number,
        p_ejecutado_por       in varchar2,
        p_evento_subtarea_id  out number
    );

    procedure editar_subtarea (
        p_evento_subtarea_id  in number,
        p_subtarea            in varchar2,
        p_resultado           in varchar2,
        p_detalle             in varchar2,
        p_tiempo_empleado_min in number,
        p_evento_accion_id    in number default null
    );

    procedure cerrar_sesion (
        p_evento_id     in number,
        p_observaciones in varchar2,
        p_usuario       in varchar2
    );

    procedure vincular_ot (
        p_evento_id in number,
        p_ot_id     in number,
        p_usuario   in varchar2
    );

end sgt_evento_pkg;
/


-- sqlcl_snapshot {"hash":"2dd42505c55428000bf5f3cf064c3396e7c2477d","type":"PACKAGE_SPEC","name":"SGT_EVENTO_PKG","schemaName":"WKSP_DTESC","sxml":""}