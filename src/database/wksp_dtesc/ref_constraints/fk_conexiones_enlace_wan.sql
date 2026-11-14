alter table wksp_dtesc.sgt_conexiones_enlace_wan
    add constraint fk_conexiones_enlace_wan
        foreign key ( enlace_wan_id )
            references wksp_dtesc.sgt_enlaces_wan ( id )
        enable;


-- sqlcl_snapshot {"hash":"da2a634f0150f6f00ddac105eeea774cbc41b7a7","type":"REF_CONSTRAINT","name":"FK_CONEXIONES_ENLACE_WAN","schemaName":"WKSP_DTESC","sxml":""}