alter table wksp_dtesc.sgt_evento_evidencia
    add constraint fk_sgt_evento_evidencia_evento
        foreign key ( evento_id )
            references wksp_dtesc.sgt_evento_operativo ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"eb9871518cb238f864aaf1b1800a78386258622e","type":"REF_CONSTRAINT","name":"FK_SGT_EVENTO_EVIDENCIA_EVENTO","schemaName":"WKSP_DTESC","sxml":""}