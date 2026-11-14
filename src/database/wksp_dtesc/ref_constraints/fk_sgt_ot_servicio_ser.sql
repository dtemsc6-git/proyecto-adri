alter table wksp_dtesc.sgt_ot_servicio
    add constraint fk_sgt_ot_servicio_ser
        foreign key ( servicio_id )
            references wksp_dtesc.sgt_servicios ( id )
        enable;


-- sqlcl_snapshot {"hash":"5a2d4a4213686a1b04c906e418cab2b515fbfc70","type":"REF_CONSTRAINT","name":"FK_SGT_OT_SERVICIO_SER","schemaName":"WKSP_DTESC","sxml":""}