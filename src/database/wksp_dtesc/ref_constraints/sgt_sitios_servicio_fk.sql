alter table wksp_dtesc.sgt_sitios_servicio
    add constraint sgt_sitios_servicio_fk
        foreign key ( servicio_id )
            references wksp_dtesc.sgt_servicios ( id )
        enable;


-- sqlcl_snapshot {"hash":"312dca59de861868eaf77a7704d34242ebb7281f","type":"REF_CONSTRAINT","name":"SGT_SITIOS_SERVICIO_FK","schemaName":"WKSP_DTESC","sxml":""}