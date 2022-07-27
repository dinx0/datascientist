USE IQVIA_IC

--6.	Monte um script SQL que retorne qual foi o pre�o m�dio de cada produto da grade de produtos de c�digo �GRADE - TIPO 4� durante o 1� semestre de 2019.
--a.	O resultado deve conter as colunas:
--i.	C�digo do Produto;
--ii.	Nome do produto;
--iii.	Pre�o m�dio;


SELECT
PROD.CODIGO,
PROD.NOME, 
AVG(PREC.PRECO) PRECO_MEDIO
FROM [IQVIA_IC].[dbo].[PRODUTO] PROD
LEFT JOIN [IQVIA_IC].[dbo].[PRODUTO_PRECO] PREC ON PREC.ID_PRODUTO = PROD.ID_PRODUTO
LEFT JOIN [IQVIA_IC].[dbo].[PRODUTO_GRADE] GRAD ON PREC.ID_PRODUTO = GRAD.ID_PRODUTO
WHERE CONVERT(VARCHAR(6),PREC.PERIODO,112) >= '201901'
AND CONVERT(VARCHAR(6),PREC.PERIODO,112) <= '201906'
AND GRAD.CODIGO_GRADE = 'GRADE - TIPO 4'
GROUP BY 
PROD.CODIGO,
PROD.NOME