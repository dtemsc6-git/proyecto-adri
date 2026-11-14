create unique index wksp_dtesc.sgt_interfaces_equipo_nombre_unique on
    wksp_dtesc.sgt_interfaces (
        equipo_id,
    upper(nombre) );


-- sqlcl_snapshot {"hash":"349d2a4c1bae7652575021c6383e86ca670c6b1b","type":"INDEX","name":"SGT_INTERFACES_EQUIPO_NOMBRE_UNIQUE","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <UNIQUE></UNIQUE>\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>SGT_INTERFACES_EQUIPO_NOMBRE_UNIQUE</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_INTERFACES</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>EQUIPO_ID</NAME>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <DEFAULT_EXPRESSION>UPPER(\"NOMBRE\")</DEFAULT_EXPRESSION>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}