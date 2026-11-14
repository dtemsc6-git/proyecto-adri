create or replace function wksp_dtesc.url_to_lat (
    p_coord in varchar2
) return coord_obj as
    l_match varchar2(4000);
    l_lat   number;
    l_long  number;
begin 
    -- Caso 1: URL de Google Maps con formato decimal 
    if p_coord like 'http%' then 
        -- Buscar patrón de coordenadas decimales (-##.####, -##.####) 
        l_match := regexp_substr(p_coord, '[-]?\d+(\.\d+)?[, ]+[-]?\d+(\.\d+)?');
        if l_match is not null then 
            -- Si queremos la primera parte (latitud): 
            l_lat := to_number ( regexp_substr(l_match, '[-]?\d+(\.\d+)?', 1, 1) );
            l_long := to_number ( regexp_substr(l_match, '[-]?\d+(\.\d+)?', 1, 2) );
            return coord_obj(l_lat, l_long);
        else
            return coord_obj(null, null);
        end if;

    else
        return coord_obj(null, null);
    end if;
end url_to_lat;
/


-- sqlcl_snapshot {"hash":"a946914cb1fe5faf4bf9ac766c0d288cfac0b63e","type":"FUNCTION","name":"URL_TO_LAT","schemaName":"WKSP_DTESC","sxml":""}