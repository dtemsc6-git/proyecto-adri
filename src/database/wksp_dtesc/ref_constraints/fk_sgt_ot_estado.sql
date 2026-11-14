alter table wksp_dtesc.sgt_ot
    add constraint fk_sgt_ot_estado
        foreign key ( estado_id )
            references wksp_dtesc.sgt_cat_ot_estado ( id )
        enable;


-- sqlcl_snapshot {"hash":"28d0492befe766b7167c5959e8b20ed6bc242df9","type":"REF_CONSTRAINT","name":"FK_SGT_OT_ESTADO","schemaName":"WKSP_DTESC","sxml":""}