drop trigger zapato_modelo_trigger;
drop trigger zapato_descrip_trigger;
drop trigger zapato_fk_trigger;
drop trigger color_trigger;
drop trigger color_disp_trigger;
drop trigger color_disp2_trigger;
drop trigger linea_genero_trigger;
drop trigger tallas_trigger;
drop trigger tallas_disp_trigger;
drop trigger tallas_disp2_trigger;
drop trigger estilos_trigger;
drop trigger estilos_disp_trigger;
drop trigger estilos_disp2_trigger;


--Verificación para los insert
--Triggers tabla Zapatos
--Trigger para validar modelo
CREATE OR REPLACE TRIGGER zapato_modelo_trigger
   BEFORE 
   INSERT 
   ON Zapatos
   FOR EACH ROW    
DECLARE
   MODELO_ERROR EXCEPTION;
BEGIN   --upper(:NEW.modelo)
    IF :NEW.modelo != varchar2 then  
        raise MODELO_ERROR;
    END IF;
    EXCEPTION
        when MODELO_ERROR THEN
        raise_application_error(-20111,'ERROR AL INSERTAR DATOS EN TIPO DE MODELO DE ZAPATO');
        --  -20999 to -20000.
END;
/


--Trigger para validar descripcion del zapato
CREATE OR REPLACE TRIGGER zapato_descrip_trigger
   BEFORE 
   INSERT 
   ON Zapatos
   FOR EACH ROW    
DECLARE
   DESCRIP_ERROR EXCEPTION;
BEGIN   
    IF :NEW.descripcion != varchar2 then  
        raise DESCRIP_ERROR;
    END IF;
    EXCEPTION
        when DESCRIP_ERROR THEN
        raise_application_error(-20111,'ERROR AL INSERTAR DATOS EN DESCRIPCION DE ZAPATO');
END;
/


--Trigger para validar las llaves foraneas de la tabla zapato
CREATE OR REPLACE TRIGGER zapato_fk_trigger
   BEFORE 
   INSERT 
   ON Zapatos
   FOR EACH ROW    
DECLARE
   ZAPATO_FK_ERROR EXCEPTION;
BEGIN   
    IF :NEW.fk_color <= 0 then  
        raise ZAPATO_FK_ERROR;
    ELSIF :NEW.fk_talla <= 0 then  
        raise ZAPATO_FK_ERROR;
    ELSIF :NEW.fk_estilo <= 0 then  
        raise ZAPATO_FK_ERROR;
    ELSIF :NEW.fk_linea <= 0 then  
        raise ZAPATO_FK_ERROR;
    END IF;
    EXCEPTION
        when ZAPATO_FK_ERROR THEN
        raise_application_error(-20111,'ERROR DE LLAVES FORANEAS EN ZAPATO, INGRESE OTRO VALOR');
END;
/

--##################################################################################################################################################
--Triggers tabla Colores
--Trigger para validar el color
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
    END IF;
    EXCEPTION
        when COLOR_ERROR THEN
        raise_application_error(-20111,'ERROR AL INSERTAR DATOS EN COLORES');
        --  -20999 to -20000.
END;
/


--Trigger para validar la disponibilidad del color
CREATE OR REPLACE TRIGGER color_disp_trigger
   BEFORE 
   INSERT 
   ON Colores
   FOR EACH ROW    
DECLARE
   COLOR_DISP_ERROR EXCEPTION;
BEGIN   
    IF :NEW.disponible > 1 then  
        raise COLOR_DISP_ERROR;
    END IF;
    EXCEPTION
        when COLOR_DISP_ERROR THEN
        raise_application_error(-20111,'ERROR AL INSERTAR DISPONIBILIDAD EN COLORES');
END;
/


--Trigger para validar la disponibilidad del color (Adicional)
CREATE OR REPLACE TRIGGER color_disp2_trigger
   BEFORE 
   INSERT 
   ON Colores
   FOR EACH ROW    
DECLARE
   COLOR_DISP2_ERROR EXCEPTION;
BEGIN   
    IF :NEW.disponible < 0 then  
        raise COLOR_DISP2_ERROR;
    END IF;
    EXCEPTION
        when COLOR_DISP2_ERROR THEN
        raise_application_error(-20111,'ERROR AL INSERTAR DISPONIBILIDAD EN COLORES');
END;
/


--####################################################################################################################################################
--Triggers tabla Lineas
--Trigger para atributo genero
CREATE OR REPLACE TRIGGER linea_genero_trigger
   BEFORE 
   INSERT 
   ON Lineas
   FOR EACH ROW    
DECLARE
   GENERO_ERROR EXCEPTION;
BEGIN   
    IF :NEW.genero != varchar2 then  
        raise GENERO_ERROR;
    END IF;
    EXCEPTION
        when GENERO_ERROR THEN
        raise_application_error(-20111,'ERROR AL INSERTAR DATOS EN TIPO DE LINEA');
END;
/

--Trigger para disponibilidad en linea
CREATE OR REPLACE TRIGGER linea_disponibilidad_trigger
   BEFORE 
   INSERT 
   ON Lineas
   FOR EACH ROW    
DECLARE
   LINEA_ERROR EXCEPTION;
BEGIN   
    IF :NEW.disponible > 1 then  
        raise LINEA_ERROR;
    END IF;
    EXCEPTION
        when LINEA_ERROR THEN
        raise_application_error(-20111,'ERROR AL INSERTAR DATOS EN DISPONIBILIDAD EN TIPO DE LINEA');
END;
/

--Trigger para disponibilidad en linea
CREATE OR REPLACE TRIGGER linea_disponibilidad2_trigger
   BEFORE 
   INSERT 
   ON Lineas
   FOR EACH ROW    
DECLARE
   LINEA_ERROR2 EXCEPTION;
BEGIN   
    IF :NEW.disponible < 0 then  
        raise LINEA_ERROR2;
    END IF;
    EXCEPTION
        when LINEA_ERROR2 THEN
        raise_application_error(-20111,'ERROR AL INSERTAR DATOS EN DISPONIBILIDAD EN TIPO DE LINEA');
END;
/

--#####################################################################################################################################################
--Triggers tabla Tallas
--Trigger para verificar la entrada en el atributo talla 
CREATE OR REPLACE TRIGGER talla_trigger
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
        when TALLA_ERROR THEN
        raise_application_error(-20111,'ERROR AL INSERTAR DATOS EN TALLAS');
END;
/

--Trigger para validar la entrada del atributo disponibilidad en talla 
CREATE OR REPLACE TRIGGER tallas_disp_trigger
   BEFORE 
   INSERT 
   ON Tallas
   FOR EACH ROW    
DECLARE
   DISP_ERROR EXCEPTION;
BEGIN   
    IF :NEW.disponible > 1 then  
        raise DISP_ERROR;
    END IF;
    EXCEPTION
        when DISP_ERROR THEN
        raise_application_error(-20111,'ERROR AL INSERTAR DATOS EN DISPONIBILIDAD DE TALLAS');
END;
/

CREATE OR REPLACE TRIGGER tallas_disp2_trigger
   BEFORE 
   INSERT 
   ON Tallas
   FOR EACH ROW    
DECLARE
   DISP_ERROR2 EXCEPTION;
BEGIN   
    IF :NEW.disponible > 1 then  
        raise DISP_ERROR2;
    END IF;
    EXCEPTION
        when DISP_ERROR2 THEN
        raise_application_error(-20111,'ERROR AL INSERTAR DATOS EN DISPONIBILIDAD DE TALLAS');
END;
/

--###################################################################################################################################################
--Triggers tabla Estilos
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
    END IF;
    EXCEPTION
        when ESTILOS_ERROR THEN
        raise_application_error(-20111,'ERROR AL INSERTAR DATOS EN ESTILOS');
END;
/

--Trigger para verificar el atributo disponibilidad
CREATE OR REPLACE TRIGGER estilos_disp_trigger
   BEFORE 
   INSERT 
   ON Estilos
   FOR EACH ROW    
DECLARE
   ESTILOS_DISP_ERROR EXCEPTION;
BEGIN   
    IF :NEW.disponible > 1 then  
        raise ESTILOS_DISP_ERROR;
    END IF;
    EXCEPTION
        when ESTILOS_DISP_ERROR THEN
        raise_application_error(-20111,'ERROR AL INSERTAR DATOS EN DISPONIBILIDAD DE ESTILOS');
END;
/


CREATE OR REPLACE TRIGGER estilos_disp2_trigger
   BEFORE 
   INSERT 
   ON Estilos
   FOR EACH ROW    
DECLARE
   ESTILOS_DISP_ERROR2 EXCEPTION;
BEGIN   
    IF :NEW.disponible < 0 then  
        raise ESTILOS_DISP_ERROR2;
    END IF;
    EXCEPTION
        when ESTILOS_DISP_ERROR2 THEN
        raise_application_error(-20111,'ERROR AL INSERTAR DATOS EN DISPONIBILIDAD ESTILOS');
END;
/
