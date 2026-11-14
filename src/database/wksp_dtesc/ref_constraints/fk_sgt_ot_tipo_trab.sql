alter table wksp_dtesc.sgt_ot
    add constraint fk_sgt_ot_tipo_trab
        foreign key ( tipo_trabajo_id )
            references wksp_dtesc.sgt_cat_ot_tipo_trabajo ( id )
        enable;


-- sqlcl_snapshot {"hash":"6b0f7a207f7c5223b45b6b579d6fc981e385f481","type":"REF_CONSTRAINT","name":"FK_SGT_OT_TIPO_TRAB","schemaName":"WKSP_DTESC","sxml":""}