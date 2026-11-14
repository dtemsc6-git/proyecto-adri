alter table wksp_dtesc.sgt_equipos
    add constraint equipos_con_racks_chk
        foreign key ( rack_id )
            references wksp_dtesc.sgt_racks ( id )
        enable;


-- sqlcl_snapshot {"hash":"b2fa5ca81c85b40678e576acf66aab1aaedfd2aa","type":"REF_CONSTRAINT","name":"EQUIPOS_CON_RACKS_CHK","schemaName":"WKSP_DTESC","sxml":""}