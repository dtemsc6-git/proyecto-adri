create or replace editionable trigger wksp_dtesc.interfaces_st_trg before
    insert or update on wksp_dtesc.sgt_interfaces
    for each row
begin
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

alter trigger wksp_dtesc.interfaces_st_trg enable;


-- sqlcl_snapshot {"hash":"81500b6aa5ce051aa6f016556bdfbaf29d913bee","type":"TRIGGER","name":"INTERFACES_ST_TRG","schemaName":"WKSP_DTESC","sxml":""}