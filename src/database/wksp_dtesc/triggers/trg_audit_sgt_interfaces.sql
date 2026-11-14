create or replace editionable trigger wksp_dtesc.trg_audit_sgt_interfaces after
    insert or update or delete on wksp_dtesc.sgt_interfaces
    for each row
declare
    v_audit_id    number;
    v_pk_value    varchar2(100);
    v_action_type varchar2(10);
begin
    if inserting then
        v_action_type := 'INSERT';
        v_pk_value := to_char(:new.id);
    elsif updating then
        v_action_type := 'UPDATE';
        v_pk_value := to_char(:new.id);
    elsif deleting then
        v_action_type := 'DELETE';
        v_pk_value := to_char(:old.id);
    end if;

    v_audit_id := audit_pkg.start_audit(
        p_table_name => 'SGT_INTERFACES',
        p_action     => v_action_type
    );
    if inserting then
        if :new.equipo_id is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_INTERFACES',
                                  'ID',
                                  v_pk_value,
                                  'EQUIPO_ID',
                                  null,
                                  to_char(:new.equipo_id));
        end if;

        if :new.nombre is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_INTERFACES',
                                  'ID',
                                  v_pk_value,
                                  'NOMBRE',
                                  null,
                                  :new.nombre);

        end if;

        if :new.etiqueta is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_INTERFACES',
                                  'ID',
                                  v_pk_value,
                                  'ETIQUETA',
                                  null,
                                  :new.etiqueta);
        end if;

        if :new.estado is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_INTERFACES',
                                  'ID',
                                  v_pk_value,
                                  'ESTADO',
                                  null,
                                  :new.estado);
        end if;

        if :new.tipo_interface_id is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_INTERFACES',
                                  'ID',
                                  v_pk_value,
                                  'TIPO_INTERFACE_ID',
                                  null,
                                  to_char(:new.tipo_interface_id));
        end if;

        if :new.tx_en_dbm is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_INTERFACES',
                                  'ID',
                                  v_pk_value,
                                  'TX_EN_DBM',
                                  null,
                                  :new.tx_en_dbm);
        end if;

        if :new.rx_en_dbm is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_INTERFACES',
                                  'ID',
                                  v_pk_value,
                                  'RX_EN_DBM',
                                  null,
                                  :new.rx_en_dbm);
        end if;

        if :new.mac_address is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_INTERFACES',
                                  'ID',
                                  v_pk_value,
                                  'MAC_ADDRESS',
                                  null,
                                  :new.mac_address);
        end if;

    elsif updating then
        if nvl(:old.equipo_id,
               -1) != nvl(:new.equipo_id,
                          -1) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_INTERFACES',
                                  'ID',
                                  v_pk_value,
                                  'EQUIPO_ID',
                                  to_char(:old.equipo_id),
                                  to_char(:new.equipo_id));
        end if;

        if nvl(:old.nombre,
               'NULL') != nvl(:new.nombre,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_INTERFACES',
                                  'ID',
                                  v_pk_value,
                                  'NOMBRE',
                                  :old.nombre,
                                  :new.nombre);

        end if;

        if nvl(:old.etiqueta,
               'NULL') != nvl(:new.etiqueta,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_INTERFACES',
                                  'ID',
                                  v_pk_value,
                                  'ETIQUETA',
                                  :old.etiqueta,
                                  :new.etiqueta);
        end if;

        if nvl(:old.estado,
               'NULL') != nvl(:new.estado,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_INTERFACES',
                                  'ID',
                                  v_pk_value,
                                  'ESTADO',
                                  :old.estado,
                                  :new.estado);
        end if;

        if nvl(:old.tipo_interface_id,
               -1) != nvl(:new.tipo_interface_id,
                          -1) then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_INTERFACES',
                                  'ID',
                                  v_pk_value,
                                  'TIPO_INTERFACE_ID',
                                  to_char(:old.tipo_interface_id),
                                  to_char(:new.tipo_interface_id));
        end if;

        if nvl(:old.tx_en_dbm,
               'NULL') != nvl(:new.tx_en_dbm,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_INTERFACES',
                                  'ID',
                                  v_pk_value,
                                  'TX_EN_DBM',
                                  :old.tx_en_dbm,
                                  :new.tx_en_dbm);
        end if;

        if nvl(:old.rx_en_dbm,
               'NULL') != nvl(:new.rx_en_dbm,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_INTERFACES',
                                  'ID',
                                  v_pk_value,
                                  'RX_EN_DBM',
                                  :old.rx_en_dbm,
                                  :new.rx_en_dbm);
        end if;

        if nvl(:old.mac_address,
               'NULL') != nvl(:new.mac_address,
                              'NULL') then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_INTERFACES',
                                  'ID',
                                  v_pk_value,
                                  'MAC_ADDRESS',
                                  :old.mac_address,
                                  :new.mac_address);
        end if;

    elsif deleting then
        if :old.equipo_id is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_INTERFACES',
                                  'ID',
                                  v_pk_value,
                                  'EQUIPO_ID',
                                  to_char(:old.equipo_id),
                                  null);
        end if;

        if :old.nombre is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_INTERFACES',
                                  'ID',
                                  v_pk_value,
                                  'NOMBRE',
                                  :old.nombre,
                                  null);

        end if;

        if :old.etiqueta is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_INTERFACES',
                                  'ID',
                                  v_pk_value,
                                  'ETIQUETA',
                                  :old.etiqueta,
                                  null);
        end if;

        if :old.estado is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_INTERFACES',
                                  'ID',
                                  v_pk_value,
                                  'ESTADO',
                                  :old.estado,
                                  null);
        end if;

        if :old.tipo_interface_id is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_INTERFACES',
                                  'ID',
                                  v_pk_value,
                                  'TIPO_INTERFACE_ID',
                                  to_char(:old.tipo_interface_id),
                                  null);
        end if;

        if :old.tx_en_dbm is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_INTERFACES',
                                  'ID',
                                  v_pk_value,
                                  'TX_EN_DBM',
                                  :old.tx_en_dbm,
                                  null);
        end if;

        if :old.rx_en_dbm is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_INTERFACES',
                                  'ID',
                                  v_pk_value,
                                  'RX_EN_DBM',
                                  :old.rx_en_dbm,
                                  null);
        end if;

        if :old.mac_address is not null then
            audit_pkg.log_changes(v_audit_id,
                                  'SGT_INTERFACES',
                                  'ID',
                                  v_pk_value,
                                  'MAC_ADDRESS',
                                  :old.mac_address,
                                  null);
        end if;

    end if;

exception
    when others then
        null;
end trg_audit_sgt_interfaces;
/

alter trigger wksp_dtesc.trg_audit_sgt_interfaces enable;


-- sqlcl_snapshot {"hash":"377f54e0ed4798275a41b746e12a2b0ecae8949a","type":"TRIGGER","name":"TRG_AUDIT_SGT_INTERFACES","schemaName":"WKSP_DTESC","sxml":""}