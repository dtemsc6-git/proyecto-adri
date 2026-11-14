alter table wksp_dtesc.sgt_interfaces
    add constraint interfaces_con_tipo_interfaz_chk
        foreign key ( tipo_interface_id )
            references wksp_dtesc.sgt_tipo_interfaz ( id )
        enable;


-- sqlcl_snapshot {"hash":"d681a6e5702345f4f981ef81fc0755185b24a17b","type":"REF_CONSTRAINT","name":"INTERFACES_CON_TIPO_INTERFAZ_CHK","schemaName":"WKSP_DTESC","sxml":""}