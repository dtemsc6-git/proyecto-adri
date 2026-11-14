create or replace package wksp_dtesc.sgt_tarea_pkg as
    c_entidad_comentario_tarea constant number := 10;

    -- Alta de tarea. 
    function crear_tarea (
        p_entidad       in number,
        p_pk_id         in number,
        p_tipo_tarea_id in number,
        p_descripcion   in varchar2,
        p_evento_id     in number default null
    ) return number;

    -- Transicion de estado. Si p_nuevo_estado = 'RECHAZADO' exige p_comentario.
    -- Si se pasa p_comentario, se agrega al historial antes de actualizar.
    procedure cambiar_estado (
        p_tarea_id     in number,
        p_nuevo_estado in varchar2,
        p_comentario   in varchar2 default null
    );

    -- Edita tipo y descripcion.
    procedure actualizar_tarea (
        p_tarea_id      in number,
        p_tipo_tarea_id in number,
        p_descripcion   in varchar2
    );

    -- Agrega un comentario al historial de la tarea.
    procedure agregar_comentario (
        p_tarea_id in number,
        p_texto    in varchar2
    );

end sgt_tarea_pkg;
/


-- sqlcl_snapshot {"hash":"30a61f954b0b0e15188e650927c0628f99ec30b0","type":"PACKAGE_SPEC","name":"SGT_TAREA_PKG","schemaName":"WKSP_DTESC","sxml":""}