create index wksp_dtesc.idx_sgt_ot_estado_fecha on
    wksp_dtesc.sgt_ot (
        estado_id,
        fecha_recepcion
    desc );


-- sqlcl_snapshot {"hash":"72014cf3d2a3efced8df7ee77579ac3bd1479c94","type":"INDEX","name":"IDX_SGT_OT_ESTADO_FECHA","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_SGT_OT_ESTADO_FECHA</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_OT</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ESTADO_ID</NAME>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <DEFAULT_EXPRESSION>\"FECHA_RECEPCION\"</DEFAULT_EXPRESSION>\n            <DESC></DESC>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}