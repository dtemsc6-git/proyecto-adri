create or replace function wksp_dtesc.get_wan_edges_iface (
    p_wan_id in number
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
                wan_id = p_wan_id
            order by
                eq_id
        );

    return l_edges;
end get_wan_edges_iface;
/


-- sqlcl_snapshot {"hash":"34f56e883786deec268ae46b89a4fbcb2cf02951","type":"FUNCTION","name":"GET_WAN_EDGES_IFACE","schemaName":"WKSP_DTESC","sxml":""}