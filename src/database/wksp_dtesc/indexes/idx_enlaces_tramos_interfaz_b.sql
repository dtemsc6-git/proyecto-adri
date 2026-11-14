create index wksp_dtesc.idx_enlaces_tramos_interfaz_b on
    wksp_dtesc.sgt_enlaces_tramos (
        interfaz_b_id
    );


-- sqlcl_snapshot {"hash":"96621e3303c52af95068162c14d60b9843948356","type":"INDEX","name":"IDX_ENLACES_TRAMOS_INTERFAZ_B","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_ENLACES_TRAMOS_INTERFAZ_B</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_ENLACES_TRAMOS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>INTERFAZ_B_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}