create unique index wksp_dtesc.siglas_unica on
    wksp_dtesc.sgt_tipo_equipos ( upper(siglas) );


-- sqlcl_snapshot {"hash":"986fe9afce705e50e8e37839a10e357d7253fecf","type":"INDEX","name":"SIGLAS_UNICA","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <UNIQUE></UNIQUE>\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>SIGLAS_UNICA</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_TIPO_EQUIPOS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <DEFAULT_EXPRESSION>UPPER(\"SIGLAS\")</DEFAULT_EXPRESSION>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}