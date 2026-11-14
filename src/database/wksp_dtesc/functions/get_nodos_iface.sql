create or replace function wksp_dtesc.get_nodos_iface (
    p_servicio_id in number
) 
/*
Autor: dmf
Función: Recolectar todas las interfaces utilizadas en un servicio, se realizan dos consulta la primera trae las interfaces del lado a
la segunda las del lado b, se realiza la union de ambas consultas y finalmente se retorna un
JSON con los datos.
*/ return clob as
    l_nodes clob;
begin
    select
        json_arrayagg(
            json_object(
                'eq_id' value eq_id,
                'id' value id,
                'label' value "label",
                'shape' value 'box',
                'color' value '#00AAFF',
                        'level' value seq
            )
        returning clob)
    into l_nodes
    from
        (
            select
                c.eq_id,
                c.iface_id     as id,
                c.eq
                || chr(10)
                || c.iface     "label",
                ( c.seq / 10 ) seq
            from
                v_conexiones_general_v2 c
            where
                c.serv_id = p_servicio_id
            union
            select
                c.eq_b_id,
                c.iface_b_id,
                c.eq_b
                || chr(10)
                || c.iface_b as label_b,
                ( c.seq + 10 ) / 10
            from
                v_conexiones_general_v2 c
            where
                c.serv_id = p_servicio_id
            order by
                seq
        );

    return l_nodes;
end get_nodos_iface;
/


-- sqlcl_snapshot {"hash":"3e9a882811a07b81903c50acecb1194d6dfdc346","type":"FUNCTION","name":"GET_NODOS_IFACE","schemaName":"WKSP_DTESC","sxml":""}