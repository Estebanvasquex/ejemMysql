-- Mostrar los 10 primeros caracteres en mayuscula del nombre de la canciòn

-- SELECT LEFT(UPPER(nombre),10)  FROM canciones
-- Clientes

-- 1. Crear una vista con los siguientes datos de los clientes: ID, contacto, y el
-- Fax. En caso de que no tenga Fax, colocar el teléfono, pero aclarándolo. Por
-- ejemplo: “TEL: (01) 123-4567”.

CREATE view v_datosClientes as 
select ClienteID,
contacto,
case when Fax = '' then concat ("Tel:", Telefono) 
else Fax end as TELEFONO
from clientes;

-- 2. Se necesita listar los números de teléfono de los clientes que no tengan
-- fax. Hacerlo de dos formas distintas:
-- a. Consultando la tabla de clientes.
-- b. Consultando la vista de clientes.

select * from clientes where fax = '';

select * from v_datosClientes where substr(TELEFONO, 1,3) = "Tel"; 


-- Proveedores

-- 1. Crear una vista con los siguientes datos de los proveedores: ID,
-- contacto, compañía y dirección. Para la dirección tomar la dirección,
-- ciudad, código postal y país.

create view v_direccion_proveedores as 
select ProveedorID, Contacto, Compania, concat(Direccion,Ciudad,CodigoPostal,Pais) Direccion from proveedores; 


-- 2. Listar los proveedores que vivan en la calle Americanas en Brasil. Hacerlo
-- de dos formas distintas:
-- a. Consultando la tabla de proveedores.
-- b. Consultando la vista de proveedores.

select * from proveedores where Direccion like "%Americanas%";

select * from v_direccion_proveedores where Direccion like "%Americanas%";

-- Vistas - Parte II

-- 1. Crear una vista de productos que se usará para control de stock. Incluir el ID
-- y nombre del producto, el precio unitario redondeado sin decimales, las
-- unidades en stock y las unidades pedidas. Incluir además una nueva
-- columna PRIORIDAD con los siguientes valores:

create view v_pedidos as
select ProductoID, 
ProductoNombre, 
floor (PrecioUnitario) Precio, 
UnidadesStock, 
UnidadesPedidas,
case 
when UnidadesPedidas = 0 then "BAJA"
when UnidadesPedidas < UnidadesStock then "MEDIA"
when UnidadesPedidas*2 < UnidadesStock then "URGENTE"
when UnidadesPedidas > UnidadesStock*2 then "SUPER URGENTE" end as Prioridad
from productos;



-- ■ BAJA: si las unidades pedidas son cero.
-- ■ MEDIA: si las unidades pedidas son menores que las unidades
-- en stock.
-- ■ URGENTE: si las unidades pedidas no duplican el número de
-- unidades.
-- ■ SUPER URGENTE: si las unidades pedidas duplican el número
-- de unidades en caso contrario.

-- 2. Se necesita un reporte de productos para identificar problemas de stock.
-- Para cada prioridad indicar cuántos productos hay y su precio promedio.
-- No incluir las prioridades para las que haya menos de 5 productos.

select Prioridad, 
sum(UnidadesStock) SumatoriaStock,
avg(Precio) Promedio 
from v_pedidos group by Prioridad  











