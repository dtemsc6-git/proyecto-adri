create index wksp_dtesc.idx_sgt_evento_activo_evento on
    wksp_dtesc.sgt_evento_activo (
        evento_id
    );


-- sqlcl_snapshot {"hash":"429dde21804e5bd804ee78763042ef6699efaa64","type":"INDEX","name":"IDX_SGT_EVENTO_ACTIVO_EVENTO","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_SGT_EVENTO_ACTIVO_EVENTO</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_EVENTO_ACTIVO</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>EVENTO_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}