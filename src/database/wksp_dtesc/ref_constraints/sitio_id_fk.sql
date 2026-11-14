alter table wksp_dtesc.sgt_equipos
    add constraint sitio_id_fk
        foreign key ( sitio_id )
            references wksp_dtesc.sgt_sitios ( id )
        enable;


-- sqlcl_snapshot {"hash":"3ed5ffa3d5ee192dd6347ed4a19c653d32766700","type":"REF_CONSTRAINT","name":"SITIO_ID_FK","schemaName":"WKSP_DTESC","sxml":""}