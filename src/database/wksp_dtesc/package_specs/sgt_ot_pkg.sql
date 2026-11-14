create or replace package wksp_dtesc.sgt_ot_pkg as
    procedure crear_ot (
        p_tipo_trabajo_id in number,
        p_prioridad_id    in number,
        p_titulo          in varchar2,
        p_descripcion     in varchar2,
        p_reportado_por   in varchar2,
        p_ot_id           out number,
        p_ot_codigo       out varchar2
    );

    procedure asignar_ot (
        p_ot_id            in number,
        p_usuario_asignado in varchar2,
        p_instrucciones    in varchar2,
        p_asignado_por     in varchar2
    );

    procedure vincular_servicio_ot (
        p_ot_id       in number,
        p_servicio_id in number,
        p_usuario     in varchar2
    );

end sgt_ot_pkg;
/


-- sqlcl_snapshot {"hash":"7e3fdb62916d98bd8f8a5b7f44594a815b028c17","type":"PACKAGE_SPEC","name":"SGT_OT_PKG","schemaName":"WKSP_DTESC","sxml":""}