create or replace function wksp_dtesc.get_wan_nodos_iface (
    p_wan_id in number
)
/*
@Author: DMF
@Objetivo: Una funcion que retorna la lista de equipos e interfaces que participan en el enlace WAN
Como el enlace WAN puede o no estar creado se le pasan como parametros los IDS de las conexiones intervinientes

*/ return clob as
    l_nodes clob;
begin
    apex_debug.message('dmf: GET_NODOS_IFACE_WAN: %s', p_wan_id);
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
                c.iface_id         as id,
                c.eq
                || chr(10)
                || c.iface         "label",
                ( c.seq_wan / 10 ) seq
            from
                v_conexiones_general_v2 c
            where
                c.wan_id = p_wan_id
            union
            select
                c.eq_b_id,
                c.iface_b_id,
                c.eq_b
                || chr(10)
                || c.iface_b as label_b,
                ( c.seq_wan + 10 ) / 10
            from
                v_conexiones_general_v2 c
            where
                c.wan_id = p_wan_id
            order by
                seq
        );

    return l_nodes;
end get_wan_nodos_iface;
/


-- sqlcl_snapshot {"hash":"ce77676528a1b6c2feac1240fbfbdc6fcf536d4b","type":"FUNCTION","name":"GET_WAN_NODOS_IFACE","schemaName":"WKSP_DTESC","sxml":""}