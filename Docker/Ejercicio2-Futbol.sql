CREATE TABLE EQUIPOS
(
	CodEquipo VARCHAR2(4),
	Nombre VARCHAR2(30) NOT NULL,
	Localidad VARCHAR2(15),
	CONSTRAINT PK_EQUIPOS PRIMARY KEY (CodEquipo)
);

CREATE TABLE JUGADORES
(
	CodJugador VARCHAR2(4),
	Nombre VARCHAR2(30) NOT NULL,
	FechaNacimiento DATE,
	Demarcacion VARCHAR2(10),
	CodEquipo VARCHAR2(4),
	CONSTRAINT PK_JUGADORES PRIMARY KEY (CodJugador),
	CONSTRAINT FK_EQUIPOS FOREIGN KEY (CodEquipo) REFERENCES EQUIPOS (CodEquipo)
);

CREATE TABLE PARTIDOS
(
	CodPartido VARCHAR2(4),
	CodEquipoLocal VARCHAR(4),
	CodEquipoVisitante VARCHAR(4),
	Fecha DATE,
	Competicion VARCHAR(4),
	Jornada VARCHAR(20),
	CONSTRAINT PK_PARTIDOS PRIMARY KEY (CodPartido),
	CONSTRAINT FK_EQUIPOLOCAL FOREIGN KEY (CodEquipoLocal) REFERENCES EQUIPOS (CodEquipo),
	CONSTRAINT FK_EQUIPOVISITANTE FOREIGN KEY (CodEquipoVisitante) REFERENCES EQUIPOS (CodEquipo),
	CONSTRAINT CK_Fecha CHECK (EXTRACT(MONTH FROM Fecha) NOT IN (7,8)),
	CONSTRAINT CK_Competicion CHECK (Competicion IN ('Copa', 'Liga'))
);

CREATE TABLE INCIDENCIAS
(
	NumIncidencia VARCHAR2(6),
	CodPartido VARCHAR2(4),
	CodJugador VARCHAR2(4),
	Minuto NUMBER(2),
	Tipo VARCHAR2(20),
	CONSTRAINT PK_INCIDENCIAS PRIMARY KEY (NumIncidencia),
	CONSTRAINT FK_PARTIDO FOREIGN KEY (CodPartido) REFERENCES PARTIDOS (CodPartido),
	CONSTRAINT FK_JUGADOR FOREIGN KEY (CodJugador) REFERENCES JUGADORES (CodJugador)
);

ALTER TABLE EQUIPOS ADD GolesMarcados NUMBER(3);
ALTER TABLE JUGADORES ADD CONSTRAINT CK_Demarcacion_Jug CHECK (Demarcacion IN ('Portero', 'Defensa', 'Medio', 'Delantero'))
ALTER TABLE JUGADORES ADD CONSTRAINT CK_InicialMayus CHECK (INITCAP(Nombre) = Nombre);
ALTER TABLE EQUIPOS ADD CONSTRAINT CK_CodEquipoNum CHECK (regexp_like(CodEquipo, '^[0-9]{1}'));
ALTER TABLE INCIDENCIAS MODIFY Tipo NOT NULL;

SELECT * FROM USER_TAB_
