create index wksp_dtesc.idx_sgt_evento_comentario_evento on
    wksp_dtesc.sgt_evento_comentario (
        evento_id,
        fecha_creacion
    desc );


-- sqlcl_snapshot {"hash":"2ad8b57c7f78396205100b4cc97a8904fec9c039","type":"INDEX","name":"IDX_SGT_EVENTO_COMENTARIO_EVENTO","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_SGT_EVENTO_COMENTARIO_EVENTO</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_EVENTO_COMENTARIO</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>EVENTO_ID</NAME>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <DEFAULT_EXPRESSION>\"FECHA_CREACION\"</DEFAULT_EXPRESSION>\n            <DESC></DESC>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}