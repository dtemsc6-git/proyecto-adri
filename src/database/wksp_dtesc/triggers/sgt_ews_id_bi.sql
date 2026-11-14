create or replace editionable trigger wksp_dtesc.sgt_ews_id_bi before
    insert on wksp_dtesc.sgt_enlaces_wan_servicio
    for each row
    when ( new.id is null )
begin
    select
        sgt_enlaces_wan_servicio_id_seq.nextval
    into :new.id
    from
        dual;

end;
/

alter trigger wksp_dtesc.sgt_ews_id_bi enable;


-- sqlcl_snapshot {"hash":"8288cc0bf29d822b162789a8808cd201f1359256","type":"TRIGGER","name":"SGT_EWS_ID_BI","schemaName":"WKSP_DTESC","sxml":""}