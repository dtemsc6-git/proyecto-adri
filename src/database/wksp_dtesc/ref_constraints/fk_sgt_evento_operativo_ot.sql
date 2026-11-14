alter table wksp_dtesc.sgt_evento_operativo
    add constraint fk_sgt_evento_operativo_ot
        foreign key ( ot_id )
            references wksp_dtesc.sgt_ot ( id )
                on delete set null
        enable;


-- sqlcl_snapshot {"hash":"1377a4f866860d35fac38f3be6b157a23ded04fd","type":"REF_CONSTRAINT","name":"FK_SGT_EVENTO_OPERATIVO_OT","schemaName":"WKSP_DTESC","sxml":""}