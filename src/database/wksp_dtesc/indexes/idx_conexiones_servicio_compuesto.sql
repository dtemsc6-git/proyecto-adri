create index wksp_dtesc.idx_conexiones_servicio_compuesto on
    wksp_dtesc.sgt_conexiones_servicio (
        servicio_id,
        enlace_tramo_id
    );


-- sqlcl_snapshot {"hash":"0cd1b379fda43efdbd30ec280ea2ec047c0880b9","type":"INDEX","name":"IDX_CONEXIONES_SERVICIO_COMPUESTO","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_CONEXIONES_SERVICIO_COMPUESTO</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_CONEXIONES_SERVICIO</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>SERVICIO_ID</NAME>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>ENLACE_TRAMO_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}