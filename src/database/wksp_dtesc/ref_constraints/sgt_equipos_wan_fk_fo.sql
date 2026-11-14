alter table wksp_dtesc.sgt_equipos_wan
    add constraint sgt_equipos_wan_fk_fo
        foreign key ( fo_id )
            references wksp_dtesc.sgt_enlaces_fo ( id )
        enable;


-- sqlcl_snapshot {"hash":"f47cac4916beb75329772b5ecee7b4d9ff9e7211","type":"REF_CONSTRAINT","name":"SGT_EQUIPOS_WAN_FK_FO","schemaName":"WKSP_DTESC","sxml":""}