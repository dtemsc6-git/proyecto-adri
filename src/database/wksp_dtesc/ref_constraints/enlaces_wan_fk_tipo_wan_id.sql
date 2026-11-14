alter table wksp_dtesc.sgt_enlaces_wan
    add constraint enlaces_wan_fk_tipo_wan_id
        foreign key ( tipo_wan_id )
            references wksp_dtesc.sgt_tipo_wan ( id )
        enable;


-- sqlcl_snapshot {"hash":"3a77ce075ddcf4626baff7131a84edd1c7dfeffa","type":"REF_CONSTRAINT","name":"ENLACES_WAN_FK_TIPO_WAN_ID","schemaName":"WKSP_DTESC","sxml":""}