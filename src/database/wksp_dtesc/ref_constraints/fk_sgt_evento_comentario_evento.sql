alter table wksp_dtesc.sgt_evento_comentario
    add constraint fk_sgt_evento_comentario_evento
        foreign key ( evento_id )
            references wksp_dtesc.sgt_evento_operativo ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"3097eca1dde5806c6dfb50f87ffd32aa977675f0","type":"REF_CONSTRAINT","name":"FK_SGT_EVENTO_COMENTARIO_EVENTO","schemaName":"WKSP_DTESC","sxml":""}