create or replace function wksp_dtesc.parse_flexible_date (
    p_date in varchar2
) return date is
    v_date date;
begin
    begin
        v_date := to_date ( p_date,
        'YYYY-MM-DD' );
    exception
        when others then
            begin
                v_date := to_date ( p_date,
                'DD-MM-YYYY' );
            exception
                when others then
                    begin
                        v_date := to_date ( p_date,
                        'YY-MM-DD' );
                    exception
                        when others then
                            v_date := null;
                    end;
            end;
    end;

    return v_date;
end;
/


-- sqlcl_snapshot {"hash":"99f9a22cb51221db688ed4108bc8afac61169e9b","type":"FUNCTION","name":"PARSE_FLEXIBLE_DATE","schemaName":"WKSP_DTESC","sxml":""}