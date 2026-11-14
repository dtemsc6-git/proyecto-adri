create index wksp_dtesc.sgt_sitios_servicio_i2 on
    wksp_dtesc.sgt_sitios_servicio (
        servicio_id
    );


-- sqlcl_snapshot {"hash":"55ee08fe07aadf91db1c22737ba46f56bcca813d","type":"INDEX","name":"SGT_SITIOS_SERVICIO_I2","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>SGT_SITIOS_SERVICIO_I2</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_SITIOS_SERVICIO</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>SERVICIO_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}