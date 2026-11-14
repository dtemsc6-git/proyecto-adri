alter table wksp_dtesc.sgt_ip_adm
    add constraint sgt_ip_adm_fk
        foreign key ( interface_id )
            references wksp_dtesc.sgt_interfaces ( id )
        enable;


-- sqlcl_snapshot {"hash":"213205140248c21dc893f5ebc52edd7a5200ed01","type":"REF_CONSTRAINT","name":"SGT_IP_ADM_FK","schemaName":"WKSP_DTESC","sxml":""}