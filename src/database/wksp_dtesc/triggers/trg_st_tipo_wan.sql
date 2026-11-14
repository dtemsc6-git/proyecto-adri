create or replace editionable trigger wksp_dtesc.trg_st_tipo_wan before
    insert or update on wksp_dtesc.sgt_tipo_wan
    for each row
begin
    --
    --actualizar info de  
    if inserting then
        :new.creado_el := sysdate;
        :new.creado_por := nvl(wwv_flow.g_user, user);
        :new.actualizado_el := sysdate;
        :new.actualizado_por := nvl(wwv_flow.g_user, user);
    elsif updating then
        :new.actualizado_el := sysdate;
        :new.actualizado_por := nvl(wwv_flow.g_user, user);
    end if; 
    --
end;
/

alter trigger wksp_dtesc.trg_st_tipo_wan enable;


-- sqlcl_snapshot {"hash":"7d2e3fe6ce36d87f3a4ba8f92b50a81ed89aac94","type":"TRIGGER","name":"TRG_ST_TIPO_WAN","schemaName":"WKSP_DTESC","sxml":""}