create or replace editionable trigger wksp_dtesc.equipos_st_trg before
    insert or update on wksp_dtesc.sgt_equipos
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

alter trigger wksp_dtesc.equipos_st_trg enable;


-- sqlcl_snapshot {"hash":"df3ba16dbd263405bf7ed9045ae51e1b4bddc529","type":"TRIGGER","name":"EQUIPOS_ST_TRG","schemaName":"WKSP_DTESC","sxml":""}