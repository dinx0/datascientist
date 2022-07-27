CREATE TABLE FORNECEDOR (
id int,
NOME varchar(500),
ENDERECO varchar(1000)
)

insert into FORNECEDOR (id, NOME, ENDERECO) VALUES ('1', 'Empresa de Leite Parmaleite', 'Rua dos Leites, 23')

insert into FORNECEDOR (id, NOME, ENDERECO) VALUES ('2', 'Peixaria Abril', 'Rua dos Leites, 26')

SELECT * FROM FORNECEDOR


UPDATE FORNECEDOR 
SET ENDERECO = 'Rua dos Peixes, 26'
WHERE ID = '2'

SELECT * FROM FORNECEDOR

DELETE FROM FORNECEDOR WHERE ID = '1'

SELECT * FROM FORNECEDOR

