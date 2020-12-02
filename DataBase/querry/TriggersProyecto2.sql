drop trigger zapato_trigger;
drop trigger color_trigger;
drop trigger linea_trigger;
drop trigger tallas_trigger;
drop trigger estilos_trigger;


--Verificación para los insert
--Trigger tabla Zapatos
CREATE OR REPLACE TRIGGER zapato_trigger
   BEFORE 
   INSERT 
   ON Zapatos
   FOR EACH ROW    
DECLARE
   ZAPATO_ERROR EXCEPTION;
BEGIN   --upper(:NEW.modelo)
    IF :NEW.modelo != varchar2 then  
        raise ZAPATO_ERROR;
    ELSIF :NEW.descripcion != varchar2 then  
        raise ZAPATO_ERROR;
    END IF;
    EXCEPTION
        when ZAPATO_ERROR THEN
        raise_application_error(-20111,'ERROR AL INSERTAR DATOS EN ZAPATO');
        --  -20999 to -20000.
END;
/

--Trigger tabla Colores
CREATE OR REPLACE TRIGGER color_trigger
   BEFORE 
   INSERT 
   ON Colores
   FOR EACH ROW    
DECLARE
   COLOR_ERROR EXCEPTION;
BEGIN   
    IF :NEW.color != varchar2 then  
        raise COLOR_ERROR;
    ELSIF :NEW.disponible != 0 OR :NEW.disponible != 1 then  
        raise COLOR_ERROR;
    END IF;
    EXCEPTION
        when COLOR_ERROR THEN
        raise_application_error(-20111,'ERROR AL INSERTAR DATOS EN COLORES');
        --  -20999 to -20000.
END;
/

--Trigger tabla Lineas
CREATE OR REPLACE TRIGGER linea_trigger
   BEFORE 
   INSERT 
   ON Lineas
   FOR EACH ROW    
DECLARE
   LINEA_ERROR EXCEPTION;
BEGIN   
    IF :NEW.genero != varchar2 then  
        raise LINEA_ERROR;
    ELSIF :NEW.disponible != 0 OR :NEW.disponible != 1 then  
        raise LINEA_ERROR;
    END IF;
    EXCEPTION
        when LINEA_ERROR THEN
        raise_application_error(-20111,'ERROR AL INSERTAR DATOS EN TIPO DE LINEA');
        --  -20999 to -20000.
END;
/

--Trigger tabla Tallas
CREATE OR REPLACE TRIGGER tallas_trigger
   BEFORE 
   INSERT 
   ON Tallas
   FOR EACH ROW    
DECLARE
   TALLAS_ERROR EXCEPTION;
BEGIN   
    IF :NEW.talla != INT then  
        raise TALLAS_ERROR;
    ELSIF :NEW.disponible != 0 OR :NEW.disponible != 1 then  
        raise TALLAS_ERROR;
    END IF;
    EXCEPTION
        when LINEA_ERROR THEN
        raise_application_error(-20111,'ERROR AL INSERTAR DATOS EN TALLAS');
        --  -20999 to -20000.
END;
/


--Trigger tabla Estilos
CREATE OR REPLACE TRIGGER estilos_trigger
   BEFORE 
   INSERT 
   ON Estilos
   FOR EACH ROW    
DECLARE
   ESTILOS_ERROR EXCEPTION;
BEGIN   
    IF :NEW.estilo != varchar2 then  
        raise ESTILOS_ERROR;
    ELSIF :NEW.disponible != 0 OR :NEW.disponible != 1 then  
        raise ESTILOS_ERROR;
    END IF;
    EXCEPTION
        when ESTILOS_ERROR THEN
        raise_application_error(-20111,'ERROR AL INSERTAR DATOS EN ESTILOS');
        --  -20999 to -20000.
END;
/

