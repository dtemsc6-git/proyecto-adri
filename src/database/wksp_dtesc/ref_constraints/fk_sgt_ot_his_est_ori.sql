alter table wksp_dtesc.sgt_ot_historial
    add constraint fk_sgt_ot_his_est_ori
        foreign key ( estado_origen_id )
            references wksp_dtesc.sgt_cat_ot_estado ( id )
        enable;


-- sqlcl_snapshot {"hash":"1085d4241b7b933d7ec15c15b40750fbd301c9ed","type":"REF_CONSTRAINT","name":"FK_SGT_OT_HIS_EST_ORI","schemaName":"WKSP_DTESC","sxml":""}