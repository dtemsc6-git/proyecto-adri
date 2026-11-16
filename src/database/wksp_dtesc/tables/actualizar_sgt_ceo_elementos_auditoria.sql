-- Ejecutar con el esquema propietario de SGT_CEO_ELEMENTOS.
-- Renombra las columnas conservando sus valores y tipos. Reejecutable.
-- Se valida el estado de ambas columnas antes de ejecutar DDL (commit implicito).
declare
    l_anterior number;
    l_nueva number;
    procedure comprobar(p_anterior varchar2, p_nueva varchar2) is
    begin
        select count(case when column_name = p_anterior then 1 end),
               count(case when column_name = p_nueva then 1 end)
          into l_anterior, l_nueva
          from user_tab_columns
         where table_name = 'SGT_CEO_ELEMENTOS'
           and column_name in (p_anterior, p_nueva);
        if l_anterior + l_nueva <> 1 then
            raise_application_error(-20001,
                'SGT_CEO_ELEMENTOS: debe existir exactamente una columna entre '
                || p_anterior || ' y ' || p_nueva);
        end if;
    end;
begin
    comprobar('MODIFICADO_POR', 'ACTUALIZADO_POR');
    comprobar('MODIFICADO_EL', 'ACTUALIZADO_EL');

    comprobar('MODIFICADO_POR', 'ACTUALIZADO_POR');
    if l_anterior = 1 then
        execute immediate 'alter table SGT_CEO_ELEMENTOS rename column MODIFICADO_POR to ACTUALIZADO_POR';
    end if;
    comprobar('MODIFICADO_EL', 'ACTUALIZADO_EL');
    if l_anterior = 1 then
        execute immediate 'alter table SGT_CEO_ELEMENTOS rename column MODIFICADO_EL to ACTUALIZADO_EL';
    end if;
end;
/

-- Crear o reemplazar el trigger despues de renombrar las columnas.
create or replace editionable trigger ceo_elementos_st_trg
    before insert or update on SGT_CEO_ELEMENTOS
    for each row
begin
    if inserting then
        :new.creado_el := systimestamp;
        :new.creado_por := nvl(sys_context('APEX$SESSION', 'APP_USER'), sys_context('USERENV', 'SESSION_USER'));
    end if;
    :new.actualizado_el := systimestamp;
    :new.actualizado_por := nvl(sys_context('APEX$SESSION', 'APP_USER'), sys_context('USERENV', 'SESSION_USER'));
end;
/

declare
    l_errores number;
begin
    select count(*) into l_errores from user_errors
     where name = upper('ceo_elementos_st_trg') and type = 'TRIGGER' and attribute = 'ERROR';
    if l_errores > 0 then
        raise_application_error(-20002, 'Error de compilacion en ceo_elementos_st_trg; consultar USER_ERRORS.');
    end if;
end;
/
