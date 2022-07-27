USE IQVIA_IC


--3.	Monte um script SQL que retorne o preço médio de cada produto no ano de 2019.
--a.	O resultado deve conter as colunas:
--i.	Código do produto;
--ii.	Nome do produto;
--iii.	Preço médio;

SELECT 
PROD.CODIGO,
PROD.NOME,
AVG(ROUND(PRECO,2)) PRECO_MEDIO

FROM [IQVIA_IC].[dbo].[PRODUTO] PROD
JOIN [IQVIA_IC].[dbo].[PRODUTO_PRECO] PREC ON PREC.ID_PRODUTO = PROD.ID_PRODUTO
WHERE CONVERT(VARCHAR(4),PERIODO,112) = '2019'

GROUP BY PROD.CODIGO,
PROD.NOME
