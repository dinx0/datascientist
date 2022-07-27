USE IQVIA_IC


--9.	Monte um script que retorne qual o nome de cada gerente e quais seus vendedores.
--a.	O resultado deve conter as colunas:
--i.	Matrícula do gerente;
--ii.	Nome do gerente;
--iii.	Matrícula do vendedor;
--iv.	Nome do vendedor;



SELECT 
DISTINCT
B.NOME AS NOME_GERENTE,
B.MATRICULA AS MATRICULA_GERENTE,
C.MATRICULA AS MATRICULA_VENDEDOR,
C.NOME AS NOME_VENDEDOR
FROM ESTRUTURA A 
LEFT JOIN FUNCIONARIO B ON B.ID_FUNCIONARIO = A.ID_GERENTE
LEFT JOIN FUNCIONARIO C ON C.ID_FUNCIONARIO = A.ID_VENDEDOR