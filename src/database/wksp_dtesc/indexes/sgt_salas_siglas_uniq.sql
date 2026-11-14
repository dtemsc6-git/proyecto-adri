create unique index wksp_dtesc.sgt_salas_siglas_uniq on
    wksp_dtesc.sgt_salas (
        sitio_id,
    upper(siglas) );


-- sqlcl_snapshot {"hash":"311d5737127c3252e30769526a97cf50eaf453fe","type":"INDEX","name":"SGT_SALAS_SIGLAS_UNIQ","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <UNIQUE></UNIQUE>\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>SGT_SALAS_SIGLAS_UNIQ</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_SALAS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>SITIO_ID</NAME>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <DEFAULT_EXPRESSION>UPPER(\"SIGLAS\")</DEFAULT_EXPRESSION>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}