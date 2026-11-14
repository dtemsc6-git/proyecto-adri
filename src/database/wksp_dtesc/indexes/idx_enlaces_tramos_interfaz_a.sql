create index wksp_dtesc.idx_enlaces_tramos_interfaz_a on
    wksp_dtesc.sgt_enlaces_tramos (
        interfaz_a_id
    );


-- sqlcl_snapshot {"hash":"c9aabe7c62b3de3e6a928a1557b9dd82ec1cc4db","type":"INDEX","name":"IDX_ENLACES_TRAMOS_INTERFAZ_A","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_ENLACES_TRAMOS_INTERFAZ_A</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_ENLACES_TRAMOS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>INTERFAZ_A_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}