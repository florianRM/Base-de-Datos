--1.
SELECT AVG(DTO) FROM FACTURAS

--2.
SELECT AVG(DTO) FROM FACTURAS
WHERE DTO IS NOT NULL

--3.
SELECT TRUNC(AVG(NVL(DTO,0))) FROM FACTURAS

--4.
SELECT COUNT(CODFAC) FROM FACTURAS

--5.
SELECT COUNT(CODPUE) FROM PUEBLOS
WHERE CODPRO IN (3, 12, 46)

--6.
SELECT SUM(STOCK * PRECIO) FROM ARTICULOS

--7.
SELECT COUNT(CODPUE) FROM CLIENTES
WHERE CODPOSTAL LIKE '12%'

--8.
SELECT MAX(STOCK), MIN(STOCK), MAX(STOCK)-MIN(STOCK) FROM ARTICULOS
WHERE PRECIO BETWEEN 9 AND 12

--9.
SELECT AVG(NVL(PRECIO,0)) FROM ARTICULOS
WHERE STOCK > 10

--10.
SELECT CODCLI FROM FACTURAS
WHERE CODCLI = 210

SELECT MAX(FECHA), MIN(FECHA) FROM FACTURAS
WHERE CODCLI = 210

--11.
SELECT COUNT(CODART) FROM ARTICULOS
WHERE STOCK IS NULL

--12.
SELECT COUNT(CODFAC) FROM LINEAS_FAC
WHERE DTO IS NULL

--13.
SELECT COUNT(CODFAC) FROM FACTURAS
GROUP BY CODCLI

--14.
SELECT COUNT(CODFAC) FROM FACTURAS
GROUP BY CODCLI
HAVING COUNT(CODFAC) >= 2

--15.
SELECT SUM(CANT * PRECIO) FROM LINEAS_FAC

--16.
SELECT SUM(CANT * PRECIO) FROM LINEAS_FAC
WHERE UPPER(CODART) LIKE '%A%'

--17.
SELECT COUNT(CODFAC), FECHA FROM FACTURAS
GROUP BY FECHA

--18.
SELECT COUNT(C.CODCLI) AS NUMCLIENTES, P.NOMBRE FROM CLIENTES C, PUEBLOS P
WHERE C.CODPUE = P.CODPUE
GROUP BY P.NOMBRE
ORDER BY NUMCLIENTES DESC

--19.
SELECT COUNT(C.CODCLI) AS NUMCLIENTES, P.NOMBRE FROM CLIENTES C, PUEBLOS P
WHERE C.CODPUE = P.CODPUE
GROUP BY P.NOMBRE
HAVING COUNT(C.CODCLI) > 2
ORDER BY NUMCLIENTES DESC

--20.
SELECT COUNT(L.CANT), A.DESCRIP, MAX(PRECIO), MIN(PRECIO) FROM LINEAS_FAC L, ARTICULOS A
WHERE L.CODART = A.CODART
AND UPPER(L.CODART) LIKE 'P%'
GROUP BY A.DESCRIP

--21. DUDA
SELECT MAX(NVL(PRECIO,0)), MIN(NVL(PRECIO,0)), MAX(NVL(PRECIO,0)) - MIN(NVL(PRECIO,0)) FROM LINEAS_FAC
WHERE LOWER(CODFAC) LIKE 'c%'

--22.
SELECT A.DESCRIP FROM ARTICULOS A, LINEAS_FAC L
WHERE A.CODART = L.CODART
AND (L.PRECIO * L.CANT) > 10000

--23.
SELECT COUNT(CODFAC), CODCLI, COUNT(DISTINCT(IVA)) FROM FACTURAS
WHERE CODCLI BETWEEN 150 AND 300
GROUP BY CODCLI

--24.
SELECT AVG(CANT * PRECIO) FROM LINEAS_FAC L, FACTURAS F
WHERE L.CODFAC = F.CODFAC
GROUP BY F.CODFAC
