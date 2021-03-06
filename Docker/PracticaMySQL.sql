CREATE TABLE DEPART
(
	dept_no VARCHAR(20),
	dnombre VARCHAR(20),
	loc VARCHAR(20),
	CONSTRAINT PK_DEPART PRIMARY KEY (dept_no)
);

CREATE TABLE EMPLE
(
	emp_no VARCHAR(20),
	apellido VARCHAR(20),
	oficio VARCHAR(20),
	dir VARCHAR(20),
	fecha_alt DATE,
	salario DECIMAL(10, 2),
	comision DECIMAL (10, 2),
	dept_no VARCHAR(20),
	CONSTRAINT PK_EMPLE PRIMARY KEY (emp_no),
	CONSTRAINT FK_Dept_No FOREIGN KEY (dept_no) REFERENCES DEPART (dept_no)
);

INSERT INTO DEPART
VALUES ('10', 'CONTABILIDAD', 'SEVILLA')

INSERT INTO DEPART
VALUES ('20', 'INVESTIGACION', 'MADRID')

INSERT INTO DEPART
VALUES ('30', 'VENTAS', 'BARCELONA')

INSERT INTO DEPART
VALUES ('40', 'PRODUCCION', 'BILBAO')

-- Datos tabla empleado
INSERT INTO EMPLE (emp_no, apellido, oficio, dir, fecha_alt, salario, dept_no)
VALUES ('7369', 'SÁNCHEZ', 'EMPLEADO', '7902', DATE('1980-12-17'), 104000, '20'); 

INSERT INTO EMPLE
VALUES ('7499', 'ARROYO', 'VENDEDOR', '7698', DATE('1980-2-20'), 208000, 39000, '30');   

INSERT INTO EMPLE
VALUES ('7521', 'SALA', 'VENDEDOR', '7698', DATE('1981-2-22'), 162500, 162500, '30'); 

INSERT INTO EMPLE (emp_no, apellido, oficio, dir, fecha_alt, salario, dept_no)
VALUES ('7566', 'JIMÉNEZ', 'DIRECTOR', '7839', DATE('1981-4-2'), 386750, '20'); 

INSERT INTO EMPLE
VALUES ('7654', 'MARTÍN', 'VENDEDOR', '7698', DATE('1981-9-29'), 162500, 182000 '30'); 





