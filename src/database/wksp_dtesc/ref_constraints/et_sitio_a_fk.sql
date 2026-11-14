alter table wksp_dtesc.sgt_enlaces_tramos
    add constraint et_sitio_a_fk
        foreign key ( lado_id )
            references wksp_dtesc.sgt_sitios ( id )
        enable;


-- sqlcl_snapshot {"hash":"440410a15ebb37f5bf21255db2ed72207a8353b8","type":"REF_CONSTRAINT","name":"ET_SITIO_A_FK","schemaName":"WKSP_DTESC","sxml":""}