create or replace editionable trigger wksp_dtesc.trg_equipos_validar_u for
    insert or update on wksp_dtesc.sgt_equipos
compound trigger
    type t_reg is record (
            rack_id  sgt_equipos.rack_id%type,
            u        sgt_equipos.u%type,
            altura_u sgt_equipos.altura_u%type,
            posicion sgt_equipos.posicion%type,
            id       sgt_equipos.id%type
    );
    type t_tab is
        table of t_reg;
    g_data t_tab := t_tab();
    before each row is begin
        g_data.extend;
        g_data(g_data.last).rack_id := :new.rack_id;
        g_data(g_data.last).u := :new.u;
        g_data(g_data.last).altura_u := :new.altura_u;
        g_data(g_data.last).posicion := :new.posicion;
        g_data(g_data.last).id := :new.id;
    end before each row;
    after statement is
        v_count             number;
        v_rack_altura       number;
        v_u_fin             number;
        v_equipo_bloqueador varchar2(200);
    begin
      

      --apex_debug_message.log_long_message('TRG_valida_solapamiento new.id: ' || :new.id  ||', new.rack_id: ' || :new.rack_id || ', new.posicion: '|| :new.posicion); 

        for i in 1..g_data.count loop
            select
                altura_u
            into v_rack_altura
            from
                sgt_racks
            where
                id = g_data(i).rack_id;
           
                  
  
  -- Validar rango
            if ( g_data(i).u < 1 ) then
                raise_application_error(-20001,
                                        'ERROR: La posicion U no puede ser menor a 1 ' || g_data(i).u);
            end if;

            v_u_fin := g_data(i).u + g_data(i).altura_u - 1;

            if v_u_fin > v_rack_altura then
                raise_application_error(-20002,
                                        'ERROR: El equipo requiere '
                                        || g_data(i).altura_u
                                        || 'U (U'
                                        || g_data(i).u
                                        || ' a U'
                                        || v_u_fin
                                        || ') pero el rack solo tiene '
                                        || v_rack_altura
                                        || 'U disponibles.');
            end if;

            select
                count(*)
            into v_count
            from
                sgt_equipos e
            where
                    e.rack_id = g_data(i).rack_id
                and e.posicion = g_data(i).posicion
                and e.id <> g_data(i).id
                and g_data(i).u <= e.u + e.altura_u - 1
                and g_data(i).u + g_data(i).altura_u - 1 >= e.u;

            if v_count > 0 then
                raise_application_error(-20003, 'Existe solapamiento de U en el rack');
            end if;
        end loop;
    end after statement;
end trg_equipos_validar_u;
/

alter trigger wksp_dtesc.trg_equipos_validar_u enable;


-- sqlcl_snapshot {"hash":"31b1554e1007dc91986db2173889e787243c52a9","type":"TRIGGER","name":"TRG_EQUIPOS_VALIDAR_U","schemaName":"WKSP_DTESC","sxml":""}