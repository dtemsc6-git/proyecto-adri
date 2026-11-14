create unique index wksp_dtesc.idx_servicios_uniq on
    wksp_dtesc.sgt_servicios ( upper(nombre) );


-- sqlcl_snapshot {"hash":"3e820e68d414294da3277aed0a4ff73174c1b41d","type":"INDEX","name":"IDX_SERVICIOS_UNIQ","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <UNIQUE></UNIQUE>\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_SERVICIOS_UNIQ</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_SERVICIOS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <DEFAULT_EXPRESSION>UPPER(\"NOMBRE\")</DEFAULT_EXPRESSION>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}