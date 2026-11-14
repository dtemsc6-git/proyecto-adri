alter table wksp_dtesc.sgt_equipos_servicio
    add constraint sgt_equipos_servicio_fk_iface_b
        foreign key ( interfaz_b_id )
            references wksp_dtesc.sgt_interfaces ( id )
        enable;


-- sqlcl_snapshot {"hash":"f0d9428906d64c21604a8b8d1a477ca2292f944f","type":"REF_CONSTRAINT","name":"SGT_EQUIPOS_SERVICIO_FK_IFACE_B","schemaName":"WKSP_DTESC","sxml":""}