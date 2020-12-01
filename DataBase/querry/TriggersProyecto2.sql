drop trigger zapato_trigger;


--Verificación para los insert
CREATE OR REPLACE TRIGGER zapato_trigger
   BEFORE 
   INSERT 
   ON Zapato
   FOR EACH ROW    
DECLARE
   ZAPATO_ERROR EXCEPTION;
BEGIN   
    IF :NEW.modelo != varchar2 then  --upper(:NEW.modelo)
        raise ZAPATO_ERROR;
    END IF;
    EXCEPTION
        when ZAPATO_ERROR THEN
        raise_application_error(-20111,'ERROR AL INSERTAR DATOS EN ZAPATO');
        --  -20999 to -20000.
END;
/