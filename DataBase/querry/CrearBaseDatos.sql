
CREATE DATABASE db_proyecto2;

go 

use db_proyecto2;



CREATE TABLE Zapatos (
	id_Zapato              INT           NOT NULL    IDENTITY(100,1)    PRIMARY KEY,
	modelo           VARCHAR(100)  NOT NULL,
	descripcion  VARCHAR(100) NOT NULL,

	fk_color INT NOT NULL,
	fk_talla INT NOT NULL,
	fk_estilo INT NOT NULL,
	fk_linea INT NOT NULL,
);
 
CREATE TABLE Colores(
	id_Color	INT NOT NULL IDENTITY(100,1) PRIMARY KEY,
	color  VARCHAR(10),
	disponible BIT,
);

CREATE TABLE Lineas(
	id_Linea	INT NOT NULL IDENTITY(100,1) PRIMARY KEY,
	genero VARCHAR(20),
	disponible BIT, 
);

CREATE TABLE Tallas(
	id_Talla INT NOT NULL IDENTITY(100,1) PRIMARY KEY, 
	talla INT,
	disponible BIT, 
);

CREATE TABLE Estilos(
	id_Estilo INT NOT NULL IDENTITY(100,1) PRIMARY KEY,
	estilo VARCHAR(25),
	disponible BIT, 
);



ALTER TABLE dbo.Zapatos
   ADD CONSTRAINT CONST_FK_COLOR FOREIGN KEY (fk_color)
      REFERENCES dbo.Colores (id_Color)
      ON DELETE CASCADE
      ON UPDATE CASCADE
;

ALTER TABLE dbo.Zapatos
   ADD CONSTRAINT CONST_FK_TALLA FOREIGN KEY (fk_talla)
      REFERENCES dbo.Tallas (id_Talla)
      ON DELETE CASCADE
      ON UPDATE CASCADE
;

ALTER TABLE dbo.Zapatos
   ADD CONSTRAINT CONST_FK_ESTILO FOREIGN KEY (fk_estilo)
      REFERENCES dbo.Estilos (id_Estilo)
      ON DELETE CASCADE
      ON UPDATE CASCADE
;

ALTER TABLE dbo.Zapatos
   ADD CONSTRAINT CONST_FK_LINEA FOREIGN KEY (fk_linea)
      REFERENCES dbo.Lineas (id_Linea)
      ON DELETE CASCADE
      ON UPDATE CASCADE
;


INSERT INTO Colores (color, disponible) values ('ROJO',1); 
INSERT INTO Colores (color, disponible) values ('Azul',1); 
INSERT INTO Colores (color, disponible) values ('Morado',1);

INSERT INTO Estilos (estilo, disponible) values ('High-Top',1); 
INSERT INTO Estilos (estilo, disponible) values ('Low-Top',1);

INSERT INTO Lineas (genero, disponible) values ('Mujer',1);
INSERT INTO Lineas (genero, disponible) values ('Hombre',1);

INSERT INTO Tallas (talla, disponible) values (35,1);
INSERT INTO Tallas (talla, disponible) values (36,1);
INSERT INTO Tallas (talla, disponible) values (38,1);
INSERT INTO Tallas (talla, disponible) values (41,1);


INSERT INTO Zapatos ( modelo, descripcion, fk_linea, fk_estilo, fk_color, fk_talla) values (
	'C-LLK', 'CUERO-LOGO-LAKERS', 100, 100, 101, 100
);

INSERT INTO Zapatos ( modelo, descripcion, fk_linea, fk_estilo, fk_color, fk_talla) values (
	'C-LLK', 'CUERO-LOGO-LAKERS', 100, 100, 101, 102
);

INSERT INTO Zapatos ( modelo, descripcion, fk_linea, fk_estilo, fk_color, fk_talla) values (
	'C-LLK', 'CUERO-LOGO-LAKERS', 100, 100, 101, 101
);

INSERT INTO Zapatos ( modelo, descripcion, fk_linea, fk_estilo, fk_color, fk_talla) values (
	'C-LLK', 'CUERO-LOGO-LAKERS', 100, 100, 100, 100
);

INSERT INTO Zapatos ( modelo, descripcion, fk_linea, fk_estilo, fk_color, fk_talla) values (
	'C-LLK', 'CUERO-LOGO-LAKERS', 100, 101, 100, 100
);

INSERT INTO Zapatos ( modelo, descripcion, fk_linea, fk_estilo, fk_color, fk_talla) values (
	'C-LLK', 'CUERO-LOGO-LAKERS', 101, 100, 102, 103
);



SELECT A.id_Zapato, A.modelo, A.descripcion, 
       (select B.color  from Colores as B where B.id_Color = A.fk_color) as color,
	   (select C.talla from Tallas as C where C.id_Talla = A.fk_talla) as talla,
	   (select D.estilo from Estilos as D where D.id_Estilo = A.fk_estilo) as estilo,
	   (select E.genero from Lineas as E where E.id_Linea = A.fk_linea) as linea
FROM Zapatos as A


