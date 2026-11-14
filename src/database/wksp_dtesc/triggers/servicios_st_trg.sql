create or replace editionable trigger wksp_dtesc.servicios_st_trg before
    insert or update on wksp_dtesc.sgt_servicios
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

alter trigger wksp_dtesc.servicios_st_trg enable;


-- sqlcl_snapshot {"hash":"45600e0287509705bb6e7beb85a86bb1f1dd9e70","type":"TRIGGER","name":"SERVICIOS_ST_TRG","schemaName":"WKSP_DTESC","sxml":""}