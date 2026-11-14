create or replace editionable trigger wksp_dtesc.trg_st_sgt_interfaces_l2 before
    insert or update on wksp_dtesc.sgt_interfaces_l2
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

alter trigger wksp_dtesc.trg_st_sgt_interfaces_l2 enable;


-- sqlcl_snapshot {"hash":"aa23ca7402f9e9a9aeb271c49fc857864aaf1fcd","type":"TRIGGER","name":"TRG_ST_SGT_INTERFACES_L2","schemaName":"WKSP_DTESC","sxml":""}