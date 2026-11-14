create or replace editionable trigger wksp_dtesc.trg_st_equipos_wan before
    insert or update on wksp_dtesc.sgt_equipos_wan
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

alter trigger wksp_dtesc.trg_st_equipos_wan enable;


-- sqlcl_snapshot {"hash":"fc0d9b375c5800bd1cb63df3d7af90dd3efe3230","type":"TRIGGER","name":"TRG_ST_EQUIPOS_WAN","schemaName":"WKSP_DTESC","sxml":""}