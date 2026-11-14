alter table wksp_dtesc.sgt_ot_servicio
    add constraint fk_sgt_ot_servicio_ot
        foreign key ( ot_id )
            references wksp_dtesc.sgt_ot ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"d50e8d0242351d352b1b555705084a26cfe7d2fa","type":"REF_CONSTRAINT","name":"FK_SGT_OT_SERVICIO_OT","schemaName":"WKSP_DTESC","sxml":""}