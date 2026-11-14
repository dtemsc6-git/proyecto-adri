alter table wksp_dtesc.sgt_ot
    add constraint fk_sgt_ot_prioridad
        foreign key ( prioridad_id )
            references wksp_dtesc.sgt_cat_ot_prioridad ( id )
        enable;


-- sqlcl_snapshot {"hash":"ca9e2c73fb9eeb2660a60a40aa66f3584864432c","type":"REF_CONSTRAINT","name":"FK_SGT_OT_PRIORIDAD","schemaName":"WKSP_DTESC","sxml":""}