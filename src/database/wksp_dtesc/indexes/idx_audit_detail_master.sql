create index wksp_dtesc.idx_audit_detail_master on
    wksp_dtesc.audit_detail (
        audit_id
    );


-- sqlcl_snapshot {"hash":"37274edabf6e7ddf7092b66147c4d99c85319a28","type":"INDEX","name":"IDX_AUDIT_DETAIL_MASTER","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_AUDIT_DETAIL_MASTER</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>AUDIT_DETAIL</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>AUDIT_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}