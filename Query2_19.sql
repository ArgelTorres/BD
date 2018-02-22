--6 Obtener  los 10 productos menos vendidos y la cantidad de sus ventas en el año 2015
SELECT *
    FROM ARG.PRODUCTS_TEST prod
    orden < 11
    SELECT YEAR FROM (prod.order_date) odate
    IF (odate = 2015) THEN
         prod.quantity
    

--7 Obtener al cliente con mas compras en la historia
SELECT *
    MAX(FROM ARG.ORDERS_TEST orders)

  
--8 Calcular el envio de las ordenes tomando en cuenta el número de compras del año anterior:
-- Si tiene menos de 2 compras usar el 15%
-- Si tiene entre 2 y 4 compras usar el 10%
-- Si tiene mas de 5 compras usar el 5%
SELECT * 
    FROM ARG.SALES sale
    SELECT (YEAR FROM sale.orderdate) year1
    CASE(year1 = CURRENT_DATE -1)
    WHEN sale.quantity < 2 THEN subtotal*0.15
    WHEN 2 < sale.quantity < 4 THEN subtotal*0.10
    WHEN sale.quantity > 5 THEN subtotal*0.05