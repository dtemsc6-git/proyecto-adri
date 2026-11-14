create index wksp_dtesc.idx_sgt_evento_accion_evento_activo on
    wksp_dtesc.sgt_evento_accion (
        evento_activo_id
    );


-- sqlcl_snapshot {"hash":"f3f2fe53b0d59e3a27f0ff738409ff7596efd8d0","type":"INDEX","name":"IDX_SGT_EVENTO_ACCION_EVENTO_ACTIVO","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_SGT_EVENTO_ACCION_EVENTO_ACTIVO</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_EVENTO_ACCION</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>EVENTO_ACTIVO_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}