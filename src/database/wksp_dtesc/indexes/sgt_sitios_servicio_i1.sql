create index wksp_dtesc.sgt_sitios_servicio_i1 on
    wksp_dtesc.sgt_sitios_servicio (
        sitio_id
    );


-- sqlcl_snapshot {"hash":"05b1d103bae721d7813afc60fd411b3d08fb31c0","type":"INDEX","name":"SGT_SITIOS_SERVICIO_I1","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>SGT_SITIOS_SERVICIO_I1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_SITIOS_SERVICIO</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>SITIO_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}