alter table wksp_dtesc.sgt_equipos
    add constraint equipos_con_tipo_equipos_chk
        foreign key ( tipo_equipo_id )
            references wksp_dtesc.sgt_tipo_equipos ( id )
        enable;


-- sqlcl_snapshot {"hash":"c4658dd80a04b2a88675db0aec1d0969eebfba9c","type":"REF_CONSTRAINT","name":"EQUIPOS_CON_TIPO_EQUIPOS_CHK","schemaName":"WKSP_DTESC","sxml":""}