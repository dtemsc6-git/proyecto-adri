alter table wksp_dtesc.sgt_equipos_servicio
    add constraint sgt_equipos_servicio_fk_fo
        foreign key ( fo_id )
            references wksp_dtesc.sgt_enlaces_fo ( id )
        enable;


-- sqlcl_snapshot {"hash":"46d09cf7a67cc462f3d6b418517badb17009963e","type":"REF_CONSTRAINT","name":"SGT_EQUIPOS_SERVICIO_FK_FO","schemaName":"WKSP_DTESC","sxml":""}