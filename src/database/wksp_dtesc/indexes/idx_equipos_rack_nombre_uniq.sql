create unique index wksp_dtesc.idx_equipos_rack_nombre_uniq on
    wksp_dtesc.sgt_equipos (
        rack_id,
    upper(nombre) );


-- sqlcl_snapshot {"hash":"be274e9239a0dca4348e577f643466f30289b0bf","type":"INDEX","name":"IDX_EQUIPOS_RACK_NOMBRE_UNIQ","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <UNIQUE></UNIQUE>\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_EQUIPOS_RACK_NOMBRE_UNIQ</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_EQUIPOS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>RACK_ID</NAME>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <DEFAULT_EXPRESSION>UPPER(\"NOMBRE\")</DEFAULT_EXPRESSION>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}