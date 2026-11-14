alter table wksp_dtesc.sgt_equipos_wan
    add constraint sgt_equipos_wan_fk_iface
        foreign key ( interfaz_a_id )
            references wksp_dtesc.sgt_interfaces ( id )
        enable;


-- sqlcl_snapshot {"hash":"70ca6e3293da16fa92a68b5dc3b1bae6c0e842e6","type":"REF_CONSTRAINT","name":"SGT_EQUIPOS_WAN_FK_IFACE","schemaName":"WKSP_DTESC","sxml":""}