alter table wksp_dtesc.sgt_equipos_wan
    add constraint sgt_equipos_wan_fk_equipo_b
        foreign key ( equipo_b_id )
            references wksp_dtesc.sgt_equipos ( id )
        enable;


-- sqlcl_snapshot {"hash":"be4c523935a0733b33e42609ffa559fa189763e1","type":"REF_CONSTRAINT","name":"SGT_EQUIPOS_WAN_FK_EQUIPO_B","schemaName":"WKSP_DTESC","sxml":""}