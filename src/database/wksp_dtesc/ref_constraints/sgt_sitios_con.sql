alter table wksp_dtesc.sgt_sitios
    add constraint sgt_sitios_con
        foreign key ( ciudad_id )
            references wksp_dtesc.sgt_ciudad ( id )
        enable;


-- sqlcl_snapshot {"hash":"77135c433dfbce972b48630ed87644143ddbc6ec","type":"REF_CONSTRAINT","name":"SGT_SITIOS_CON","schemaName":"WKSP_DTESC","sxml":""}