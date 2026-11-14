create index wksp_dtesc.idx_sgt_ot_asig_usr on
    wksp_dtesc.sgt_ot_asignacion (
        usuario_asignado,
        fecha_asignacion
    desc );


-- sqlcl_snapshot {"hash":"1c17bc123d4427e3e44ac05b89743e1b7f7c4f6d","type":"INDEX","name":"IDX_SGT_OT_ASIG_USR","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_SGT_OT_ASIG_USR</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_OT_ASIGNACION</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>USUARIO_ASIGNADO</NAME>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <DEFAULT_EXPRESSION>\"FECHA_ASIGNACION\"</DEFAULT_EXPRESSION>\n            <DESC></DESC>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}