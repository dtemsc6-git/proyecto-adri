alter table wksp_dtesc.sgt_enlaces_tramos
    add constraint et_equipo_a_fk
        foreign key ( equipo_a_id )
            references wksp_dtesc.sgt_equipos ( id )
        enable;


-- sqlcl_snapshot {"hash":"5e01643f3415b563969448da665bf916f21d70aa","type":"REF_CONSTRAINT","name":"ET_EQUIPO_A_FK","schemaName":"WKSP_DTESC","sxml":""}