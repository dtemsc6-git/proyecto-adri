create index wksp_dtesc.idx_equipos_rack_id on
    wksp_dtesc.sgt_equipos (
        rack_id
    );


-- sqlcl_snapshot {"hash":"3053f0eb3bc58379b8596d0751e5ad799279b3b4","type":"INDEX","name":"IDX_EQUIPOS_RACK_ID","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_EQUIPOS_RACK_ID</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_EQUIPOS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>RACK_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}