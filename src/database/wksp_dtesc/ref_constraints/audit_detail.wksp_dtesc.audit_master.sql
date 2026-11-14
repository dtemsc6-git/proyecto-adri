alter table wksp_dtesc.audit_detail
    add
        foreign key ( audit_id )
            references wksp_dtesc.audit_master ( audit_id )
        enable;


-- sqlcl_snapshot {"hash":"c242b3bc673da77e2fede47fac1c9b929b056406","type":"REF_CONSTRAINT","name":"AUDIT_DETAIL.WKSP_DTESC.AUDIT_MASTER","schemaName":"WKSP_DTESC","sxml":""}