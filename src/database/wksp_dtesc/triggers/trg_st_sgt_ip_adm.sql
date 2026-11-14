create or replace editionable trigger wksp_dtesc.trg_st_sgt_ip_adm before
    insert or update on wksp_dtesc.sgt_ip_adm
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

alter trigger wksp_dtesc.trg_st_sgt_ip_adm enable;


-- sqlcl_snapshot {"hash":"3fd37c3c326bb6415d67acd51e5e349c9f5943f2","type":"TRIGGER","name":"TRG_ST_SGT_IP_ADM","schemaName":"WKSP_DTESC","sxml":""}