alter table wksp_dtesc.sgt_ciudad
    add constraint fk_ciudad_departamento
        foreign key ( depto_id )
            references wksp_dtesc.sgt_depto ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"462fecac99c11c77e6e392b5f15d8a9c5f143c7e","type":"REF_CONSTRAINT","name":"FK_CIUDAD_DEPARTAMENTO","schemaName":"WKSP_DTESC","sxml":""}