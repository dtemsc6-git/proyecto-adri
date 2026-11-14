create index wksp_dtesc.idx_sgt_evento_activo_tipo on
    wksp_dtesc.sgt_evento_activo (
        tipo_activo_id,
        activo_id
    );


-- sqlcl_snapshot {"hash":"6290815ffa4b3c13443e492d40bd02a24e704f65","type":"INDEX","name":"IDX_SGT_EVENTO_ACTIVO_TIPO","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_SGT_EVENTO_ACTIVO_TIPO</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_EVENTO_ACTIVO</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>TIPO_ACTIVO_ID</NAME>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>ACTIVO_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}