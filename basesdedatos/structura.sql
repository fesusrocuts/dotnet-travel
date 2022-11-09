/*
 Backup de estructura para anexar a la prueba

 servidor: smarterasp
 tecnología: SQL Server
 versión: 15004198 (15.00.4198)
 dns / ip / proxy: SQL5107.site4now.net
 puerto: 1433
 Catalogo: db_a8f646_travel
 Esquema: dbo
*/

-- estructura de autores
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[autores]') AND type IN ('U'))
	DROP TABLE [dbo].[autores]
GO

CREATE TABLE [dbo].[autores] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(45) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [apellidos] varchar(45) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[autores] SET (LOCK_ESCALATION = TABLE)
GO


-- estructura de autores_has_libros
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[autores_has_libros]') AND type IN ('U'))
	DROP TABLE [dbo].[autores_has_libros]
GO

CREATE TABLE [dbo].[autores_has_libros] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [autores_id] int  NOT NULL,
  [libros_ISBN] int  NOT NULL
)
GO

ALTER TABLE [dbo].[autores_has_libros] SET (LOCK_ESCALATION = TABLE)
GO


-- estructura de editoriales
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[editoriales]') AND type IN ('U'))
	DROP TABLE [dbo].[editoriales]
GO

CREATE TABLE [dbo].[editoriales] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(45) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [sede] varchar(45) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[editoriales] SET (LOCK_ESCALATION = TABLE)
GO


-- Table structure for libros
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[libros]') AND type IN ('U'))
	DROP TABLE [dbo].[libros]
GO

CREATE TABLE [dbo].[libros] (
  [ISBN] int  NOT NULL,
  [editoriales_id] int  NULL,
  [titulo] varchar(45) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [sinopsis] text COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [n_paginas] varchar(45) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[libros] SET (LOCK_ESCALATION = TABLE)
GO


-- incrementos de valor para autores
DBCC CHECKIDENT ('[dbo].[autores]', RESEED, 4)
GO


-- LLave primaria para autores
ALTER TABLE [dbo].[autores] ADD CONSTRAINT [PK__autores__3213E83F83067B61] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- incrementos de valor para autores_has_libros
DBCC CHECKIDENT ('[dbo].[autores_has_libros]', RESEED, 3)
GO


-- LLave primaria para autores_has_libros
ALTER TABLE [dbo].[autores_has_libros] ADD CONSTRAINT [PK__autores___3213E83F1B105E9C] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- -- incrementos de valor para editoriales
DBCC CHECKIDENT ('[dbo].[editoriales]', RESEED, 3)
GO


-- LLave primaria para editoriales
ALTER TABLE [dbo].[editoriales] ADD CONSTRAINT [PK__editoria__3213E83FFF7A6B20] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- LLave primaria para table libros
ALTER TABLE [dbo].[libros] ADD CONSTRAINT [PK__libros__447D36EB0AAD94E4] PRIMARY KEY CLUSTERED ([ISBN])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- LLave foranea para autores_has_libros
ALTER TABLE [dbo].[autores_has_libros] ADD CONSTRAINT [autores_id] FOREIGN KEY ([autores_id]) REFERENCES [dbo].[autores] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[autores_has_libros] ADD CONSTRAINT [libros_ISBN] FOREIGN KEY ([libros_ISBN]) REFERENCES [dbo].[libros] ([ISBN]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[autores_has_libros] NOCHECK CONSTRAINT [autores_id]
GO

ALTER TABLE [dbo].[autores_has_libros] NOCHECK CONSTRAINT [libros_ISBN]
GO


-- LLave foranea para table libros
ALTER TABLE [dbo].[libros] ADD CONSTRAINT [editoriales_id] FOREIGN KEY ([editoriales_id]) REFERENCES [dbo].[editoriales] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
