alter table wksp_dtesc.sgt_enlaces_wan_servicio
    add constraint sgt_enlaces_wan_servicio_con
        foreign key ( enlace_id )
            references wksp_dtesc.sgt_enlaces_wan ( id )
        enable;


-- sqlcl_snapshot {"hash":"21e6b5b4674c594363ca25693d59a40c36cd8d22","type":"REF_CONSTRAINT","name":"SGT_ENLACES_WAN_SERVICIO_CON","schemaName":"WKSP_DTESC","sxml":""}