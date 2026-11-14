create or replace function wksp_dtesc.get_nodos_equipos (
    p_servicio_id in number
) return clob as
    l_nodes clob;
begin
    select
        json_arrayagg(
            json_object(
                'id' value id,
                'eq_id' value eq_id,
                'label' value label,
                'shape' value 'box',
                'color' value '#00AAFF',
                        'level' value seq
            )
        returning clob)
    into l_nodes
    from
        (
            select
                c.eq_id        as id,
                c.eq_id        as,
                c.eq           as label,
                ( c.seq ) / 10 seq
            from
                v_conexiones_general_v2 c
            where
                c.serv_id = p_servicio_id
            union
            select
                c.eq_b_id as id,
                c.eq_b_id as,
                c.eq_b    as label,
                ( c.seq + 10 ) / 10
            from
                v_conexiones_general_v2 c
            where
                c.serv_id = p_servicio_id
            order by
                seq
        );

    return l_nodes;
end get_nodos_equipos;
/


-- sqlcl_snapshot {"hash":"6c0a91c86ce7e4901f5c011f1877e60ec1160a0f","type":"FUNCTION","name":"GET_NODOS_EQUIPOS","schemaName":"WKSP_DTESC","sxml":""}