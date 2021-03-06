USE [carrental]
GO
/****** Object:  Table [dbo].[Coches]    Script Date: 20/06/2017 16:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coches](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[matricula] [nvarchar](10) NOT NULL,
	[idMarca] [bigint] NOT NULL,
	[idTipoCombustible] [bigint] NOT NULL,
	[color] [nvarchar](20) NULL,
	[cilindrada] [decimal](4, 2) NULL,
	[nPlazas] [smallint] NOT NULL,
	[fechaMatriculacion] [date] NULL,
 CONSTRAINT [PK_Coches] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Marcas]    Script Date: 20/06/2017 16:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marcas](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[denominacion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Marcas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TiposCombustible]    Script Date: 20/06/2017 16:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposCombustible](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[denominacion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TiposCombustible] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[V_N_COCHES_POR_MARCA]    Script Date: 20/06/2017 16:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREAMOS UNA VISTA PARA CONTAR EL Nº DE COCHES POR MARCA
CREATE VIEW [dbo].[V_N_COCHES_POR_MARCA] AS 

SELECT M.denominacion as Marca, count(C.id) as nCoches
FROM Marcas M
	
	LEFT JOIN	Coches C on M.id = C.idMarca
GROUP BY M.denominacion 
GO
SET IDENTITY_INSERT [dbo].[Coches] ON 

INSERT [dbo].[Coches] ([id], [matricula], [idMarca], [idTipoCombustible], [color], [cilindrada], [nPlazas], [fechaMatriculacion]) VALUES (6, N'BBD6998', 2, 2, N'AMARILLO', CAST(1.50 AS Decimal(4, 2)), 4, CAST(N'2003-05-14' AS Date))
INSERT [dbo].[Coches] ([id], [matricula], [idMarca], [idTipoCombustible], [color], [cilindrada], [nPlazas], [fechaMatriculacion]) VALUES (9, N'BBD6998', 2, 2, N'AMARILLO', CAST(1.50 AS Decimal(4, 2)), 4, CAST(N'2003-05-14' AS Date))
INSERT [dbo].[Coches] ([id], [matricula], [idMarca], [idTipoCombustible], [color], [cilindrada], [nPlazas], [fechaMatriculacion]) VALUES (12, N'BBD6998', 2, 2, N'AMARILLO', CAST(1.50 AS Decimal(4, 2)), 4, CAST(N'2003-05-14' AS Date))
INSERT [dbo].[Coches] ([id], [matricula], [idMarca], [idTipoCombustible], [color], [cilindrada], [nPlazas], [fechaMatriculacion]) VALUES (15, N'BBD6998', 2, 2, N'AMARILLO', CAST(1.50 AS Decimal(4, 2)), 4, CAST(N'2003-05-14' AS Date))
SET IDENTITY_INSERT [dbo].[Coches] OFF
SET IDENTITY_INSERT [dbo].[Marcas] ON 

INSERT [dbo].[Marcas] ([id], [denominacion]) VALUES (2, N'Toyota')
INSERT [dbo].[Marcas] ([id], [denominacion]) VALUES (3, N'Porsche')
INSERT [dbo].[Marcas] ([id], [denominacion]) VALUES (4, N'Mercedes Benz')
INSERT [dbo].[Marcas] ([id], [denominacion]) VALUES (30, N'Lotus')
INSERT [dbo].[Marcas] ([id], [denominacion]) VALUES (33, N'BMW')
SET IDENTITY_INSERT [dbo].[Marcas] OFF
SET IDENTITY_INSERT [dbo].[TiposCombustible] ON 

INSERT [dbo].[TiposCombustible] ([id], [denominacion]) VALUES (1, N'Gasolina')
INSERT [dbo].[TiposCombustible] ([id], [denominacion]) VALUES (2, N'Diésel')
INSERT [dbo].[TiposCombustible] ([id], [denominacion]) VALUES (3, N'Híbrido')
INSERT [dbo].[TiposCombustible] ([id], [denominacion]) VALUES (4, N'Eléctrico')
INSERT [dbo].[TiposCombustible] ([id], [denominacion]) VALUES (5, N'Hidrógeno')
INSERT [dbo].[TiposCombustible] ([id], [denominacion]) VALUES (6, N'Helio')
INSERT [dbo].[TiposCombustible] ([id], [denominacion]) VALUES (7, N'Gas Natural')
SET IDENTITY_INSERT [dbo].[TiposCombustible] OFF
ALTER TABLE [dbo].[Coches] ADD  DEFAULT ((5)) FOR [nPlazas]
GO
ALTER TABLE [dbo].[Coches]  WITH CHECK ADD  CONSTRAINT [FK_Coches_Marcas] FOREIGN KEY([idMarca])
REFERENCES [dbo].[Marcas] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Coches] CHECK CONSTRAINT [FK_Coches_Marcas]
GO
ALTER TABLE [dbo].[Coches]  WITH CHECK ADD  CONSTRAINT [FK_Coches_TiposCombustible] FOREIGN KEY([idTipoCombustible])
REFERENCES [dbo].[TiposCombustible] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Coches] CHECK CONSTRAINT [FK_Coches_TiposCombustible]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarMarca]    Script Date: 20/06/2017 16:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarMarca]
	@denominacion nvarchar(50)
	,@id bigint
AS
BEGIN
	UPDATE Marcas SET
		denominacion = @denominacion
	WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[AgregarMarca]    Script Date: 20/06/2017 16:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AgregarMarca]
	@denominacion nvarchar(50)
AS
BEGIN
	INSERT INTO Marcas(denominacion) VALUES (@denominacion)
END

GO
/****** Object:  StoredProcedure [dbo].[AgregarTipoCombustible]    Script Date: 20/06/2017 16:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarTipoCombustible]
	@denominacion nvarchar(50)
AS
	
BEGIN
	INSERT INTO TiposCombustible(denominacion) VALUES(@denominacion) 
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarMarca]    Script Date: 20/06/2017 16:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarMarca]
	@id bigint
AS
BEGIN
	DELETE FROM Marcas WHERE id =@id
END
GO
/****** Object:  StoredProcedure [dbo].[GET_COCHE_POR_MARCA]    Script Date: 20/06/2017 16:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREAMOS UN PROCEDIMIENTO ALMACENADO
CREATE PROCEDURE [dbo].[GET_COCHE_POR_MARCA]
AS
BEGIN
	--SELECT  count(*) FROM Coches
	--SELECT *  FROM Coches
	--INSERT INTO Coches (matricula, idMarca, idTiposCombustible,
	--			color, cilindrada, nPlazas, fechaMatriculacion)
	--SELECT  matricula, idMarca, idTiposCombustible, color,
	--		cilindrada, nPlazas, fechaMatriculacion  
	--FROM Coches	

	SELECT 
	  Marcas.denominacion as denominacionMarca
	, TiposCombustible.denominacion as denominacionTipoCombustible
	, Coches.id, Coches.matricula, Coches.color, Coches.nPlazas
	, Coches.fechaMatriculacion, coches.cilindrada, coches.idMarca, coches.idTipoCombustible  
	
	FROM Marcas
		INNER JOIN Coches on Marcas.id = Coches.idMarca
		INNER JOIN TiposCombustible on Coches.idTipoCombustible = TiposCombustible.id
	GROUP BY
	Marcas.denominacion 
	, TiposCombustible.denominacion 
	, Coches.id, Coches.matricula, Coches.color, Coches.nPlazas
	, Coches.fechaMatriculacion, coches.cilindrada, coches.idMarca, coches.idTipoCombustible 
	ORDER BY Marcas.denominacion 
	--PRINT 'MI PRIMER PROCEDIMIENTO ALMACENADO'
END
GO
/****** Object:  StoredProcedure [dbo].[GET_COCHE_POR_MARCA_ID]    Script Date: 20/06/2017 16:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_COCHE_POR_MARCA_ID]
	@id bigint
AS
BEGIN
SELECT 
	  Marcas.denominacion as denominacionMarca
	, TiposCombustible.denominacion as denominacionTipoCombustible
	, Coches.idMarca
	, Coches.idTipoCombustible
	, Coches.id, Coches.matricula, Coches.color, Coches.nPlazas
	, Coches.fechaMatriculacion, Coches.cilindrada
FROM Marcas
	INNER JOIN Coches on Marcas.id = Coches.idMarca
	INNER JOIN TiposCombustible on Coches.idTipoCombustible = TiposCombustible.id
WHERE Coches.id = @id
GROUP BY 
	  Marcas.denominacion
	, TiposCombustible.denominacion
	, Coches.idMarca
	, Coches.idTipoCombustible
	, Coches.id, Coches.matricula, Coches.color, Coches.nPlazas
	, Coches.fechaMatriculacion, Coches.cilindrada
ORDER BY Marcas.denominacion

END
GO
/****** Object:  StoredProcedure [dbo].[GET_COCHE_POR_MARCA_MATRICULA_PLAZAS]    Script Date: 20/06/2017 16:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_COCHE_POR_MARCA_MATRICULA_PLAZAS]
AS
BEGIN
	SELECT 
		 M.denominacion as Marca
		,C.matricula
		,C.nPlazas
	FROM Marcas M
		INNER JOIN Coches C ON M.id = C.idMarca
	GROUP BY 
		 M.denominacion
		,C.matricula
		,C.nPlazas
	ORDER BY nPlazas
END
GO
/****** Object:  StoredProcedure [dbo].[GET_COCHE_POR_MARCA_MATRICULA_PLAZAS_2]    Script Date: 20/06/2017 16:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GET_COCHE_POR_MARCA_MATRICULA_PLAZAS_2]
      @marca nvarchar(50) = NULL
    , @nPlazas smallint = NULL
AS
BEGIN
    SELECT 
         M.denominacion as Marca
        ,C.matricula
        ,C.nPlazas
    FROM Marcas M
        INNER JOIN Coches C ON M.id = C.idMarca
    WHERE 
        (M.denominacion LIKE '%' + @marca + '%' OR @marca is null)
    and    (C.nPlazas >= @nPlazas OR @nPlazas is null)
    ORDER BY nPlazas
END
GO
/****** Object:  StoredProcedure [dbo].[GetMarcas]    Script Date: 20/06/2017 16:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- PROCEDIMIENTO PARA LISTAR LAS MARCAS
CREATE PROCEDURE [dbo].[GetMarcas]
AS
BEGIN
    SELECT id, denominacion FROM Marcas
END

GO
/****** Object:  StoredProcedure [dbo].[GetTiposCombustibles]    Script Date: 20/06/2017 16:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO ALMACENADO PARA LISTAR LOS TIPOS DE COMBUSTIBLE
CREATE PROCEDURE [dbo].[GetTiposCombustibles]
AS
BEGIN
	SELECT id, denominacion FROM TiposCombustible
END
GO
