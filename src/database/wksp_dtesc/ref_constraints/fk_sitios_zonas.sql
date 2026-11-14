alter table wksp_dtesc.sgt_sitios
    add constraint fk_sitios_zonas
        foreign key ( zona_id )
            references wksp_dtesc.sgt_zonas ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"d5195bbf4706b46186c1c439e2b33781ed7f46c1","type":"REF_CONSTRAINT","name":"FK_SITIOS_ZONAS","schemaName":"WKSP_DTESC","sxml":""}