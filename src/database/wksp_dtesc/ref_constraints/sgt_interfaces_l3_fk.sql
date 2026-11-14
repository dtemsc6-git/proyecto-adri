alter table wksp_dtesc.sgt_interfaces_l3
    add constraint sgt_interfaces_l3_fk
        foreign key ( interface_id )
            references wksp_dtesc.sgt_interfaces ( id )
        enable;


-- sqlcl_snapshot {"hash":"3b23a7488b891e7fd20e02a1f3edb263d7ec69c0","type":"REF_CONSTRAINT","name":"SGT_INTERFACES_L3_FK","schemaName":"WKSP_DTESC","sxml":""}