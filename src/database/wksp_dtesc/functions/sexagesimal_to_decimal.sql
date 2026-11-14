create or replace function wksp_dtesc.sexagesimal_to_decimal (
    p_coord in varchar2
) return number as

    l_grados   number;
    l_minutos  number := 0;
    l_segundos number := 0;
    l_signo    number := 1;
    l_decimal  number;
begin 
    -- Signo según hemisferio 
    if p_coord like '%S%'
       or p_coord like '%O%' then
        l_signo := -1;
    end if; 
 
    -- Extraer grados, minutos y segundos usando REGEXP 
    begin
        select
            to_number(regexp_substr(p_coord, '(\d+)', 1, 1))
        into l_grados
        from
            dual;

        select
            nvl(to_number(regexp_substr(p_coord, '(\d+)', 1, 2)),
                0)
        into l_minutos
        from
            dual;

        select
            nvl(to_number(regexp_substr(p_coord, '(\d+)', 1, 3)),
                0)
        into l_segundos
        from
            dual;

    exception
        when no_data_found then
            return null;
    end; 
 
    -- Conversión a decimal 
    l_decimal := l_signo * ( l_grados + ( l_minutos / 60 ) + ( l_segundos / 3600 ) );

    return round(l_decimal, 7);
end;
/


-- sqlcl_snapshot {"hash":"18f260a7cac97ab11efc99d0a1e34b090a7a37ea","type":"FUNCTION","name":"SEXAGESIMAL_TO_DECIMAL","schemaName":"WKSP_DTESC","sxml":""}