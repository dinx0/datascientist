USE IQVIA_IC

--5.	Monte um script SQL que retorne qual grade de produtos mais vendeu (por valor) em cada ano que existirem vendas.
--a.	O resultado deve conter as colunas:
--i.	Ano da venda;
--ii.	Código da grade;
--iii.	Valor Vendido;


SELECT 
TOP 2
ANO, 
SUM(VALOR_VENDA) VALOR_VENDA,
GRAD.CODIGO_GRADE
FROM
(
SELECT 
CONVERT(VARCHAR(4), VEN.PERIODO,112) ANO, 
PREC.ID_PRODUTO,
VEN.QUANTIDADE*PREC.PRECO AS VALOR_VENDA
FROM [IQVIA_IC].[dbo].[VENDA] VEN 
JOIN [IQVIA_IC].[dbo].[PRODUTO_PRECO] PREC ON PREC.ID_PRODUTO = VEN.ID_PRODUTO
) VENDA
JOIN [IQVIA_IC].[dbo].[PRODUTO_GRADE] GRAD ON GRAD.ID_PRODUTO = VENDA.ID_PRODUTO
GROUP BY ANO, GRAD.CODIGO_GRADE
ORDER BY SUM(VALOR_VENDA) DESC