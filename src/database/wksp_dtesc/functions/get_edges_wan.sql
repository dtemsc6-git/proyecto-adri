create or replace function wksp_dtesc.get_edges_wan (
    p_wans_id in tabla_ids
) return clob as
    l_edges clob;
begin
    apex_debug.message('dmf: Funcion GET_EDGES_WAN:'); 
 
   --for i IN 1 .. P_WANS_ID.count loop 
     --       apex_debug.message('dmf: Sitios id : %s', P_WANS_ID(i)); 
       -- end loop;  

    with ordered as (
        select
            s.id       as origen_id,
            lead(s.id)
            over(partition by wan.id
                 order by
                     sw.seq
            )          as destino_id,
            wan.id     as edge_id,
            wan.nombre as edge_label
        from
                 sgt_sitios_enlace_wan sw
            join sgt_enlaces_wan wan on wan.id = sw.enlace_wan_id
            join sgt_sitios      s on s.id = sw.sitio_id
        where
            sw.enlace_wan_id in (
                select
                    column_value
                from
                    table ( p_wans_id )
            )
        order by
            origen_id
    )
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
        ordered
    where
        destino_id is not null; -- ahora es válido porque destino_id fue calculado en la CTE 
    return l_edges;
end get_edges_wan;
/


-- sqlcl_snapshot {"hash":"aa46ac13f57aaed63816082ea060cff2b0ce457e","type":"FUNCTION","name":"GET_EDGES_WAN","schemaName":"WKSP_DTESC","sxml":""}