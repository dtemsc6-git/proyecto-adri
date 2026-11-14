create index wksp_dtesc.idx_conexiones_enlace_wan_compuesto on
    wksp_dtesc.sgt_conexiones_enlace_wan (
        enlace_wan_id,
        enlace_tramo_id
    );


-- sqlcl_snapshot {"hash":"bba399f90fa8bb5aaed77d7a783bab9b80252554","type":"INDEX","name":"IDX_CONEXIONES_ENLACE_WAN_COMPUESTO","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_CONEXIONES_ENLACE_WAN_COMPUESTO</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_CONEXIONES_ENLACE_WAN</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ENLACE_WAN_ID</NAME>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>ENLACE_TRAMO_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}