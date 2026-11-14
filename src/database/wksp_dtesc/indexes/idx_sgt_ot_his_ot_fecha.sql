create index wksp_dtesc.idx_sgt_ot_his_ot_fecha on
    wksp_dtesc.sgt_ot_historial (
        ot_id,
        fecha_evento
    desc );


-- sqlcl_snapshot {"hash":"b5cf879cb17ba59f0c6198deebbb7a02d2f57763","type":"INDEX","name":"IDX_SGT_OT_HIS_OT_FECHA","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_SGT_OT_HIS_OT_FECHA</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_OT_HISTORIAL</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>OT_ID</NAME>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <DEFAULT_EXPRESSION>\"FECHA_EVENTO\"</DEFAULT_EXPRESSION>\n            <DESC></DESC>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}