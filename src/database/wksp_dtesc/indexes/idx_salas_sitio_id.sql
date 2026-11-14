create index wksp_dtesc.idx_salas_sitio_id on
    wksp_dtesc.sgt_salas (
        sitio_id
    );


-- sqlcl_snapshot {"hash":"b424da13dc985a86ad773b4a937b88041c06c9ca","type":"INDEX","name":"IDX_SALAS_SITIO_ID","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_SALAS_SITIO_ID</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_SALAS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>SITIO_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}