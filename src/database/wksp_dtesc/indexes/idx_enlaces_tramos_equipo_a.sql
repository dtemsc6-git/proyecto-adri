create index wksp_dtesc.idx_enlaces_tramos_equipo_a on
    wksp_dtesc.sgt_enlaces_tramos (
        equipo_a_id
    );


-- sqlcl_snapshot {"hash":"275bddee90f436635ba4596ac3f05e9b29300508","type":"INDEX","name":"IDX_ENLACES_TRAMOS_EQUIPO_A","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_ENLACES_TRAMOS_EQUIPO_A</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_ENLACES_TRAMOS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>EQUIPO_A_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}