create index wksp_dtesc.idx_audit_master_ts on
    wksp_dtesc.audit_master (
        timestamp
    desc,
        audit_id
    desc );


-- sqlcl_snapshot {"hash":"4a2fd29dcfb44964b69c6c7f44a3bf4bed2d0a7e","type":"INDEX","name":"IDX_AUDIT_MASTER_TS","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_AUDIT_MASTER_TS</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>AUDIT_MASTER</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <DEFAULT_EXPRESSION>\"TIMESTAMP\"</DEFAULT_EXPRESSION>\n            <DESC></DESC>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <DEFAULT_EXPRESSION>\"AUDIT_ID\"</DEFAULT_EXPRESSION>\n            <DESC></DESC>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}