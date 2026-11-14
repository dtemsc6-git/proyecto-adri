alter table wksp_dtesc.sgt_equipos_wan
    add constraint sgt_equipos_wan_fk_iface_b
        foreign key ( interfaz_b_id )
            references wksp_dtesc.sgt_interfaces ( id )
        enable;


-- sqlcl_snapshot {"hash":"e7a701c9281f2e112ddd27812100ffacf1ad181a","type":"REF_CONSTRAINT","name":"SGT_EQUIPOS_WAN_FK_IFACE_B","schemaName":"WKSP_DTESC","sxml":""}