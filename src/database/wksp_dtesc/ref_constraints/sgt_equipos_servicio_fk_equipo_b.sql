alter table wksp_dtesc.sgt_equipos_servicio
    add constraint sgt_equipos_servicio_fk_equipo_b
        foreign key ( equipo_b_id )
            references wksp_dtesc.sgt_equipos ( id )
        enable;


-- sqlcl_snapshot {"hash":"4ac8d567e3f4d36c39a6bb40a618be1b6c835095","type":"REF_CONSTRAINT","name":"SGT_EQUIPOS_SERVICIO_FK_EQUIPO_B","schemaName":"WKSP_DTESC","sxml":""}