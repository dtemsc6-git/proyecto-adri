create or replace editionable trigger wksp_dtesc.trg_st_equipos_servicio before
    insert or update on wksp_dtesc.sgt_equipos_servicio
    for each row
begin
     --actualizar info de  
    if inserting then
        :new.creado_el := sysdate;
        :new.creado_por := nvl(wwv_flow.g_user, user);
        :new.modificado_el := sysdate;
        :new.modificado_por := nvl(wwv_flow.g_user, user);
    elsif updating then
        :new.modificado_el := sysdate;
        :new.modificado_por := nvl(wwv_flow.g_user, user);
    end if;
end;
/

alter trigger wksp_dtesc.trg_st_equipos_servicio enable;


-- sqlcl_snapshot {"hash":"959ad817574d1232f2d73158af294ead6410d99a","type":"TRIGGER","name":"TRG_ST_EQUIPOS_SERVICIO","schemaName":"WKSP_DTESC","sxml":""}