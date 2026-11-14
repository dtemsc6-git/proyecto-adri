alter table wksp_dtesc.sgt_evento_evidencia
    add constraint fk_sgt_evento_evidencia_accion
        foreign key ( evento_accion_id )
            references wksp_dtesc.sgt_evento_accion ( id )
                on delete set null
        enable;


-- sqlcl_snapshot {"hash":"062abbc8ad39ad37d7f90b74e8bcbd71031c2554","type":"REF_CONSTRAINT","name":"FK_SGT_EVENTO_EVIDENCIA_ACCION","schemaName":"WKSP_DTESC","sxml":""}