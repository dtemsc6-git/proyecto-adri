alter table wksp_dtesc.sgt_evento_accion
    add constraint fk_sgt_evento_accion_evento_activo
        foreign key ( evento_activo_id )
            references wksp_dtesc.sgt_evento_activo ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"cb7db5b5f8fcba1679cd3f0511d6b17bcbaaf051","type":"REF_CONSTRAINT","name":"FK_SGT_EVENTO_ACCION_EVENTO_ACTIVO","schemaName":"WKSP_DTESC","sxml":""}