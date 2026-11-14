create index wksp_dtesc.idx_enlaces_tramos_equipo_b on
    wksp_dtesc.sgt_enlaces_tramos (
        equipo_b_id
    );


-- sqlcl_snapshot {"hash":"5a5ca3b167e8a8f534b8c5f6baa0dec3ac6488e0","type":"INDEX","name":"IDX_ENLACES_TRAMOS_EQUIPO_B","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_ENLACES_TRAMOS_EQUIPO_B</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_ENLACES_TRAMOS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>EQUIPO_B_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}