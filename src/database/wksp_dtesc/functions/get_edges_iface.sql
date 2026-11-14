create or replace function wksp_dtesc.get_edges_iface (
    p_servicio_id in number
) return clob as
    l_edges clob;
begin 
     
    ---======================== 
    ---Crear los edge 
    ---======================= 
    select
        json_arrayagg(
            json_object(
                'from' value origen_id,
                'to' value destino_id,
                'label' value edge_label,
                'id' value edge_id
            )
        returning clob)
    into l_edges
    from
        (
            select
                iface_id   as origen_id,
                iface_b_id as destino_id,
                fo_nombre  as edge_label,
                conn_id    as edge_id
            from
                v_conexiones_general_v2
            where
                serv_id = p_servicio_id
            order by
                eq_id
        );

    return l_edges;
end get_edges_iface;
/


-- sqlcl_snapshot {"hash":"8f172571e7b9ed488f74dd6da9cd5699890b60a9","type":"FUNCTION","name":"GET_EDGES_IFACE","schemaName":"WKSP_DTESC","sxml":""}