create index wksp_dtesc.sgt_trazados_fo_sdo_data_idx on
    wksp_dtesc.sgt_trazados_fo (
        sdo_data
    )
        indextype is mdsys.spatial_index;


-- sqlcl_snapshot {"hash":"76992a7e2b4d064720319c8340c6a279c309d050","type":"INDEX","name":"SGT_TRAZADOS_FO_SDO_DATA_IDX","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>SGT_TRAZADOS_FO_SDO_DATA_IDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_TRAZADOS_FO</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>SDO_DATA</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      <DOMAIN_INDEX_PROPERTIES>\n         <INDEXTYPE>\n            <SCHEMA>MDSYS</SCHEMA>\n            <NAME>SPATIAL_INDEX</NAME>\n         </INDEXTYPE>\n      </DOMAIN_INDEX_PROPERTIES>\n   </TABLE_INDEX>\n</INDEX>"}