alter table wksp_dtesc.sgt_interfaces
    add constraint interfaces_con_equipos_chk
        foreign key ( equipo_id )
            references wksp_dtesc.sgt_equipos ( id )
        enable;


-- sqlcl_snapshot {"hash":"b9ebea30734173750cc2aab71d83cf8ad7cc57a5","type":"REF_CONSTRAINT","name":"INTERFACES_CON_EQUIPOS_CHK","schemaName":"WKSP_DTESC","sxml":""}