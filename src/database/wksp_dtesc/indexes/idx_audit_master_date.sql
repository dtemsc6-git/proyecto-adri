create index wksp_dtesc.idx_audit_master_date on
    wksp_dtesc.audit_master (
        timestamp
    );


-- sqlcl_snapshot {"hash":"5220e44de68fb6c141d02ebb8b53516ed7c5be03","type":"INDEX","name":"IDX_AUDIT_MASTER_DATE","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_AUDIT_MASTER_DATE</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>AUDIT_MASTER</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>TIMESTAMP</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}