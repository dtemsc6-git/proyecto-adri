create or replace editionable trigger wksp_dtesc.eventos_fo_st_trg
    before insert or update on wksp_dtesc.SGT_EVENTOS_FO
    for each row
begin
    if inserting then
        :new.creado_el := sysdate;
        :new.creado_por := nvl(sys_context('APEX$SESSION', 'APP_USER'), sys_context('USERENV', 'SESSION_USER'));
    end if;
    :new.actualizado_el := sysdate;
    :new.actualizado_por := nvl(sys_context('APEX$SESSION', 'APP_USER'), sys_context('USERENV', 'SESSION_USER'));
end;
/
