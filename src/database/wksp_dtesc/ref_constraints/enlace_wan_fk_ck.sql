alter table wksp_dtesc.sgt_sitios_enlace_wan
    add constraint enlace_wan_fk_ck
        foreign key ( enlace_wan_id )
            references wksp_dtesc.sgt_enlaces_wan ( id )
        enable;


-- sqlcl_snapshot {"hash":"b47dbd7b78f756c0ca65f10f26425d433f699830","type":"REF_CONSTRAINT","name":"ENLACE_WAN_FK_CK","schemaName":"WKSP_DTESC","sxml":""}