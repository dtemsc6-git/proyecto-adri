alter table wksp_dtesc.sgt_racks
    add constraint fk_registros_racks
        foreign key ( sala_id )
            references wksp_dtesc.sgt_salas ( id )
        enable;


-- sqlcl_snapshot {"hash":"a541626624d7bede3afb1fd29d9cc3fd626092da","type":"REF_CONSTRAINT","name":"FK_REGISTROS_RACKS","schemaName":"WKSP_DTESC","sxml":""}