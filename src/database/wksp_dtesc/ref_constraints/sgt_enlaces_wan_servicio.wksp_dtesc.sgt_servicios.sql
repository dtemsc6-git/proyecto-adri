alter table wksp_dtesc.sgt_enlaces_wan_servicio
    add
        foreign key ( servicio_id )
            references wksp_dtesc.sgt_servicios ( id )
        enable;


-- sqlcl_snapshot {"hash":"b9c45a8afd15e6fdc10048590b6dd105569fb32b","type":"REF_CONSTRAINT","name":"SGT_ENLACES_WAN_SERVICIO.WKSP_DTESC.SGT_SERVICIOS","schemaName":"WKSP_DTESC","sxml":""}