create index wksp_dtesc.idx_audit_master_action on
    wksp_dtesc.audit_master (
        action_type,
        timestamp
    desc );


-- sqlcl_snapshot {"hash":"ac63a1f7714a812183fef0ba4d539ebeafa19a9f","type":"INDEX","name":"IDX_AUDIT_MASTER_ACTION","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_AUDIT_MASTER_ACTION</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>AUDIT_MASTER</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ACTION_TYPE</NAME>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <DEFAULT_EXPRESSION>\"TIMESTAMP\"</DEFAULT_EXPRESSION>\n            <DESC></DESC>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}