alter table wksp_dtesc.sgt_ot_asignacion
    add constraint fk_sgt_ot_asig_ot
        foreign key ( ot_id )
            references wksp_dtesc.sgt_ot ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"fd386745f9896674ec4d90c9fdd98c680d677051","type":"REF_CONSTRAINT","name":"FK_SGT_OT_ASIG_OT","schemaName":"WKSP_DTESC","sxml":""}