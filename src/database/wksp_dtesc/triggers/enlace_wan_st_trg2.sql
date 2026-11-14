create or replace editionable trigger wksp_dtesc.enlace_wan_st_trg2 before
    insert or update on wksp_dtesc.sgt_enlaces_wan
    for each row
begin 
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
end;
/

alter trigger wksp_dtesc.enlace_wan_st_trg2 enable;


-- sqlcl_snapshot {"hash":"3798f655dbaf0aa44ccd9f5546f72904ef68aaba","type":"TRIGGER","name":"ENLACE_WAN_ST_TRG2","schemaName":"WKSP_DTESC","sxml":""}