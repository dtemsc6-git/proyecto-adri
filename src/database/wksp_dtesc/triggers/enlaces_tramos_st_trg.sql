create or replace editionable trigger wksp_dtesc.enlaces_tramos_st_trg before
    insert or update on wksp_dtesc.sgt_enlaces_tramos
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

alter trigger wksp_dtesc.enlaces_tramos_st_trg enable;


-- sqlcl_snapshot {"hash":"6411b60fe9f83913e2aff92fb279fb3d2524e6f1","type":"TRIGGER","name":"ENLACES_TRAMOS_ST_TRG","schemaName":"WKSP_DTESC","sxml":""}