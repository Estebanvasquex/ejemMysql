-- Ejercicio 1

/*1. Crear una vista para poder organizar los envíos de las facturas. Indicar número
 de factura, fecha de la factura y fecha de envío, ambas en formato dd/mm/yyyy,
 valor del transporte formateado con dos decimales, y la información del
 domicilio del destino incluyendo dirección, ciudad, código postal y país, en una
columna llamada Destino.*/

SELECT 
FacturaID, DATE_FORMAT(FechaFactura, '%D/%M/%Y') FechaFactura,
DATE_FORMAT(FechaEnvio, '%D/%M/%Y' ) FechaEnvio,
round(Transporte, 2), CONCAT (Direccion, " ", Ciudad, " ", CodigoPostal, " ", Pais) Destino
FROM  facturas f
JOIN clientes c ON f.ClienteID = c.ClienteID









-- 2. Realizar una consulta con todos los correos y el detalle de las facturas que
-- usaron ese correo. Utilizar la vista creada.
-- 3. ¿Qué dificultad o problema encontrás en esta consigna? Proponer alguna
-- alternativa o solución.