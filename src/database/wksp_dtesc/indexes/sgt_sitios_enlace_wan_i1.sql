create index wksp_dtesc.sgt_sitios_enlace_wan_i1 on
    wksp_dtesc.sgt_sitios_enlace_wan (
        sitio_id
    );


-- sqlcl_snapshot {"hash":"9cdc5796c769d86e768f81bf2966581d0e5d0e32","type":"INDEX","name":"SGT_SITIOS_ENLACE_WAN_I1","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>SGT_SITIOS_ENLACE_WAN_I1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_SITIOS_ENLACE_WAN</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>SITIO_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}