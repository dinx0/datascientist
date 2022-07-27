USE EstudoDeCasoDataScience
GO

/*
SELECT COUNT(1) FROM FUNCIONARIO
SELECT COUNT(1) FROM PRODUTO
SELECT COUNT(1) FROM PRODUTO_GRADE

SELECT COUNT(1) FROM ESTRUTURA
SELECT COUNT(1) FROM PRODUTO_PRECO
SELECT COUNT(1) FROM VENDA
*/

IF OBJECT_ID('ESTRUTURA') IS NOT NULL DROP TABLE ESTRUTURA
IF OBJECT_ID('FUNCIONARIO') IS NOT NULL DROP TABLE FUNCIONARIO
IF OBJECT_ID('PRODUTO_PRECO') IS NOT NULL DROP TABLE PRODUTO_PRECO
IF OBJECT_ID('PRODUTO_GRADE') IS NOT NULL DROP TABLE PRODUTO_GRADE
IF OBJECT_ID('VENDA') IS NOT NULL DROP TABLE VENDA
IF OBJECT_ID('PRODUTO') IS NOT NULL DROP TABLE PRODUTO

CREATE TABLE FUNCIONARIO
(
	ID_FUNCIONARIO	INT IDENTITY NOT NULL,
	MATRICULA		VARCHAR(4) NOT NULL UNIQUE,
	NOME			VARCHAR(250) NOT NULL,
	CONSTRAINT [PK_FUNCIONARIO] PRIMARY KEY CLUSTERED
	(
		[ID_FUNCIONARIO] ASC
	)
)
GO

CREATE TABLE PRODUTO
(
	ID_PRODUTO	INT IDENTITY NOT NULL,
	CODIGO		VARCHAR(14) NOT NULL UNIQUE,
	NOME		VARCHAR(150) NOT NULL,
	CONSTRAINT [PK_PRODUTO] PRIMARY KEY CLUSTERED
	(
		[ID_PRODUTO] ASC
	)
)
GO

CREATE TABLE PRODUTO_GRADE
(
	ID_PRODUTO_GRADE	INT IDENTITY NOT NULL,
	CODIGO_GRADE		VARCHAR(20) NOT NULL,
	ID_PRODUTO			INT NOT NULL,
	CONSTRAINT [PK_PRODUTO_GRADE] PRIMARY KEY CLUSTERED
	(
		[ID_PRODUTO_GRADE] ASC
	),
	CONSTRAINT [FK_PRODUTO_GRADE_PRODUTO] FOREIGN KEY([ID_PRODUTO]) REFERENCES [PRODUTO] ([ID_PRODUTO]),
	CONSTRAINT UC_PRODUTO_GRADE UNIQUE (CODIGO_GRADE, ID_PRODUTO)
)
GO

CREATE TABLE ESTRUTURA
(
	ID_ESTRUTURA			INT IDENTITY NOT NULL,
	ID_VENDEDOR				INT NOT NULL,
	ID_GERENTE				INT NOT NULL,
	CODIGO_GRADE_PRODUTO	VARCHAR(20) NOT NULL,
	CONSTRAINT [PK_ESTRUTURA] PRIMARY KEY CLUSTERED
	(
		[ID_ESTRUTURA] ASC
	),
	CONSTRAINT [FK_ESTRUTURA_FUNCIONARIO_VENDEDOR] FOREIGN KEY([ID_VENDEDOR]) REFERENCES [FUNCIONARIO] ([ID_FUNCIONARIO]),
	CONSTRAINT [FK_ESTRUTURA_FUNCIONARIO_GERENTE] FOREIGN KEY([ID_GERENTE]) REFERENCES [FUNCIONARIO] ([ID_FUNCIONARIO])
	--CONSTRAINT [FK_ESTRUTURA_PRODUTO_GRADE] FOREIGN KEY([CODIGO_GRADE]) REFERENCES [PRODUTO_GRADE] ([CODIGO_GRADE]),
)
GO

CREATE TABLE PRODUTO_PRECO
(
	ID_PRODUTO_PRECO	INT IDENTITY NOT NULL,
	PERIODO				DATETIME NOT NULL,
	ID_PRODUTO			INT NOT NULL,
	PRECO				FLOAT NOT NULL,
	CONSTRAINT [PK_PRODUTO_PRECO] PRIMARY KEY CLUSTERED
	(
		[ID_PRODUTO_PRECO] ASC
	),
	CONSTRAINT [FK_PRODUTO_PRECO_PRODUTO] FOREIGN KEY([ID_PRODUTO]) REFERENCES [PRODUTO] ([ID_PRODUTO])
)
GO

CREATE TABLE VENDA
(
	ID_VENDA	INT IDENTITY NOT NULL,
	PERIODO		DATETIME NOT NULL,
	ID_PRODUTO	INT NOT NULL,
	QUANTIDADE	INT NOT NULL,
	CONSTRAINT [PK_VENDA] PRIMARY KEY CLUSTERED
	(
		[ID_VENDA] ASC
	),
	CONSTRAINT [FK_VENDA_PRODUTO] FOREIGN KEY([ID_PRODUTO]) REFERENCES [PRODUTO] ([ID_PRODUTO])
)
GO