create index wksp_dtesc.idx_enlaces_tramos_tipo_conexion on
    wksp_dtesc.sgt_enlaces_tramos (
        tipo_conexion
    );


-- sqlcl_snapshot {"hash":"1ea2fdce3042d6857770789bee3584c2dd7b63ff","type":"INDEX","name":"IDX_ENLACES_TRAMOS_TIPO_CONEXION","schemaName":"WKSP_DTESC","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>WKSP_DTESC</SCHEMA>\n   <NAME>IDX_ENLACES_TRAMOS_TIPO_CONEXION</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>WKSP_DTESC</SCHEMA>\n         <NAME>SGT_ENLACES_TRAMOS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>TIPO_CONEXION</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n   </TABLE_INDEX>\n</INDEX>"}