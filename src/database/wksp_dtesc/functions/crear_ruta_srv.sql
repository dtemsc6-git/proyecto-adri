create or replace function wksp_dtesc.crear_ruta_srv (
    p_servicio_id in integer
) return sdo_geometry as
    l_coords sdo_ordinate_array := sdo_ordinate_array();
    i        pls_integer := 1;
begin 
    --buscar todos los sitios de la wan 
    apex_debug.message('dmf: Funcion CREAR_RUTA_SERVICIOS:');
    apex_debug.message('dmf: Funcion CREAR_RUTA_SERVICIOS SRV_ID: $S', p_servicio_id);
    for r in (
        select
            s.lat,
            s.lon,
            seq
        from
                 v_sitios_gps s
            inner join sgt_sitios_servicio on s.id = sitio_id
        where
            servicio_id = p_servicio_id  -- Use the parameter here 
        order by
            seq
    ) loop
        l_coords.extend(2);
        apex_debug.message('dmf: Funcion CREAR_RUTA_SRV LOOP: $S', i);
        l_coords(i) := r.lon;
        l_coords(i + 1) := r.lat;
        i := i + 2;
    end loop;

    return sdo_geometry(2002,
                        4326,
                        null,
                        sdo_elem_info_array(1, 2, 1),
                        l_coords);

end crear_ruta_srv;
/


-- sqlcl_snapshot {"hash":"3b6f310b34afc526a56e522db7d4e95175f6f1ea","type":"FUNCTION","name":"CREAR_RUTA_SRV","schemaName":"WKSP_DTESC","sxml":""}