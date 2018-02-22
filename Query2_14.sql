SELECT ot.customerid, ot.first_name, min (ot.orders_totals) compra_minima
    FROM( SELECT ord.orderid,
            SUM (op.quantity*prod.list_price) order_totals,
            cus.customerid,
            cus.first_name
    FROM ARG.orders_test ord 
        inner join ARG.order_products op 
            ON ord.ORDERID = op.order_id
        inner join ARG.products_test prod 
            on op.product_id = prod.product_id
        inner join arg.customers_test cus 
                on ord.customer_id = cus.customerid
        GROUP BY ord.orderid, cus.customerid, cus.first_name) ot 
GROUP BY ot.customerid, ot.first_name
ORDER BY ot.customerid
    