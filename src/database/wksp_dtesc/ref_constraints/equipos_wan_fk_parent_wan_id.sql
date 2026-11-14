alter table wksp_dtesc.sgt_equipos_wan
    add constraint equipos_wan_fk_parent_wan_id
        foreign key ( parent_wan_id )
            references wksp_dtesc.sgt_enlaces_wan ( id )
        enable;


-- sqlcl_snapshot {"hash":"73f3ce4649b157587454f4e440bcef0339383831","type":"REF_CONSTRAINT","name":"EQUIPOS_WAN_FK_PARENT_WAN_ID","schemaName":"WKSP_DTESC","sxml":""}