create or replace function wksp_dtesc.get_nodos_sitios (
    sitios_ids in tabla_ids
) return clob as
    l_nodes clob;
begin 
 
    -- NODOS: lista única de sitios (solo los de los enlaces seleccionados) 
    apex_debug.message('Inicia get_nodos_sitios');
    dbms_output.put_line('Inicia el get_nodos_sitios:');
    for i in 1..sitios_ids.count loop
        apex_debug.message('IDS pasados: p_id=%s',
                           sitios_ids(i));
    end loop;

    select
        json_arrayagg(
            json_object(
                'id' value id,
                'label' value label,
                'shape' value 'box',
                'color' value '#00AAFF'
            )
        returning clob)
    into l_nodes
    from
        (
            select
                s.id,
                s.siglas label
            from
                sgt_sitios s
            where
                s.id in (
                    select
                        column_value
                    from
                        table ( sitios_ids )
                )
        );

    if l_nodes is null then
        l_nodes := '[]';
    end if;
    return l_nodes;
end get_nodos_sitios;
/


-- sqlcl_snapshot {"hash":"baecf697f113ab16a9507dbf8830a850661272ee","type":"FUNCTION","name":"GET_NODOS_SITIOS","schemaName":"WKSP_DTESC","sxml":""}