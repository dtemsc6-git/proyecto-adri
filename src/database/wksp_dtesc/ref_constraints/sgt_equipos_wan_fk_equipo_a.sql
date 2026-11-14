alter table wksp_dtesc.sgt_equipos_wan
    add constraint sgt_equipos_wan_fk_equipo_a
        foreign key ( equipo_a_id )
            references wksp_dtesc.sgt_equipos ( id )
        enable;


-- sqlcl_snapshot {"hash":"ab8f1e24e32a0e29c810b508181cbe3b95b8d5f4","type":"REF_CONSTRAINT","name":"SGT_EQUIPOS_WAN_FK_EQUIPO_A","schemaName":"WKSP_DTESC","sxml":""}