alter table wksp_dtesc.sgt_conexiones_enlace_wan
    add constraint fk_conexiones_enlace_tramo
        foreign key ( enlace_tramo_id )
            references wksp_dtesc.sgt_enlaces_tramos ( id )
        enable;


-- sqlcl_snapshot {"hash":"1963b5de251639e444a763a2b732835c1b5197c8","type":"REF_CONSTRAINT","name":"FK_CONEXIONES_ENLACE_TRAMO","schemaName":"WKSP_DTESC","sxml":""}