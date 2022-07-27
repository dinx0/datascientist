USE IQVIA_IC


--3.	Monte um script SQL que retorne o pre�o m�dio de cada produto no ano de 2019.
--a.	O resultado deve conter as colunas:
--i.	C�digo do produto;
--ii.	Nome do produto;
--iii.	Pre�o m�dio;

SELECT 
PROD.CODIGO,
PROD.NOME,
AVG(ROUND(PRECO,2)) PRECO_MEDIO

FROM [IQVIA_IC].[dbo].[PRODUTO] PROD
JOIN [IQVIA_IC].[dbo].[PRODUTO_PRECO] PREC ON PREC.ID_PRODUTO = PROD.ID_PRODUTO
WHERE CONVERT(VARCHAR(4),PERIODO,112) = '2019'

GROUP BY PROD.CODIGO,
PROD.NOME
