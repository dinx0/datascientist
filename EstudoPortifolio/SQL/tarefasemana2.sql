
Com o que foi aprendido nos capítulos anteriores, crie consultas para recuperar os seguintes dados:

As 10 cidades com mais pedidos
As 10 principais categorias de produtos com mais pedidos usando cartão de crédito
As 10 cidades com o maior valor de pagamento
Top 10 vendedores com os maiores valores brutos
As 10 principais categorias de produtos com a pior eficiência de frete.
Todas essas consultas conseguem ser realizadas com o uso de GROUP BY, ORDER BY, e funções de agregação. Use os JOINS apenas se os dados que precisar estiverem em tabelas diferentes.



SELECT * FROM [dbo].[olist_order_items_dataset]
SELECT * FROM [dbo].[olist_customers_dataset]
SELECT * FROM [dbo].[olist_order_payments_dataset]
SELECT * FROM [dbo].[olist_order_reviews_dataset]
SELECT * FROM [dbo].[olist_orders_dataset]
SELECT * FROM [dbo].[olist_products_dataset]
SELECT * FROM [DBO].[OLIST_CUSTOMERS_DATASET] 
SELECT * FROM [dbo].[olist_sellers_dataset]



1. SELECT TOP 10 COUNT(A.ORDER_ID) AS PEDIDOS, B.customer_city AS CIDADE FROM [DBO].[OLIST_ORDERS_DATASET] A
JOIN [DBO].[OLIST_CUSTOMERS_DATASET] B ON A.customer_id = B.customer_id
GROUP BY B.customer_city
ORDER BY COUNT(A.ORDER_ID) DESC
-------------------------------------------------------------------------------------------------------------------------------------------

2.
SELECT TOP 10 COUNT(B.ORDER_ID) AS PEDIDOS, product_category_name  FROM [dbo].[olist_products_dataset] A 
JOIN [dbo].[olist_order_items_dataset] B ON A.PRODUCT_ID = B.PRODUCT_ID
JOIN [dbo].[olist_order_payments_dataset] C ON C.ORDER_ID = B.ORDER_ID
WHERE C.payment_type = 'credit_card'
GROUP BY product_category_name
ORDER BY COUNT(B.ORDER_ID) DESC

--------------------------------------------------------------------------------------------------------------------------------------------
3.
SELECT TOP 10 MAX(PAYMENT_VALUE) AS PAGAMENTO, B.customer_city AS CIDADE FROM [DBO].[OLIST_ORDERS_DATASET] A
JOIN [DBO].[OLIST_CUSTOMERS_DATASET] B ON A.customer_id = B.customer_id
JOIN [dbo].[olist_order_payments_dataset] C ON C.ORDER_ID = A.ORDER_ID 
GROUP BY B.customer_city 
ORDER BY B.customer_city  DESC
--------------------------------------------------------------------------------------------------------------------------------------------

4.

SELECT TOP 10 C.SELLER_ID AS VENDEDOR_ID , MAX(B.PAYMENT_VALUE) AS PAGAMENTO FROM [DBO].[OLIST_ORDERS_DATASET] A
JOIN [dbo].[olist_order_payments_dataset] B ON B.ORDER_ID = A.ORDER_ID
JOIN [dbo].[olist_order_items_dataset] C ON A.ORDER_ID = C.ORDER_ID
JOIN [dbo].[olist_sellers_dataset] D ON C.SELLER_ID = D.SELLER_ID
GROUP BY C.SELLER_ID 
ORDER BY C.SELLER_ID   DESC
-----------------------------------------------------------------------------------------------------------------------------------------

5.
SELECT TOP 10 COUNT(B.ORDER_ID) AS PEDIDOS, product_category_name  FROM [dbo].[olist_products_dataset] A 
JOIN [dbo].[olist_order_items_dataset] B ON A.PRODUCT_ID = B.PRODUCT_ID
JOIN [dbo].[olist_order_reviews_dataset] C ON B.ORDER_ID = C.ORDER_ID
WHERE REVIEW_SCORE = '1'
GROUP BY product_category_name
ORDER BY product_category_name  DESC