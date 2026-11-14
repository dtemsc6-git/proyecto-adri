alter table wksp_dtesc.sgt_equipos_servicio
    add constraint sgt_equipos_servicio_fk_serv
        foreign key ( servicio_id )
            references wksp_dtesc.sgt_servicios ( id )
        enable;


-- sqlcl_snapshot {"hash":"4973a7527b5f644fbf500239ab963a3a92604aee","type":"REF_CONSTRAINT","name":"SGT_EQUIPOS_SERVICIO_FK_SERV","schemaName":"WKSP_DTESC","sxml":""}