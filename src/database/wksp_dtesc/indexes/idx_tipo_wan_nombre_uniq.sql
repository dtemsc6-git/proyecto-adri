create unique index wksp_dtesc.idx_tipo_wan_nombre_uniq on
    wksp_dtesc.sgt_tipo_wan ( upper(nombre) );


-- sqlcl_snapshot {"hash":"b57304cbaae344a29d1b28e6397dcef4b062dca8","type":"INDEX","name":"IDX_TIPO_WAN_NOMBRE_UNIQ","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <UNIQUE></UNIQUE>\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_TIPO_WAN_NOMBRE_UNIQ</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_TIPO_WAN</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <DEFAULT_EXPRESSION>UPPER(\"NOMBRE\")</DEFAULT_EXPRESSION>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}