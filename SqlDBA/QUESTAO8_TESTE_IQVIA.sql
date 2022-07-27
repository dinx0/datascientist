USE IQVIA_IC


--8.	Monte um script que retorne quais produtos cada vendedor tem em sua grade de produtos.
--a.	O resultado deve conter as colunas:
--i.	Matrícula do funcionário;
--ii.	Nome do funcionário;
--iii.	Código do produto;
--iv.	Nome do produto;

SELECT DISTINCT ID_GERENTE FROM ESTRUTURA

select 
C.MATRICULA,
C.NOME,
D.CODIGO,
D.NOME
from ESTRUTURA A
JOIN PRODUTO_GRADE B ON A.CODIGO_GRADE_PRODUTO = B.CODIGO_GRADE
JOIN FUNCIONARIO C ON C.ID_FUNCIONARIO = A.ID_VENDEDOR
JOIN PRODUTO D ON D.ID_PRODUTO = B.ID_PRODUTO
