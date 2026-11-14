create index wksp_dtesc.idx_sgt_evento_operativo_ot on
    wksp_dtesc.sgt_evento_operativo (
        ot_id
    );


-- sqlcl_snapshot {"hash":"9c908ced9266e146fd2496c1020416a1443aabc5","type":"INDEX","name":"IDX_SGT_EVENTO_OPERATIVO_OT","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_SGT_EVENTO_OPERATIVO_OT</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_EVENTO_OPERATIVO</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>OT_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}