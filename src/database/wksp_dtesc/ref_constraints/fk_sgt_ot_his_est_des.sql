alter table wksp_dtesc.sgt_ot_historial
    add constraint fk_sgt_ot_his_est_des
        foreign key ( estado_destino_id )
            references wksp_dtesc.sgt_cat_ot_estado ( id )
        enable;


-- sqlcl_snapshot {"hash":"1301deab9676a2cd864cd1a9b482671481115d81","type":"REF_CONSTRAINT","name":"FK_SGT_OT_HIS_EST_DES","schemaName":"WKSP_DTESC","sxml":""}