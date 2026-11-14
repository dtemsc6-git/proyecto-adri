alter table wksp_dtesc.sgt_evento_evidencia
    add constraint fk_sgt_evento_evidencia_subtarea
        foreign key ( evento_subtarea_id )
            references wksp_dtesc.sgt_evento_subtarea ( id )
                on delete set null
        enable;


-- sqlcl_snapshot {"hash":"004f7c59f49a0039d68d9b1ae6ecf437b2feafe9","type":"REF_CONSTRAINT","name":"FK_SGT_EVENTO_EVIDENCIA_SUBTAREA","schemaName":"WKSP_DTESC","sxml":""}