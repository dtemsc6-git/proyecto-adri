alter table wksp_dtesc.sgt_equipos_servicio
    add constraint sgt_equipos_servicio_fk_equipo_a
        foreign key ( equipo_a_id )
            references wksp_dtesc.sgt_equipos ( id )
        enable;


-- sqlcl_snapshot {"hash":"8bb3ce3f93a216a5a1a09a36654447093368c2ee","type":"REF_CONSTRAINT","name":"SGT_EQUIPOS_SERVICIO_FK_EQUIPO_A","schemaName":"WKSP_DTESC","sxml":""}