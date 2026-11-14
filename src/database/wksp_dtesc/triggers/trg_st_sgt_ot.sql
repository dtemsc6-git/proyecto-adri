create or replace editionable trigger wksp_dtesc.trg_st_sgt_ot before
    insert or update on wksp_dtesc.sgt_ot
    for each row
declare
    v_estado_nuevo_id number;
begin
    if inserting then
        if :new.codigo is null then
            :new.codigo := 'OT-'
                           || to_char(sysdate, 'YYYY')
                           || '-'
                           || lpad(:new.id,
                                   6,
                                   '0');
        end if;

        if :new.estado_id is null then
            select
                id
            into v_estado_nuevo_id
            from
                sgt_cat_ot_estado
            where
                codigo = 'NUEVO';

            :new.estado_id := v_estado_nuevo_id;
        end if;

        :new.creado_el := systimestamp;
        :new.creado_por := nvl(wwv_flow.g_user, user);
        :new.actualizado_el := systimestamp;
        :new.actualizado_por := nvl(wwv_flow.g_user, user);
        :new.fecha_actualizacion := systimestamp;
    elsif updating then
        :new.actualizado_el := systimestamp;
        :new.actualizado_por := nvl(wwv_flow.g_user, user);
        :new.fecha_actualizacion := systimestamp;
    end if;
end;
/

alter trigger wksp_dtesc.trg_st_sgt_ot enable;


-- sqlcl_snapshot {"hash":"ac54781f4677061d667f8302dc73c201c65e3187","type":"TRIGGER","name":"TRG_ST_SGT_OT","schemaName":"WKSP_DTESC","sxml":""}