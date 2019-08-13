-- Generado por Oracle SQL Developer Data Modeler 18.4.0.339.1532
--   en:        2019-03-28 23:51:32 CST
--   sitio:      SQL Server 2012
--   tipo:      SQL Server 2012



CREATE TABLE actividad (
    id_actividad                    INTEGER NOT NULL,
    titulo                          VARCHAR(70) NOT NULL,
    descripcion                     VARCHAR(150),
    fh_publicacion                  datetime NOT NULL,
    valor                           bigint NOT NULL,
    fh_entrega                      datetime NOT NULL,
    tipoactividad_id_tipo           INTEGER NOT NULL,
    grado_materia_id_gradomateria   INTEGER NOT NULL
)

go

ALTER TABLE Actividad ADD constraint actividad_pk PRIMARY KEY CLUSTERED (ID_Actividad)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) go

CREATE TABLE admin (
    nombre     VARCHAR(70) NOT NULL,
    pass       VARCHAR(30) NOT NULL,
    id_admin   INTEGER NOT NULL
)

go

ALTER TABLE Admin ADD constraint admin_pk PRIMARY KEY CLUSTERED (id_admin)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) go

CREATE TABLE alumno (
    carnet            INTEGER NOT NULL,
    nombre            VARCHAR(150) NOT NULL,
    telefono          INTEGER,
    telefonotutor     INTEGER,
    direccion         VARCHAR(150) NOT NULL,
    email             VARCHAR(45),
    fecha_nac         DATE NOT NULL,
    part_nacimiento   VARCHAR(45),
    pass              VARCHAR(20) NOT NULL,
    grado_id_grado    INTEGER NOT NULL
)

go

ALTER TABLE Alumno ADD constraint alumno_pk PRIMARY KEY CLUSTERED (Carnet)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) go

CREATE TABLE carrera (
    id_carrera   INTEGER NOT NULL,
    nombre       VARCHAR(70) NOT NULL
)

go

ALTER TABLE Carrera ADD constraint carrera_pk PRIMARY KEY CLUSTERED (ID_Carrera)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) go

CREATE TABLE documento (
    documento            varbinary NOT NULL,
    entrega_id_entrega   INTEGER NOT NULL
)

go

CREATE TABLE entrega (
    id_entrega               INTEGER NOT NULL,
    nota                     bigint,
    fecha_entrega            datetime NOT NULL,
    alumno_carnet            INTEGER NOT NULL,
    actividad_id_actividad   INTEGER NOT NULL
)

go

ALTER TABLE Entrega ADD constraint entrega_pk PRIMARY KEY CLUSTERED (ID_Entrega)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) go

CREATE TABLE entrega_respuesta (
    entrega_id_entrega      INTEGER NOT NULL,
    respuesta_id_pregunta   INTEGER NOT NULL,
    seleccionada            bit
)

go

ALTER TABLE Entrega_Respuesta ADD constraint entrega_respuesta_pk PRIMARY KEY CLUSTERED (Entrega_ID_Entrega, Respuesta_ID_Pregunta)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) go

CREATE TABLE fotoalumno (
    foto            varbinary,
    alumno_carnet   INTEGER NOT NULL
)

go 

    


CREATE unique nonclustered index fotoalumno__idx ON fotoalumno ( alumno_carnet ) go

CREATE TABLE fotomaestro (
    foto               varbinary,
    maestro_registro   INTEGER NOT NULL
)

go 

    


CREATE unique nonclustered index fotomaestro__idx ON fotomaestro ( maestro_registro ) go

CREATE TABLE grado (
    id_grado                     INTEGER NOT NULL,
    carrera_id_carrera           INTEGER NOT NULL,
    numerogrado_id_numerogrado   INTEGER NOT NULL
)

go

ALTER TABLE Grado ADD constraint grado_pk PRIMARY KEY CLUSTERED (ID_Grado)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) go

CREATE TABLE grado_materia (
    id_gradomateria      INTEGER NOT NULL,
    grado_id_grado       INTEGER NOT NULL,
    materia_id_materia   INTEGER NOT NULL,
    maestro_registro     INTEGER NOT NULL
)

go

ALTER TABLE Grado_Materia ADD constraint grado_materia_pk PRIMARY KEY CLUSTERED (ID_GradoMateria)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) go

CREATE TABLE maestro (
    registro          INTEGER NOT NULL,
    nombre            VARCHAR(150) NOT NULL,
    telefono          INTEGER,
    direccion         VARCHAR(150) NOT NULL,
    email             VARCHAR(45),
    fecha_nac         DATE NOT NULL,
    part_nacimiento   VARCHAR(45),
    pass              VARCHAR(20) NOT NULL,
    dpi               bigint NOT NULL
)

go

ALTER TABLE Maestro ADD constraint maestro_pk PRIMARY KEY CLUSTERED (Registro)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) go

CREATE TABLE materia (
    id_materia   INTEGER NOT NULL,
    nombre       VARCHAR(75) NOT NULL
)

go

ALTER TABLE Materia ADD constraint materia_pk PRIMARY KEY CLUSTERED (ID_Materia)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) go

CREATE TABLE material (
    id_material                     INTEGER NOT NULL,
    titulo                          VARCHAR(75) NOT NULL,
    descripcion                     VARCHAR(150),
    fh_publicacion                  datetime NOT NULL,
    grado_materia_id_gradomateria   INTEGER NOT NULL
)

go

ALTER TABLE Material ADD constraint material_pk PRIMARY KEY CLUSTERED (ID_Material)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) go

CREATE TABLE notificacion (
    id_notificacion   INTEGER NOT NULL,
    titulo            VARCHAR(75) NOT NULL,
    contenido         VARCHAR(150),
    fh_publicacion    datetime NOT NULL,
    alumno_carnet     INTEGER NOT NULL
)

go

ALTER TABLE Notificacion ADD constraint notificacion_pk PRIMARY KEY CLUSTERED (ID_Notificacion)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) go

CREATE TABLE numerogrado (
    id_numerogrado   INTEGER NOT NULL,
    nombre           VARCHAR(15) NOT NULL
)

go

ALTER TABLE NumeroGrado ADD constraint numerogrado_pk PRIMARY KEY CLUSTERED (ID_NumeroGrado)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) go

CREATE TABLE pregunta (
    id_pregunta              INTEGER NOT NULL,
    descripcion              VARCHAR(150) NOT NULL,
    actividad_id_actividad   INTEGER NOT NULL
)

go

ALTER TABLE Pregunta ADD constraint pregunta_pk PRIMARY KEY CLUSTERED (ID_Pregunta)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) go

CREATE TABLE publicacion (
    id_publicacion                  INTEGER NOT NULL,
    titulo                          VARCHAR(150) NOT NULL,
    fh_publicacion                  datetime NOT NULL,
    maestro_registro                INTEGER NOT NULL,
    grado_materia_id_gradomateria   INTEGER NOT NULL
)

go

ALTER TABLE Publicacion ADD constraint publicacion_pk PRIMARY KEY CLUSTERED (ID_Publicacion)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) go

CREATE TABLE respuesta (
    id_pregunta            INTEGER NOT NULL,
    descripcion            VARCHAR(70) NOT NULL,
    correcta               bit NOT NULL,
    pregunta_id_pregunta   INTEGER NOT NULL
)

go

ALTER TABLE Respuesta ADD constraint respuesta_pk PRIMARY KEY CLUSTERED (ID_Pregunta)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) go

CREATE TABLE tipoactividad (
    id_tipo   INTEGER NOT NULL,
    nombre    VARCHAR(70) NOT NULL
)

go

ALTER TABLE TipoActividad ADD constraint tipoactividad_pk PRIMARY KEY CLUSTERED (ID_Tipo)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) go

ALTER TABLE Actividad
    ADD CONSTRAINT actividad_grado_materia_fk FOREIGN KEY ( grado_materia_id_gradomateria )
        REFERENCES grado_materia ( id_gradomateria )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Actividad
    ADD CONSTRAINT actividad_tipoactividad_fk FOREIGN KEY ( tipoactividad_id_tipo )
        REFERENCES tipoactividad ( id_tipo )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Alumno
    ADD CONSTRAINT alumno_grado_fk FOREIGN KEY ( grado_id_grado )
        REFERENCES grado ( id_grado )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Documento
    ADD CONSTRAINT documento_entrega_fk FOREIGN KEY ( entrega_id_entrega )
        REFERENCES entrega ( id_entrega )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Entrega
    ADD CONSTRAINT entrega_actividad_fk FOREIGN KEY ( actividad_id_actividad )
        REFERENCES actividad ( id_actividad )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Entrega
    ADD CONSTRAINT entrega_alumno_fk FOREIGN KEY ( alumno_carnet )
        REFERENCES alumno ( carnet )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Entrega_Respuesta
    ADD CONSTRAINT entrega_respuesta_entrega_fk FOREIGN KEY ( entrega_id_entrega )
        REFERENCES entrega ( id_entrega )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Entrega_Respuesta
    ADD CONSTRAINT entrega_respuesta_respuesta_fk FOREIGN KEY ( respuesta_id_pregunta )
        REFERENCES respuesta ( id_pregunta )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE FotoAlumno
    ADD CONSTRAINT fotoalumno_alumno_fk FOREIGN KEY ( alumno_carnet )
        REFERENCES alumno ( carnet )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE FotoMaestro
    ADD CONSTRAINT fotomaestro_maestro_fk FOREIGN KEY ( maestro_registro )
        REFERENCES maestro ( registro )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Grado
    ADD CONSTRAINT grado_carrera_fk FOREIGN KEY ( carrera_id_carrera )
        REFERENCES carrera ( id_carrera )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Grado_Materia
    ADD CONSTRAINT grado_materia_grado_fk FOREIGN KEY ( grado_id_grado )
        REFERENCES grado ( id_grado )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Grado_Materia
    ADD CONSTRAINT grado_materia_maestro_fk FOREIGN KEY ( maestro_registro )
        REFERENCES maestro ( registro )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Grado_Materia
    ADD CONSTRAINT grado_materia_materia_fk FOREIGN KEY ( materia_id_materia )
        REFERENCES materia ( id_materia )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Grado
    ADD CONSTRAINT grado_numerogrado_fk FOREIGN KEY ( numerogrado_id_numerogrado )
        REFERENCES numerogrado ( id_numerogrado )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Material
    ADD CONSTRAINT material_grado_materia_fk FOREIGN KEY ( grado_materia_id_gradomateria )
        REFERENCES grado_materia ( id_gradomateria )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Notificacion
    ADD CONSTRAINT notificacion_alumno_fk FOREIGN KEY ( alumno_carnet )
        REFERENCES alumno ( carnet )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Pregunta
    ADD CONSTRAINT pregunta_actividad_fk FOREIGN KEY ( actividad_id_actividad )
        REFERENCES actividad ( id_actividad )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Publicacion
    ADD CONSTRAINT publicacion_grado_materia_fk FOREIGN KEY ( grado_materia_id_gradomateria )
        REFERENCES grado_materia ( id_gradomateria )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Publicacion
    ADD CONSTRAINT publicacion_maestro_fk FOREIGN KEY ( maestro_registro )
        REFERENCES maestro ( registro )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Respuesta
    ADD CONSTRAINT respuesta_pregunta_fk FOREIGN KEY ( pregunta_id_pregunta )
        REFERENCES pregunta ( id_pregunta )
ON DELETE NO ACTION 
    ON UPDATE no action go



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            20
-- CREATE INDEX                             2
-- ALTER TABLE                             38
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
