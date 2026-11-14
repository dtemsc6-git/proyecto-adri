create or replace editionable trigger wksp_dtesc.trg_racks_validar_altura_u before
    insert or update on wksp_dtesc.sgt_racks
    for each row
declare
    v_equipo_bloqueador varchar2(255);
    v_count_conflictos  number := 0;
begin

 -- Solo validar si se está reduciendo la altura del rack al editar, al crear no hay equipos asociados.
 -- por lo que no hace falta validar eso.
    if updating then
        if :new.altura_u >= :old.altura_u then
            return; -- No hay reducción, no validar
        end if;

         -- Verificar si hay equipos que exceden la nueva altura
        select
            count(*)
        into v_count_conflictos
        from
            sgt_equipos e
        where
                e.rack_id = :new.id
            and ( e.u + e.altura_u - 1 ) > :new.altura_u;

        if v_count_conflictos > 0 then
            -- Obtener detalles de los equipos conflictivos
            for rec in (
                select
                    e.id,
                    e.nombre,
                    ( e.u + e.altura_u - 1 ) as last_u,
                    e.posicion,
                    e.u                      as u_inicio,
                    e.altura_u
                from
                    sgt_equipos e
                where
                        e.rack_id = :new.id
                    and ( e.u + e.altura_u - 1 ) > :new.altura_u
                order by
                    e.posicion,
                    e.u
            ) loop
                -- Mensaje de debug para cada equipo conflictivo
                apex_debug.message('Equipo conflictivo: '
                                   || rec.nombre
                                   || ' (ID: '
                                   || rec.id
                                   || ', Posición: '
                                   || rec.posicion
                                   || ', Ocupa U: '
                                   || rec.u_inicio
                                   || '-'
                                   || rec.last_u
                                   || ', Nueva altura rack: '
                                   || :new.altura_u || 'U)');
            end loop;
        
            -- Cancelar la operación
            raise_application_error(-20001,
                                    'No se puede reducir la altura del rack a '
                                    || :new.altura_u
                                    || 'U porque existen '
                                    || v_count_conflictos
                                    || ' equipo(s) que ocupan U superiores. Revise los logs para más detalles.');

        end if;

    end if;
exception
    when no_data_found then
        -- Si no hay datos, no hay conflicto
        apex_debug.message('TRG_RACKS_VALIDAR_ALTURA_U: No hay equipos conflictivos');
    when others then
        -- Manejo de errores
        apex_debug.message('TRG_RACKS_VALIDAR_ALTURA_U Error: ' || sqlerrm);
        raise; -- Relanzar el error para que no se ignore
end trg_racks_validar_altura_u;
/

alter trigger wksp_dtesc.trg_racks_validar_altura_u enable;


-- sqlcl_snapshot {"hash":"4cc13f412571a9df48559439c3417d5cbe75808c","type":"TRIGGER","name":"TRG_RACKS_VALIDAR_ALTURA_U","schemaName":"WKSP_DTESC","sxml":""}