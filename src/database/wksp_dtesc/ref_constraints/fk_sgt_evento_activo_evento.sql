alter table wksp_dtesc.sgt_evento_activo
    add constraint fk_sgt_evento_activo_evento
        foreign key ( evento_id )
            references wksp_dtesc.sgt_evento_operativo ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"849f0a4d66cf5d1475bc5b0a3220ca3c4407f560","type":"REF_CONSTRAINT","name":"FK_SGT_EVENTO_ACTIVO_EVENTO","schemaName":"WKSP_DTESC","sxml":""}