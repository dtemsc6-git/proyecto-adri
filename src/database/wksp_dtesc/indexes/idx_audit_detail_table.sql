create index wksp_dtesc.idx_audit_detail_table on
    wksp_dtesc.audit_detail (
        audit_id,
        table_name
    );


-- sqlcl_snapshot {"hash":"eb810b74cfdae94ef2399048f579e1f754e97f75","type":"INDEX","name":"IDX_AUDIT_DETAIL_TABLE","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_AUDIT_DETAIL_TABLE</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>AUDIT_DETAIL</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>AUDIT_ID</NAME>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>TABLE_NAME</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}