create or replace function wksp_dtesc.crear_ruta_wan (
    p_wan_id in integer
) return sdo_geometry as
    l_coords sdo_ordinate_array := sdo_ordinate_array();
    i        pls_integer := 1;
begin 
    --buscar todos los sitios de la wan 
    apex_debug.message('dmf: Funcion CREAR_RUTA_WAN:');
    apex_debug.message('dmf: Funcion CREAR_RUTA_WAN WAN_ID: $S', p_wan_id);
    for r in (
        select
            s.lat,
            s.lon
        from
                 v_sitios_gps s 
        --inner join sgt_sitios_enlace_wan on s.id =  sitio_id     
        --WHERE enlace_wan_id = P_WAN_ID  -- Use the parameter here 
            inner join (
                select
                    sitio_id,
                    seq
                from
                    (
                        select
                            vse.sitio_id,
                            sew.seq,
                            row_number()
                            over(partition by vse.sitio_id
                                 order by
                                     sew.seq
                            ) as rn
                        from
                                 v_sitios_equipos vse
                            join sgt_equipos_wan sew on vse.equipo_id = sew.equipo_a_id
                        where
                            sew.wan_id = p_wan_id
                    ) t
                where
                    rn = 1
                order by
                    seq
            ) tmp on s.id = tmp.sitio_id
        
        --order by seq 
    ) loop
        l_coords.extend(2);
        apex_debug.message('dmf: Funcion CREAR_RUTA_WAN LOOP: $S', i);
        l_coords(i) := r.lon;
        l_coords(i + 1) := r.lat;
        i := i + 2;
    end loop;

    return sdo_geometry(2002,
                        4326,
                        null,
                        sdo_elem_info_array(1, 2, 1),
                        l_coords);

end crear_ruta_wan;
/


-- sqlcl_snapshot {"hash":"8e1698ed09f0cc72ce2dec121361d2fd3aa19710","type":"FUNCTION","name":"CREAR_RUTA_WAN","schemaName":"WKSP_DTESC","sxml":""}