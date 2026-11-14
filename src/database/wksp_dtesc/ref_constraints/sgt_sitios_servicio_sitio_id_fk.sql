alter table wksp_dtesc.sgt_sitios_servicio
    add constraint sgt_sitios_servicio_sitio_id_fk
        foreign key ( sitio_id )
            references wksp_dtesc.sgt_sitios ( id )
        enable;


-- sqlcl_snapshot {"hash":"cd0547e2d02c3f8aa4ce455a32f9cf0296e44667","type":"REF_CONSTRAINT","name":"SGT_SITIOS_SERVICIO_SITIO_ID_FK","schemaName":"WKSP_DTESC","sxml":""}