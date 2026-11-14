create index wksp_dtesc.sgt_enlaces_wan_servicio_i2 on
    wksp_dtesc.sgt_enlaces_wan_servicio (
        enlace_id
    );


-- sqlcl_snapshot {"hash":"3a6308cb0fbb5b3fd1212681401f19a6042f6235","type":"INDEX","name":"SGT_ENLACES_WAN_SERVICIO_I2","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>SGT_ENLACES_WAN_SERVICIO_I2</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_ENLACES_WAN_SERVICIO</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ENLACE_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}