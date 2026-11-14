alter table wksp_dtesc.sgt_conexiones_servicio
    add
        foreign key ( servicio_id )
            references wksp_dtesc.sgt_servicios ( id )
        enable;


-- sqlcl_snapshot {"hash":"cd2a75e49a6d0848763b52085ec436abc799ad86","type":"REF_CONSTRAINT","name":"SGT_CONEXIONES_SERVICIO.WKSP_DTESC.SGT_SERVICIOS","schemaName":"WKSP_DTESC","sxml":""}