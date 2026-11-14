alter table wksp_dtesc.sgt_enlaces_tramos
    add constraint et_interface_b_id_fk
        foreign key ( interfaz_b_id )
            references wksp_dtesc.sgt_interfaces ( id )
        enable;


-- sqlcl_snapshot {"hash":"a8b4ba6284da576cd9d5d732074d699c32c1b052","type":"REF_CONSTRAINT","name":"ET_INTERFACE_B_ID_FK","schemaName":"WKSP_DTESC","sxml":""}