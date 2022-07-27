USE IQVIA_IC

--2.	Monte um script SQL que retorne o TOP 10 dos produtos mais vendidos (por unidade) no ano de 2018.
--a.	O resultado deve conter as colunas:
--i.	Código do produto;
--ii.	Nome do produto;
--iii.	Quantidade vendida;

SELECT TOP 10
PROD.CODIGO,
PROD.NOME,
VEN.QUANTIDADE
FROM [IQVIA_IC].[dbo].[PRODUTO] PROD
LEFT JOIN [IQVIA_IC].[dbo].[VENDA] VEN ON VEN.ID_PRODUTO = PROD.ID_PRODUTO
WHERE CONVERT(VARCHAR(4),PERIODO,112) = '2018'
ORDER BY VEN.QUANTIDADE DESC

