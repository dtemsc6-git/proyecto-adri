alter table wksp_dtesc.sgt_ot_historial
    add constraint fk_sgt_ot_his_ot
        foreign key ( ot_id )
            references wksp_dtesc.sgt_ot ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"ee45813d0aacf4ea24440887b02415d7cf8c70c9","type":"REF_CONSTRAINT","name":"FK_SGT_OT_HIS_OT","schemaName":"WKSP_DTESC","sxml":""}