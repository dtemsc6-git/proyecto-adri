create or replace package body wksp_dtesc.sgt_ot_pkg as

    procedure crear_ot (
        p_tipo_trabajo_id in number,
        p_prioridad_id    in number,
        p_titulo          in varchar2,
        p_descripcion     in varchar2,
        p_reportado_por   in varchar2,
        p_ot_id           out number,
        p_ot_codigo       out varchar2
    ) is
    begin
        insert into sgt_ot (
            tipo_trabajo_id,
            prioridad_id,
            titulo,
            descripcion,
            reportado_por,
            creado_por
        ) values
            ( p_tipo_trabajo_id,
              p_prioridad_id,
              p_titulo,
              p_descripcion,
              p_reportado_por,
              nvl(wwv_flow.g_user, user) )
        returning id,
                  codigo into p_ot_id, p_ot_codigo;

        insert into sgt_ot_historial (
            ot_id,
            estado_destino_id,
            tipo_evento,
            detalle,
            usuario_evento
        )
            select
                p_ot_id,
                est.id,
                'CREACION',
                'Creacion de OT',
                nvl(wwv_flow.g_user, user)
            from
                sgt_cat_ot_estado est
            where
                est.codigo = 'NUEVO';

    end crear_ot;

    procedure asignar_ot (
        p_ot_id            in number,
        p_usuario_asignado in varchar2,
        p_instrucciones    in varchar2,
        p_asignado_por     in varchar2
    ) is

        v_estado_nuevo_id    number;
        v_estado_asignado_id number;
        v_codigo_ot          varchar2(30);
        v_tipo_trabajo       varchar2(100);
        v_prioridad          varchar2(100);
    begin
        select
            id
        into v_estado_nuevo_id
        from
            sgt_cat_ot_estado
        where
            codigo = 'NUEVO';

        select
            id
        into v_estado_asignado_id
        from
            sgt_cat_ot_estado
        where
            codigo = 'ASIGNADO';

        update sgt_ot
        set
            estado_id = v_estado_asignado_id,
            asignado_a = p_usuario_asignado,
            instrucciones_jefatura = p_instrucciones,
            fecha_asignacion = systimestamp
        where
                id = p_ot_id
            and estado_id = v_estado_nuevo_id;

        if sql%rowcount = 0 then
            raise_application_error(-20031, 'La OT no existe o no esta en estado NUEVO.');
        end if;
        insert into sgt_ot_asignacion (
            ot_id,
            usuario_asignado,
            asignado_por,
            instrucciones_jefatura
        ) values
            ( p_ot_id,
              p_usuario_asignado,
              p_asignado_por,
              p_instrucciones );

        insert into sgt_ot_historial (
            ot_id,
            estado_origen_id,
            estado_destino_id,
            tipo_evento,
            detalle,
            usuario_evento
        ) values
            ( p_ot_id,
              v_estado_nuevo_id,
              v_estado_asignado_id,
              'ASIGNACION',
              'Asignado a ' || p_usuario_asignado,
              p_asignado_por );

        select
            o.codigo,
            tt.nombre,
            pr.nombre
        into
            v_codigo_ot,
            v_tipo_trabajo,
            v_prioridad
        from
                 sgt_ot o
            join sgt_cat_ot_tipo_trabajo tt on tt.id = o.tipo_trabajo_id
            join sgt_cat_ot_prioridad    pr on pr.id = o.prioridad_id
        where
            o.id = p_ot_id;

        insert into sgt_ot_notificacion (
            ot_id,
            usuario_destino,
            tipo,
            mensaje
        ) values
            ( p_ot_id,
              p_usuario_asignado,
              'ASIGNACION',
              'Nueva OT '
              || v_codigo_ot
              || ' | Tipo: '
              || v_tipo_trabajo
              || ' | Prioridad: '
              || v_prioridad );

    end asignar_ot;

    procedure vincular_servicio_ot (
        p_ot_id       in number,
        p_servicio_id in number,
        p_usuario     in varchar2
    ) is
        v_ot_estado_id       number;
        v_estado_nuevo_id    number;
        v_estado_asignado_id number;
    begin
        select
            estado_id
        into v_ot_estado_id
        from
            sgt_ot
        where
            id = p_ot_id;

        select
            id
        into v_estado_nuevo_id
        from
            sgt_cat_ot_estado
        where
            codigo = 'NUEVO';

        select
            id
        into v_estado_asignado_id
        from
            sgt_cat_ot_estado
        where
            codigo = 'ASIGNADO';

        if v_ot_estado_id not in ( v_estado_nuevo_id, v_estado_asignado_id ) then
            raise_application_error(-20032, 'Solo se puede vincular servicio en estado NUEVO o ASIGNADO.');
        end if;

        insert into sgt_ot_servicio (
            ot_id,
            servicio_id,
            creado_por
        ) values
            ( p_ot_id,
              p_servicio_id,
              p_usuario );

        insert into sgt_ot_historial (
            ot_id,
            tipo_evento,
            detalle,
            usuario_evento
        ) values
            ( p_ot_id,
              'VINCULACION_SERVICIO',
              'Servicio vinculado ID=' || to_char(p_servicio_id),
              p_usuario );

    end vincular_servicio_ot;

end sgt_ot_pkg;
/


-- sqlcl_snapshot {"hash":"d33f395860c1a6f5293cd5b7c51b511ba3771a51","type":"PACKAGE_BODY","name":"SGT_OT_PKG","schemaName":"WKSP_DTESC","sxml":""}