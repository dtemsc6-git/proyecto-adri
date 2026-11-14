create index wksp_dtesc.idx_sgt_tarea_evento on
    wksp_dtesc.sgt_tarea (
        evento_id
    );


-- sqlcl_snapshot {"hash":"16817b46a6c8058dbd7db5bb559ece3183ec2d18","type":"INDEX","name":"IDX_SGT_TAREA_EVENTO","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_SGT_TAREA_EVENTO</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_TAREA</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>EVENTO_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}