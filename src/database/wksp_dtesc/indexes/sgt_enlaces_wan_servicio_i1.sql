create index wksp_dtesc.sgt_enlaces_wan_servicio_i1 on
    wksp_dtesc.sgt_enlaces_wan_servicio (
        servicio_id
    );


-- sqlcl_snapshot {"hash":"62f8d99b2503a4c8cfd05e655aa549b6d4e991c2","type":"INDEX","name":"SGT_ENLACES_WAN_SERVICIO_I1","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>SGT_ENLACES_WAN_SERVICIO_I1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_ENLACES_WAN_SERVICIO</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>SERVICIO_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}