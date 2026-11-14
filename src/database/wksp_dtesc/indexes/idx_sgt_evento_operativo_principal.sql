create index wksp_dtesc.idx_sgt_evento_operativo_principal on
    wksp_dtesc.sgt_evento_operativo (
        tipo_activo_principal_id,
        activo_principal_id
    );


-- sqlcl_snapshot {"hash":"e90d4c5d785f7d23a8d9e860051dbe3a9ca3397e","type":"INDEX","name":"IDX_SGT_EVENTO_OPERATIVO_PRINCIPAL","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_SGT_EVENTO_OPERATIVO_PRINCIPAL</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_EVENTO_OPERATIVO</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>TIPO_ACTIVO_PRINCIPAL_ID</NAME>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>ACTIVO_PRINCIPAL_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}