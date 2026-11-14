alter table wksp_dtesc.sgt_enlaces_tramos
    add constraint et_equipo_b_fk
        foreign key ( equipo_b_id )
            references wksp_dtesc.sgt_equipos ( id )
        enable;


-- sqlcl_snapshot {"hash":"c4ab6635afbc954a078e8468837592ee3be03b5e","type":"REF_CONSTRAINT","name":"ET_EQUIPO_B_FK","schemaName":"WKSP_DTESC","sxml":""}