alter table wksp_dtesc.sgt_salas
    add constraint sgt_salas_con
        foreign key ( sitio_id )
            references wksp_dtesc.sgt_sitios ( id )
        enable;


-- sqlcl_snapshot {"hash":"f14219c825bf6cbb46e5cda8381759e2943e41eb","type":"REF_CONSTRAINT","name":"SGT_SALAS_CON","schemaName":"WKSP_DTESC","sxml":""}