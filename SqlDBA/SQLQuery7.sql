USE IQVIA_IC

--7.	Monte um script que retorne qual produto teve a menor quantidade de venda em cada grade de produtos durante o segundo semestre de 2018.
--a.	O resultado deve conter as colunas:
--i.	C�digo da grade de produtos;
--ii.	C�digo do produto;
--iii.	Nome do produto;
--iv.	Quantidade vendida;


SELECT 
DISTINCT 

GRAD.CODIGO_GRADE,
CODIGO,
NOME,
SUM(QUANTIDADE) [Quantidade vendida]

FROM
(
SELECT 
PREC.ID_PRODUTO,
PROD.CODIGO,
PROD.NOME,
MIN(VEN.QUANTIDADE) QUANTIDADE
FROM [IQVIA_IC].[dbo].[VENDA] VEN 
JOIN [IQVIA_IC].[dbo].[PRODUTO_PRECO] PREC ON PREC.ID_PRODUTO = VEN.ID_PRODUTO
JOIN [IQVIA_IC].[dbo].[PRODUTO] PROD ON PROD.ID_PRODUTO = PREC.ID_PRODUTO
WHERE CONVERT(VARCHAR(6),VEN.PERIODO,112) >= '201806'
AND CONVERT(VARCHAR(6),VEN.PERIODO,112) <= '201812'
GROUP BY PREC.ID_PRODUTO,
PROD.CODIGO,
PROD.NOME
) VENDA
JOIN (select DISTINCT CODIGO_GRADE, ID_PRODUTO from[IQVIA_IC].[dbo].[PRODUTO_GRADE]) GRAD ON GRAD.ID_PRODUTO = VENDA.ID_PRODUTO


GROUP BY 
GRAD.CODIGO_GRADE,
GRAD.CODIGO_GRADE,
CODIGO,
NOME
ORDER BY SUM(QUANTIDADE)  DESC

