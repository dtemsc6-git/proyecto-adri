alter table wksp_dtesc.sgt_evento_subtarea
    add constraint fk_sgt_evento_subtarea_accion
        foreign key ( evento_accion_id )
            references wksp_dtesc.sgt_evento_accion ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"596d634415c63972d6bcd2cab4c8112c576b57fe","type":"REF_CONSTRAINT","name":"FK_SGT_EVENTO_SUBTAREA_ACCION","schemaName":"WKSP_DTESC","sxml":""}