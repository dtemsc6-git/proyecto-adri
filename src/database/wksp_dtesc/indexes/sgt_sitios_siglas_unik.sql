create unique index wksp_dtesc.sgt_sitios_siglas_unik on
    wksp_dtesc.sgt_sitios ( upper(siglas) );


-- sqlcl_snapshot {"hash":"da63b6b6a6cdc544485a3de01d47176575d97460","type":"INDEX","name":"SGT_SITIOS_SIGLAS_UNIK","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <UNIQUE></UNIQUE>\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>SGT_SITIOS_SIGLAS_UNIK</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_SITIOS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <DEFAULT_EXPRESSION>UPPER(\"SIGLAS\")</DEFAULT_EXPRESSION>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}