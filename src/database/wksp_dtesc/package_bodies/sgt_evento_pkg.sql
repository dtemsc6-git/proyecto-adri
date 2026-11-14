create or replace package body wksp_dtesc.sgt_evento_pkg as

    procedure iniciar_sesion (
        p_tipo_activo_principal_id in number,
        p_activo_principal_id      in number,
        p_tipo_caso                in varchar2,
        p_titulo                   in varchar2,
        p_descripcion              in varchar2,
        p_reportado_por            in varchar2,
        p_evento_id                out number,
        p_codigo                   out varchar2
    ) is
        v_temp_codigo varchar2(30);
        v_usuario     varchar2(255);
    begin
        v_usuario := nvl(p_reportado_por,
                         nvl(wwv_flow.g_user, user));
        v_temp_codigo := 'TMP-'
                         || substr(
            rawtohex(sys_guid()),
            1,
            20
        );

        insert into sgt_evento_operativo (
            codigo,
            tipo_activo_principal_id,
            activo_principal_id,
            tipo_caso,
            titulo,
            descripcion,
            reportado_por,
            estado,
            creado_por,
            creado_el
        ) values
            ( v_temp_codigo,
              p_tipo_activo_principal_id,
              p_activo_principal_id,
              p_tipo_caso,
              p_titulo,
              p_descripcion,
              v_usuario,
              'ABIERTO',
              v_usuario,
              systimestamp )
        returning id into p_evento_id;

        p_codigo := 'EV-'
                    || to_char(sysdate, 'YYYY')
                    || '-'
                    || lpad(p_evento_id, 6, '0');

        update sgt_evento_operativo
        set
            codigo = p_codigo
        where
            id = p_evento_id;

    end iniciar_sesion;

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
    ) is
    begin
        iniciar_sesion(
            p_tipo_activo_principal_id => p_tipo_activo_principal_id,
            p_activo_principal_id      => p_activo_principal_id,
            p_tipo_caso                => p_tipo_caso,
            p_titulo                   => p_titulo,
            p_descripcion              => p_descripcion,
            p_reportado_por            => p_reportado_por,
            p_evento_id                => p_evento_id,
            p_codigo                   => p_codigo
        );

        registrar_activo(
            p_evento_id            => p_evento_id,
            p_tipo_activo_id       => p_tipo_activo_principal_id,
            p_activo_id            => p_activo_principal_id,
            p_identificador_activo => nvl(p_identificador_activo,
                                          to_char(p_activo_principal_id)),
            p_descripcion_activo   => p_descripcion_activo,
            p_es_principal         => 1,
            p_actualizado_por      => p_reportado_por
        );

    end iniciar_sesion_con_activo;

    procedure registrar_activo (
        p_evento_id            in number,
        p_tipo_activo_id       in number,
        p_activo_id            in number,
        p_identificador_activo in varchar2,
        p_descripcion_activo   in varchar2,
        p_es_principal         in number,
        p_actualizado_por      in varchar2
    ) is
    begin
        insert into sgt_evento_activo (
            evento_id,
            tipo_activo_id,
            activo_id,
            identificador_activo,
            descripcion_activo,
            es_principal,
            creado_por,
            creado_el
        ) values
            ( p_evento_id,
              p_tipo_activo_id,
              p_activo_id,
              p_identificador_activo,
              p_descripcion_activo,
              nvl(p_es_principal, 0),
              nvl(p_actualizado_por,
                  nvl(wwv_flow.g_user, user)),
              systimestamp );

    end registrar_activo;

    procedure registrar_accion (
        p_evento_activo_id    in number,
        p_tipo_accion_id      in number,
        p_accion              in varchar2,
        p_resultado           in varchar2,
        p_detalle             in varchar2,
        p_tiempo_empleado_min in number,
        p_ejecutado_por       in varchar2,
        p_evento_accion_id    out number
    ) is
        v_secuencia number;
        v_usuario   varchar2(255);
    begin
        v_usuario := nvl(p_ejecutado_por,
                         nvl(wwv_flow.g_user, user));
        select
            nvl(
                max(a.secuencia),
                0
            ) + 1
        into v_secuencia
        from
            sgt_evento_accion a
        where
            a.evento_activo_id = p_evento_activo_id;

        insert into sgt_evento_accion (
            evento_activo_id,
            tipo_accion_id,
            accion,
            resultado,
            detalle,
            tiempo_empleado_min,
            ejecutado_por,
            secuencia,
            creado_por,
            creado_el
        ) values
            ( p_evento_activo_id,
              p_tipo_accion_id,
              p_accion,
              nvl(p_resultado, 'PENDIENTE'),
              p_detalle,
              p_tiempo_empleado_min,
              v_usuario,
              v_secuencia,
              v_usuario,
              systimestamp )
        returning id into p_evento_accion_id;

    end registrar_accion;

    procedure editar_accion (
        p_evento_accion_id    in number,
        p_tipo_accion_id      in number,
        p_accion              in varchar2,
        p_resultado           in varchar2,
        p_detalle             in varchar2,
        p_tiempo_empleado_min in number,
        p_evento_activo_id    in number default null
    ) is
    begin
        update sgt_evento_accion
        set
            tipo_accion_id = nvl(p_tipo_accion_id, tipo_accion_id),
            accion = nvl(p_accion, accion),
            resultado = nvl(p_resultado, resultado),
            detalle = p_detalle,
            tiempo_empleado_min = p_tiempo_empleado_min,
            evento_activo_id = nvl(p_evento_activo_id, evento_activo_id)
        where
            id = p_evento_accion_id;

        if sql%rowcount = 0 then
            raise_application_error(-20030, 'Acción no encontrada: ' || p_evento_accion_id);
        end if;

    end editar_accion;

    procedure registrar_subtarea (
        p_evento_accion_id    in number,
        p_subtarea            in varchar2,
        p_resultado           in varchar2,
        p_detalle             in varchar2,
        p_tiempo_empleado_min in number,
        p_ejecutado_por       in varchar2,
        p_evento_subtarea_id  out number
    ) is
        v_secuencia number;
        v_usuario   varchar2(255);
    begin
        v_usuario := nvl(p_ejecutado_por,
                         nvl(wwv_flow.g_user, user));
        select
            nvl(
                max(s.secuencia),
                0
            ) + 1
        into v_secuencia
        from
            sgt_evento_subtarea s
        where
            s.evento_accion_id = p_evento_accion_id;

        insert into sgt_evento_subtarea (
            evento_accion_id,
            subtarea,
            resultado,
            detalle,
            tiempo_empleado_min,
            ejecutado_por,
            secuencia,
            creado_por,
            creado_el
        ) values
            ( p_evento_accion_id,
              p_subtarea,
              nvl(p_resultado, 'PENDIENTE'),
              p_detalle,
              p_tiempo_empleado_min,
              v_usuario,
              v_secuencia,
              v_usuario,
              systimestamp )
        returning id into p_evento_subtarea_id;

    end registrar_subtarea;

    procedure editar_subtarea (
        p_evento_subtarea_id  in number,
        p_subtarea            in varchar2,
        p_resultado           in varchar2,
        p_detalle             in varchar2,
        p_tiempo_empleado_min in number,
        p_evento_accion_id    in number default null
    ) is
    begin
        update sgt_evento_subtarea
        set
            subtarea = nvl(p_subtarea, subtarea),
            resultado = nvl(p_resultado, resultado),
            detalle = p_detalle,
            tiempo_empleado_min = p_tiempo_empleado_min,
            evento_accion_id = nvl(p_evento_accion_id, evento_accion_id)
        where
            id = p_evento_subtarea_id;

        if sql%rowcount = 0 then
            raise_application_error(-20031, 'Subtarea no encontrada: ' || p_evento_subtarea_id);
        end if;

    end editar_subtarea;

    procedure cerrar_sesion (
        p_evento_id     in number,
        p_observaciones in varchar2,
        p_usuario       in varchar2
    ) is
        v_estado         varchar2(30);
        v_total_acciones number;
        v_acc_pendientes number;
        v_sub_pendientes number;
    begin
        select
            estado
        into v_estado
        from
            sgt_evento_operativo
        where
            id = p_evento_id;

        if v_estado = 'CERRADO' then
            raise_application_error(-20040, 'La sesión ya se encuentra cerrada.');
        end if;
        select
            count(1)
        into v_total_acciones
        from
                 sgt_evento_accion a
            join sgt_evento_activo ea on ea.id = a.evento_activo_id
        where
            ea.evento_id = p_evento_id;

        if v_total_acciones = 0 then
            raise_application_error(-20041, 'No se puede cerrar sin acciones registradas.');
        end if;
        select
            count(1)
        into v_acc_pendientes
        from
                 sgt_evento_accion a
            join sgt_evento_activo ea on ea.id = a.evento_activo_id
        where
                ea.evento_id = p_evento_id
            and a.resultado = 'PENDIENTE';

        if v_acc_pendientes > 0 then
            raise_application_error(-20042, 'No se puede cerrar: existen '
                                            || v_acc_pendientes
                                            || ' acción/es pendiente/s.');
        end if;

        select
            count(1)
        into v_sub_pendientes
        from
                 sgt_evento_subtarea s
            join sgt_evento_accion a on a.id = s.evento_accion_id
            join sgt_evento_activo ea on ea.id = a.evento_activo_id
        where
                ea.evento_id = p_evento_id
            and s.resultado = 'PENDIENTE';

        if v_sub_pendientes > 0 then
            raise_application_error(-20043, 'No se puede cerrar: existen '
                                            || v_sub_pendientes
                                            || ' subtarea/s pendiente/s.');
        end if;

        update sgt_evento_operativo
        set
            estado = 'CERRADO',
            fecha_fin_real = systimestamp,
            observaciones_cierre = p_observaciones,
            actualizado_por = nvl(p_usuario,
                                  nvl(wwv_flow.g_user, user)),
            actualizado_el = systimestamp
        where
            id = p_evento_id;

    end cerrar_sesion;

    procedure vincular_ot (
        p_evento_id in number,
        p_ot_id     in number,
        p_usuario   in varchar2
    ) is
    begin
        update sgt_evento_operativo
        set
            ot_id = p_ot_id,
            actualizado_por = nvl(p_usuario,
                                  nvl(wwv_flow.g_user, user)),
            actualizado_el = systimestamp
        where
            id = p_evento_id;

    end vincular_ot;

end sgt_evento_pkg;
/


-- sqlcl_snapshot {"hash":"8e9f06fd1071e6b24a831c26b9e05387a97c912f","type":"PACKAGE_BODY","name":"SGT_EVENTO_PKG","schemaName":"WKSP_DTESC","sxml":""}