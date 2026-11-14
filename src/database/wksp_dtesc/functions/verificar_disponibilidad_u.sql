create or replace function wksp_dtesc.verificar_disponibilidad_u (
    p_equipo_id in number,
    p_rack_id   in number,
    p_u_inicio  in number,
    p_u_fin     in number,
    p_posicion  in char
) return varchar2 as
    r_valor           varchar2(2);
    v_total_registros number;
    v_espacios_libres number;
begin
    -- Validación básica de parámetros

    apex_debug.log_long_message('VERIFICAR_DISPONIBILIDAD_U: SELECT VERIFICAR_DISPONIBILIDAD_U('
                                || p_equipo_id
                                || ','
                                || p_rack_id
                                || ', '
                                || p_u_inicio
                                || ','
                                || p_u_fin
                                || ','
                                || p_posicion || ') FROM DUAL ');

    if p_u_fin < p_u_inicio then
        apex_debug.log_long_message('VERIFICAR_DISPONIBILIDAD_U check rango invalido: inicio: '
                                    || p_u_inicio
                                    || ', fin: ' || p_u_fin);
        return 'NA'; -- Rango inválido
    end if;

    with pisos ( posicion_u ) as (
        select
            1
        from
            dual
        union all
        select
            posicion_u + 1
        from
            pisos
        where
            posicion_u + 1 <= (
                select
                    altura_u
                from
                    sgt_racks
                where
                    id = p_rack_id
            )
    ), racku as (
        select
            p.posicion_u as u,
            case
                when exists (
                    select
                        1
                    from
                        sgt_equipos e
                    where
                            e.rack_id = p_rack_id
                        and p.posicion_u between e.u and ( e.u + e.altura_u - 1 )
                        and ( e.posicion ) = ( p_posicion )
                        and ( p_equipo_id is null
                              or e.id != p_equipo_id )
                ) then
                    (
                        select
                            e.id
                        from
                            sgt_equipos e
                        where
                                e.rack_id = p_rack_id
                            and p.posicion_u between e.u and ( e.u + e.altura_u - 1 )
                            and e.posicion = ( p_posicion )
                            and ( p_equipo_id is null
                                  or e.id != p_equipo_id )
                            and rownum = 1
                    )
                else
                    null
            end          equipo
        from
            pisos p
    )
    select
        case
            when count(*) = sum(
                case
                    when equipo is null then
                        1
                    else
                        0
                end
            ) then
                'OK'
            else
                'NA'
        end
    into r_valor
    from
        racku
    where
        u between p_u_inicio and p_u_fin;

    apex_debug.log_long_message('VERIFICAR_DISPONIBILIDAD_U resultado consulta: ' || r_valor);
    return r_valor;
exception
    when no_data_found then
        -- Si no hay datos en el rango especificado
        return 'OK';
    when others then
        -- Manejo de errores
        dbms_output.put_line('Error: ' || sqlerrm);
        apex_debug.log_long_message('Error en la consulta: ' || sqlerrm);
        return 'NA';
end verificar_disponibilidad_u;
/


-- sqlcl_snapshot {"hash":"0dd30ae904efab3692bf36993d4f626fd914e433","type":"FUNCTION","name":"VERIFICAR_DISPONIBILIDAD_U","schemaName":"WKSP_DTESC","sxml":""}