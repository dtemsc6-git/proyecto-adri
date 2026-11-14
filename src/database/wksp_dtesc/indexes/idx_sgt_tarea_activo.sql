create index wksp_dtesc.idx_sgt_tarea_activo on
    wksp_dtesc.sgt_tarea (
        entidad,
        pk_id
    );


-- sqlcl_snapshot {"hash":"e13bbab711c5d4a40134eb48b5649d7d8978f24d","type":"INDEX","name":"IDX_SGT_TAREA_ACTIVO","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_SGT_TAREA_ACTIVO</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_TAREA</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ENTIDAD</NAME>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>PK_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}