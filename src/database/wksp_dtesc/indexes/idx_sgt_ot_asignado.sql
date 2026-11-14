create index wksp_dtesc.idx_sgt_ot_asignado on
    wksp_dtesc.sgt_ot (
        asignado_a,
        estado_id
    );


-- sqlcl_snapshot {"hash":"6bd6cf626dea3f6a746cfee61b6e1b2fe61f3ed2","type":"INDEX","name":"IDX_SGT_OT_ASIGNADO","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_SGT_OT_ASIGNADO</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_OT</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ASIGNADO_A</NAME>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>ESTADO_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}