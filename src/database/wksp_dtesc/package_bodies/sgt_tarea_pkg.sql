create or replace package body wksp_dtesc.sgt_tarea_pkg as

    function usuario_actual return varchar2 is
        v_user varchar2(255);
    begin
        begin
            v_user := nvl(apex_application.g_user, user);
        exception
            when others then
                v_user := user;
        end;

        return v_user;
    end usuario_actual;

    function es_anotacion (
        p_tipo_tarea_id in number
    ) return boolean is
        v_codigo sgt_cat_tipo_accion_evento.codigo%type;
    begin
        select
            codigo
        into v_codigo
        from
            sgt_cat_tipo_accion_evento
        where
            id = p_tipo_tarea_id;

        return ( v_codigo = 'ANOTACION' );
    exception
        when no_data_found then
            raise_application_error(-20010, 'Tipo de tarea inexistente: ' || p_tipo_tarea_id);
    end es_anotacion;

    procedure agregar_comentario (
        p_tarea_id in number,
        p_texto    in varchar2
    ) is
        v_user varchar2(255);
    begin
        if p_texto is null then
            raise_application_error(-20013, 'El comentario no puede estar vacio.');
        end if;
        v_user := usuario_actual;
        insert into sgt_comentarios (
            entidad,
            pk_id,
            comentario,
            creado_por,
            creado_el
        ) values
            ( c_entidad_comentario_tarea,
              p_tarea_id,
              p_texto,
              v_user,
              systimestamp );

    end agregar_comentario;

    function crear_tarea (
        p_entidad       in number,
        p_pk_id         in number,
        p_tipo_tarea_id in number,
        p_descripcion   in varchar2,
        p_evento_id     in number default null
    ) return number is
        v_id     sgt_tarea.id%type;
        v_estado sgt_tarea.estado%type;
        v_user   varchar2(255);
    begin
        if p_entidad is null
           or p_pk_id is null then
            raise_application_error(-20011, 'La tarea debe asociarse a un activo (entidad + pk_id).');
        end if;

        if p_descripcion is null then
            raise_application_error(-20012, 'La descripcion de la tarea es obligatoria.');
        end if;
        v_estado :=
            case
                when es_anotacion(p_tipo_tarea_id) then
                    null
                else
                    'PENDIENTE'
            end;
        v_user := usuario_actual;
        insert into sgt_tarea (
            evento_id,
            entidad,
            pk_id,
            tipo_tarea_id,
            descripcion,
            estado,
            creado_por,
            creado_el
        ) values
            ( p_evento_id,
              p_entidad,
              p_pk_id,
              p_tipo_tarea_id,
              p_descripcion,
              v_estado,
              v_user,
              systimestamp )
        returning id into v_id;

        return v_id;
    end crear_tarea;

    procedure cambiar_estado (
        p_tarea_id     in number,
        p_nuevo_estado in varchar2,
        p_comentario   in varchar2 default null
    ) is
        v_tipo_id sgt_tarea.tipo_tarea_id%type;
        v_user    varchar2(255);
    begin
        if p_nuevo_estado not in ( 'PENDIENTE', 'REALIZADO', 'RECHAZADO' ) then
            raise_application_error(-20014, 'Estado invalido: ' || p_nuevo_estado);
        end if;

        begin
            select
                tipo_tarea_id
            into v_tipo_id
            from
                sgt_tarea
            where
                id = p_tarea_id;

        exception
            when no_data_found then
                raise_application_error(-20017, 'Tarea inexistente: ' || p_tarea_id);
        end;

        if es_anotacion(v_tipo_id) then
            raise_application_error(-20015, 'Una anotacion no maneja estado.');
        end if;
        if
            p_nuevo_estado = 'RECHAZADO'
            and p_comentario is null
        then
            raise_application_error(-20016, 'Para rechazar una tarea debes indicar el motivo.');
        end if;

        if p_comentario is not null then
            agregar_comentario(p_tarea_id, p_comentario);
        end if;
        v_user := usuario_actual;
        update sgt_tarea
        set
            estado = p_nuevo_estado,
            actualizado_por = v_user,
            actualizado_el = systimestamp
        where
            id = p_tarea_id;

    end cambiar_estado;

    procedure actualizar_tarea (
        p_tarea_id      in number,
        p_tipo_tarea_id in number,
        p_descripcion   in varchar2
    ) is
        v_estado sgt_tarea.estado%type;
        v_user   varchar2(255);
    begin
        if p_descripcion is null then
            raise_application_error(-20012, 'La descripcion de la tarea es obligatoria.');
        end if;
        begin
            select
                estado
            into v_estado
            from
                sgt_tarea
            where
                id = p_tarea_id;

        exception
            when no_data_found then
                raise_application_error(-20017, 'Tarea inexistente: ' || p_tarea_id);
        end;

        if es_anotacion(p_tipo_tarea_id) then
            v_estado := null;
        elsif v_estado is null then
            v_estado := 'PENDIENTE';
        end if;

        v_user := usuario_actual;
        update sgt_tarea
        set
            tipo_tarea_id = p_tipo_tarea_id,
            descripcion = p_descripcion,
            estado = v_estado,
            actualizado_por = v_user,
            actualizado_el = systimestamp
        where
            id = p_tarea_id;

    end actualizar_tarea;

end sgt_tarea_pkg;
/


-- sqlcl_snapshot {"hash":"95925a3350fd2b38fae6568af7b3d8896b63b78f","type":"PACKAGE_BODY","name":"SGT_TAREA_PKG","schemaName":"WKSP_DTESC","sxml":""}