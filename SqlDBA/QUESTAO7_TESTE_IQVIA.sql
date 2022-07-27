USE IQVIA_IC

--7.	Monte um script que retorne qual produto teve a menor quantidade de venda em cada grade de produtos durante o segundo semestre de 2018.
--a.	O resultado deve conter as colunas:
--i.	Código da grade de produtos;
--ii.	Código do produto;
--iii.	Nome do produto;
--iv.	Quantidade vendida;



SELECT 
DISTINCT
GRAD.CODIGO_GRADE,
PROD.CODIGO AS CODIGO_PRODUTO,
PROD.NOME AS NOME_PRODUTO
FROM  [IQVIA_IC].[DBO].[PRODUTO] PROD
JOIN  [IQVIA_IC].[DBO].[PRODUTO_GRADE] GRAD ON PROD.ID_PRODUTO = GRAD.ID_PRODUTO
JOIN (SELECT TOP 4 MIN(QUANTIDADE) MENOR_QUANTIDADE, CODIGO FROM [IQVIA_IC].[dbo].[VENDA] VEN
JOIN  [IQVIA_IC].[DBO].[PRODUTO] PROD ON VEN.ID_PRODUTO = PROD.ID_PRODUTO
WHERE CONVERT(VARCHAR(6),VEN.PERIODO,112) >= '201806'
AND CONVERT(VARCHAR(6),VEN.PERIODO,112) <= '201812'
GROUP BY PROD.CODIGO) QTD ON QTD.CODIGO = PROD.CODIGO