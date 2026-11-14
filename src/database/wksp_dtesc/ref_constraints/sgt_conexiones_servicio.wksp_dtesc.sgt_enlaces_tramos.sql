alter table wksp_dtesc.sgt_conexiones_servicio
    add
        foreign key ( enlace_tramo_id )
            references wksp_dtesc.sgt_enlaces_tramos ( id )
        enable;


-- sqlcl_snapshot {"hash":"36ef011ac260f0717f723034179b5140936d5339","type":"REF_CONSTRAINT","name":"SGT_CONEXIONES_SERVICIO.WKSP_DTESC.SGT_ENLACES_TRAMOS","schemaName":"WKSP_DTESC","sxml":""}