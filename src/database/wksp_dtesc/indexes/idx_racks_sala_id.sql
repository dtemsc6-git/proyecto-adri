create index wksp_dtesc.idx_racks_sala_id on
    wksp_dtesc.sgt_racks (
        sala_id
    );


-- sqlcl_snapshot {"hash":"b9a5ebe480225b4958682199721381ebc0728dbf","type":"INDEX","name":"IDX_RACKS_SALA_ID","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_RACKS_SALA_ID</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_RACKS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>SALA_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}