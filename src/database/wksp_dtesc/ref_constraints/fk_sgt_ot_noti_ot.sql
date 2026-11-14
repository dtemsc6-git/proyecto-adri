alter table wksp_dtesc.sgt_ot_notificacion
    add constraint fk_sgt_ot_noti_ot
        foreign key ( ot_id )
            references wksp_dtesc.sgt_ot ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"c9c9f1c8b831cd8b331d6ee418b55287d671a01e","type":"REF_CONSTRAINT","name":"FK_SGT_OT_NOTI_OT","schemaName":"WKSP_DTESC","sxml":""}