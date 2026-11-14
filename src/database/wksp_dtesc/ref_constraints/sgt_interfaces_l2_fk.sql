alter table wksp_dtesc.sgt_interfaces_l2
    add constraint sgt_interfaces_l2_fk
        foreign key ( interface_id )
            references wksp_dtesc.sgt_interfaces ( id )
        enable;


-- sqlcl_snapshot {"hash":"6d1a89c2130feea3f0e811d4bfe4b488d3f24626","type":"REF_CONSTRAINT","name":"SGT_INTERFACES_L2_FK","schemaName":"WKSP_DTESC","sxml":""}