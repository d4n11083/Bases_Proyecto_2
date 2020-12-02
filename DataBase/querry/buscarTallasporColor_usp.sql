USE [InventarioZapateria]
GO
/****** Object:  StoredProcedure [dbo].[buscarTallasporColor_usp]    Script Date: 02/12/2020 1:46:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Joshua Arcia
-- Create date: 01/12/2020
-- Description:	Busca todos las tallas disponibles para un color
-- =============================================
ALTER PROCEDURE [dbo].[buscarTallasporColor_usp]
	-- Add the parameters for the stored procedure here
	@color VARCHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	-- Insert statements for procedure here
	SELECT Colores.color
		,Tallas.talla
		, Estilos.estilo
	FROM Colores
	INNER JOIN Zapatos ON Colores.id_Color = Zapatos.fk_color
	INNER JOIN Tallas ON Zapatos.fk_talla = Tallas.id_Talla
	INNER JOIN Estilos ON Zapatos.fk_estilo = Estilos.id_Estilo
	WHERE Colores.color = @color
		AND Colores.disponible = 1
		AND Tallas.disponible = 1
END
