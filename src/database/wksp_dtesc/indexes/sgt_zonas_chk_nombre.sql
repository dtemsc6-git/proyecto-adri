create unique index wksp_dtesc.sgt_zonas_chk_nombre on
    wksp_dtesc.sgt_zonas ( upper(nombre) );


-- sqlcl_snapshot {"hash":"a52244e21c36dff31a0dd61c02d1fb285f7809a2","type":"INDEX","name":"SGT_ZONAS_CHK_NOMBRE","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <UNIQUE></UNIQUE>\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>SGT_ZONAS_CHK_NOMBRE</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_ZONAS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <DEFAULT_EXPRESSION>UPPER(\"NOMBRE\")</DEFAULT_EXPRESSION>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}