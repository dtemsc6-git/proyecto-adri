create or replace editionable trigger wksp_dtesc.trg_test_archivos_obsoleto before
    insert or update or delete on wksp_dtesc.sgt_archivos
    for each row
begin
    if ( :new.estado = 2 ) then
        :new.internal_attr := 'obsoleto';
    end if;
end;
/

alter trigger wksp_dtesc.trg_test_archivos_obsoleto enable;


-- sqlcl_snapshot {"hash":"a60aef8592b0fa01f9e3798b4111587a19df272d","type":"TRIGGER","name":"TRG_TEST_ARCHIVOS_OBSOLETO","schemaName":"WKSP_DTESC","sxml":""}