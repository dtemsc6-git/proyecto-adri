create index wksp_dtesc.idx_cuidad_depto on
    wksp_dtesc.sgt_ciudad (
        depto_id
    );


-- sqlcl_snapshot {"hash":"2591e49e57402a2c45c1bbec9072ba1095e79c8e","type":"INDEX","name":"IDX_CUIDAD_DEPTO","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_CUIDAD_DEPTO</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_CIUDAD</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>DEPTO_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}