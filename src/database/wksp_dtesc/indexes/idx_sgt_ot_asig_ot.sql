create index wksp_dtesc.idx_sgt_ot_asig_ot on
    wksp_dtesc.sgt_ot_asignacion (
        ot_id
    );


-- sqlcl_snapshot {"hash":"a525e7c09f4def300c1cb7019161bfcd279985e3","type":"INDEX","name":"IDX_SGT_OT_ASIG_OT","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_SGT_OT_ASIG_OT</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_OT_ASIGNACION</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>OT_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}