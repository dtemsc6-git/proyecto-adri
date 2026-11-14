alter table wksp_dtesc.sgt_enlaces_tramos
    add constraint et_interface_a_id_fk
        foreign key ( interfaz_a_id )
            references wksp_dtesc.sgt_interfaces ( id )
        enable;


-- sqlcl_snapshot {"hash":"21f4b3b62eab1b942de095a8f252a053fe54411b","type":"REF_CONSTRAINT","name":"ET_INTERFACE_A_ID_FK","schemaName":"WKSP_DTESC","sxml":""}