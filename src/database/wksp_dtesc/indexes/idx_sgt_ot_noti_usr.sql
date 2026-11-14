create index wksp_dtesc.idx_sgt_ot_noti_usr on
    wksp_dtesc.sgt_ot_notificacion (
        usuario_destino,
        leida,
        fecha_creacion
    desc );


-- sqlcl_snapshot {"hash":"35541c03fd59b970c383505b8c023d18a070d5a2","type":"INDEX","name":"IDX_SGT_OT_NOTI_USR","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_SGT_OT_NOTI_USR</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_OT_NOTIFICACION</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>USUARIO_DESTINO</NAME>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>LEIDA</NAME>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <DEFAULT_EXPRESSION>\"FECHA_CREACION\"</DEFAULT_EXPRESSION>\n            <DESC></DESC>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}