alter table wksp_dtesc.sgt_tarea
    add constraint fk_sgt_tarea_tipo
        foreign key ( tipo_tarea_id )
            references wksp_dtesc.sgt_cat_tipo_accion_evento ( id )
        enable;


-- sqlcl_snapshot {"hash":"eb48a8c1d2af587cf1c7e9623d17982d0b63e4d2","type":"REF_CONSTRAINT","name":"FK_SGT_TAREA_TIPO","schemaName":"WKSP_DTESC","sxml":""}