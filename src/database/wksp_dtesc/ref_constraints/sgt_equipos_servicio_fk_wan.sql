alter table wksp_dtesc.sgt_equipos_servicio
    add constraint sgt_equipos_servicio_fk_wan
        foreign key ( wan_id )
            references wksp_dtesc.sgt_enlaces_wan ( id )
        enable;


-- sqlcl_snapshot {"hash":"149eb719977955e2abdbaa18433bb9c026b8895e","type":"REF_CONSTRAINT","name":"SGT_EQUIPOS_SERVICIO_FK_WAN","schemaName":"WKSP_DTESC","sxml":""}