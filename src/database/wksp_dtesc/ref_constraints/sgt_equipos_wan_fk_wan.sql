alter table wksp_dtesc.sgt_equipos_wan
    add constraint sgt_equipos_wan_fk_wan
        foreign key ( wan_id )
            references wksp_dtesc.sgt_enlaces_wan ( id )
        enable;


-- sqlcl_snapshot {"hash":"3088ec24fb662863cc9fd030226a27596e1a6f39","type":"REF_CONSTRAINT","name":"SGT_EQUIPOS_WAN_FK_WAN","schemaName":"WKSP_DTESC","sxml":""}