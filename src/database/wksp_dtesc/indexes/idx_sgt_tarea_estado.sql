create index wksp_dtesc.idx_sgt_tarea_estado on
    wksp_dtesc.sgt_tarea (
        estado
    );


-- sqlcl_snapshot {"hash":"77cdc09625d1e2f33f32220db6395ee579e68aee","type":"INDEX","name":"IDX_SGT_TAREA_ESTADO","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_SGT_TAREA_ESTADO</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_TAREA</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ESTADO</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}