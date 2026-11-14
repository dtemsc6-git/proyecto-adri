create or replace function wksp_dtesc.f_get_lovs (
    p_id_lov  number,
    p_mostrar varchar2
) return number as
    l_id_return number := null;
begin  
  
  
    --Buscar EQUIPOS por nombres concatenados.  
    if p_id_lov = 1 then
        select
            e.id
        into l_id_return
        from
            sgt_equipos e
            left join sgt_racks   r on e.rack_id = r.id
            left join sgt_salas   s on r.sala_id = s.id
            left join sgt_sitios  ss on s.sitio_id = ss.id
        where
            upper(ss.siglas
                  || '.'
                  || s.siglas
                  || '.'
                  || r.nombre
                  || '.' || e.nombre) = upper(p_mostrar);

        return l_id_return;  
      
    --Buscar Tipo de Interfaces for nombres      
    elsif p_id_lov = 2 then
        select
            ti.id
        into l_id_return
        from
            sgt_tipo_interfaz ti
        where
            upper(ti.nombre) = upper(p_mostrar);

        return l_id_return;  
       
    --Buscar Rack ID por nombre de rack concatenado      
    elsif p_id_lov = 3 then
        select
            r.id
        into l_id_return
        from
            sgt_racks  r
            left join sgt_salas  s on r.sala_id = s.id
            left join sgt_sitios ss on s.sitio_id = ss.id
        where
            upper(ss.siglas
                  || '.'
                  || s.siglas
                  || '.' || r.nombre) = upper(p_mostrar);

        return l_id_return;    
 
    --Buscar Sitio por nombre de rack 
    elsif p_id_lov = 4 then
        select
            ss.id
        into l_id_return
        from
            sgt_racks  r
            left join sgt_salas  s on r.sala_id = s.id
            left join sgt_sitios ss on s.sitio_id = ss.id
        where
            upper(ss.siglas
                  || '.'
                  || s.siglas
                  || '.' || r.nombre) = upper(p_mostrar);

        return l_id_return;   
 
    --Retornar el id del tipo de equipo 
    elsif p_id_lov = 5 then
        select
            te.id
        into l_id_return
        from
            sgt_tipo_equipos te
        where
            upper(te.nombre) = upper(p_mostrar);

        return l_id_return;     
    
    --retorna el id en base al concatenado de sitio.sala.rack.equipo.interfaz
    elsif p_id_lov = 6 then
        select
            i.id
        into l_id_return
        from
            sgt_interfaces i
            left join sgt_equipos    e on i.equipo_id = e.id
            left join sgt_racks      r on e.rack_id = r.id
            left join sgt_salas      s on r.sala_id = s.id
            left join sgt_sitios     ss on s.sitio_id = ss.id
        where
            upper(ss.siglas
                  || '.'
                  || s.siglas
                  || '.'
                  || r.nombre
                  || '.'
                  || e.nombre
                  || '.' || i.nombre) = upper(p_mostrar);

        return l_id_return;
    end if;

    return null;
exception
    when no_data_found then
        return null;
    when too_many_rows then  
        -- Manejar múltiples resultados según tu lógica de negocio  
        return null;
    when others then
        raise;
end f_get_lovs;
/


-- sqlcl_snapshot {"hash":"734d3e01bf6a4490611bb9eb97e7098b2d7ec980","type":"FUNCTION","name":"F_GET_LOVS","schemaName":"WKSP_DTESC","sxml":""}