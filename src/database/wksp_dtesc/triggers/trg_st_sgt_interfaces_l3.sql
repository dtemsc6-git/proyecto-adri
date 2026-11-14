create or replace editionable trigger wksp_dtesc.trg_st_sgt_interfaces_l3 before
    insert or update on wksp_dtesc.sgt_interfaces_l3
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

alter trigger wksp_dtesc.trg_st_sgt_interfaces_l3 enable;


-- sqlcl_snapshot {"hash":"504aacc24908351969c0bfaf9f12efdd1e967b5e","type":"TRIGGER","name":"TRG_ST_SGT_INTERFACES_L3","schemaName":"WKSP_DTESC","sxml":""}