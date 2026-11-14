create index wksp_dtesc.sgt_sitios_enlace_wan_i2 on
    wksp_dtesc.sgt_sitios_enlace_wan (
        enlace_wan_id
    );


-- sqlcl_snapshot {"hash":"6fddd38c739da57b7573471401a3f6162d379f36","type":"INDEX","name":"SGT_SITIOS_ENLACE_WAN_I2","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>SGT_SITIOS_ENLACE_WAN_I2</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_SITIOS_ENLACE_WAN</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ENLACE_WAN_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}