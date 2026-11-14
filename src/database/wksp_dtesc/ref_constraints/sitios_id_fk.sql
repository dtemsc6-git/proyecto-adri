alter table wksp_dtesc.sgt_sitios_enlace_wan
    add constraint sitios_id_fk
        foreign key ( sitio_id )
            references wksp_dtesc.sgt_sitios ( id )
        enable;


-- sqlcl_snapshot {"hash":"32382f52430e85932bb77777a24aaba5700aedde","type":"REF_CONSTRAINT","name":"SITIOS_ID_FK","schemaName":"WKSP_DTESC","sxml":""}