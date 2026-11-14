create unique index wksp_dtesc.sgt_racks_sala_nombre_uniq on
    wksp_dtesc.sgt_racks (
        sala_id,
    upper(nombre) );


-- sqlcl_snapshot {"hash":"a490a92e36aac459313be76e1a576f8ad85061c7","type":"INDEX","name":"SGT_RACKS_SALA_NOMBRE_UNIQ","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <UNIQUE></UNIQUE>\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>SGT_RACKS_SALA_NOMBRE_UNIQ</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_RACKS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>SALA_ID</NAME>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <DEFAULT_EXPRESSION>UPPER(\"NOMBRE\")</DEFAULT_EXPRESSION>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}