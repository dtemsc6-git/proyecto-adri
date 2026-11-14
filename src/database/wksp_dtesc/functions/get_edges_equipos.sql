create or replace function wksp_dtesc.get_edges_equipos (
    p_servicio_id in number
) 
/*
Autor: dmf
Función: Obtener todos las lineas que conectan los equipos entre si para un servicio en particular
Se necesita para el ID del servicio, la funcion recolectara todos las conexiones entre equipos
de la vista: v_conexiones_general_v2.
Utilizado para la librería de dibujo de las interfaces.
*/ return clob as
    l_edges clob;
begin
    select
        json_arrayagg(
            json_object(
                'from' value origen_id,
                'to' value destino_id,
                'label' value edge_label,
                'edge_id' value edge_id
            )
        returning clob)
    into l_edges
    from
        (
            select
                eq_id     as origen_id,
                eq_b_id   as destino_id,
                fo_nombre as edge_label,
                conn_id   as edge_id
            from
                v_conexiones_general_v2
            where
                serv_id = p_servicio_id
            order by
                eq_id
        );

    return l_edges;
end get_edges_equipos;
/


-- sqlcl_snapshot {"hash":"f3c0a02aaef36b416155903892fde421f788d549","type":"FUNCTION","name":"GET_EDGES_EQUIPOS","schemaName":"WKSP_DTESC","sxml":""}