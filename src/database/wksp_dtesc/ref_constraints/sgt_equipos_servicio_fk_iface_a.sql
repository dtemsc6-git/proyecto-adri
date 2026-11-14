alter table wksp_dtesc.sgt_equipos_servicio
    add constraint sgt_equipos_servicio_fk_iface_a
        foreign key ( interfaz_a_id )
            references wksp_dtesc.sgt_interfaces ( id )
        enable;


-- sqlcl_snapshot {"hash":"f3df327112c0efaf1aa5199e919d942baad3db30","type":"REF_CONSTRAINT","name":"SGT_EQUIPOS_SERVICIO_FK_IFACE_A","schemaName":"WKSP_DTESC","sxml":""}