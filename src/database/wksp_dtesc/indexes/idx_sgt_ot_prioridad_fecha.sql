create index wksp_dtesc.idx_sgt_ot_prioridad_fecha on
    wksp_dtesc.sgt_ot (
        prioridad_id,
        fecha_recepcion
    desc );


-- sqlcl_snapshot {"hash":"c4d9f190398907c16d15809d8fc0f56124448715","type":"INDEX","name":"IDX_SGT_OT_PRIORIDAD_FECHA","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_SGT_OT_PRIORIDAD_FECHA</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_OT</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>PRIORIDAD_ID</NAME>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <DEFAULT_EXPRESSION>\"FECHA_RECEPCION\"</DEFAULT_EXPRESSION>\n            <DESC></DESC>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}