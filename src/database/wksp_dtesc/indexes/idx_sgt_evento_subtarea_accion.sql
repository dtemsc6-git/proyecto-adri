create index wksp_dtesc.idx_sgt_evento_subtarea_accion on
    wksp_dtesc.sgt_evento_subtarea (
        evento_accion_id
    );


-- sqlcl_snapshot {"hash":"365919ab9dc2052222dbd47a75281c6763fea6b6","type":"INDEX","name":"IDX_SGT_EVENTO_SUBTAREA_ACCION","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_SGT_EVENTO_SUBTAREA_ACCION</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_EVENTO_SUBTAREA</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>EVENTO_ACCION_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}