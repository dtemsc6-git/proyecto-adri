
  CREATE OR REPLACE EDITIONABLE TRIGGER "WKSP_DTESC"."TRG_ST_COMENTARIOS" 
BEFORE
insert or update on WKSP_DTESC."SGT_COMENTARIOS"
for each row
begin
--    --actualizar info de  
    IF INSERTING THEN 
        :NEW.creado_el := SYSDATE; 
        :NEW.creado_por := nvl(wwv_flow.g_user,user); 
        :NEW.ACTUALIZADO_el := SYSDATE; 
        :NEW.ACTUALIZADO_POR := nvl(wwv_flow.g_user,user); 
    ELSIF UPDATING THEN 
        :NEW.ACTUALIZADO_el := SYSDATE; 
        :NEW.ACTUALIZADO_POR := nvl(wwv_flow.g_user,user); 
    END IF; 
--
end;'||CHR(0)||';
/
ALTER TRIGGER "WKSP_DTESC"."TRG_ST_COMENTARIOS" ENABLE;


-- sqlcl_snapshot {"hash":"c5bdd4b1adbd91c172cac040dfbce9d5ff4b5aa4","type":"TRIGGER","name":"TRG_ST_COMENTARIOS","schemaName":"WKSP_DTESC","sxml":""}