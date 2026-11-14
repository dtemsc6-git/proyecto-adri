create or replace editionable trigger wksp_dtesc.trg_st_archivos before
    insert or update on wksp_dtesc.sgt_archivos
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

alter trigger wksp_dtesc.trg_st_archivos enable;


-- sqlcl_snapshot {"hash":"3106ce6af8b7bbbfca25657cc186807403c2c177","type":"TRIGGER","name":"TRG_ST_ARCHIVOS","schemaName":"WKSP_DTESC","sxml":""}