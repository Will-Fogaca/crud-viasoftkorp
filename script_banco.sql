/*
	SCRIPT CRUD VIASOFT KORP

	CREATE DATABASE db_crud_will
		
*/



--CRIAR A TABELA DE PRODUTO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tb_produto]') AND type in (N'U'))
CREATE TABLE tb_produto (
    id_produto INT PRIMARY KEY IDENTITY(1,1),
    cod_ean VARCHAR(13),
    ds_produto VARCHAR(200),                     
    id_depto INT,  
    qtd_estq_atual FLOAT,
    ds_ncm VARCHAR(8),                  
    cd_cfop_entrada VARCHAR(4), 
    cd_cfop_saida VARCHAR(4),                      
    vlr_custo MONEY,                   
    vlr_venda MONEY,  
	margem_lucro FLOAT,                
    ds_unidade_medida VARCHAR(20),        
    ds_observacao VARCHAR(100),       
    dt_inclusao DATETIME DEFAULT GETDATE(),                           
    fl_ativo BIT DEFAULT 1
)

--PROCEDURE QUE OU IRÁ GRAVAR UM NOVO REGISTRO, OU EDITAR UM JÁ EXISTENTE
----------------------------------------------------------------------------------------------------
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_GRAVAR_PRODUTO]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[SP_GRAVAR_PRODUTO]
GO
CREATE PROCEDURE [dbo].[SP_GRAVAR_PRODUTO] 
	@COD_EAN VARCHAR(13), 
	@DS_PRODUTO VARCHAR(200), 
	@ID_DEPTO INT, 
	@DS_NCM VARCHAR(8), 
	@CD_CFOP_ENTRADA VARCHAR(4),
	@CD_CFOP_SAIDA VARCHAR(4),
	@VLR_CUSTO MONEY,
	@VLR_VENDA MONEY, 
	@DS_UNIDADE_MEDIDA VARCHAR(20),
	@QTD_ESTQ_ATUAL FLOAT,
	@DS_OBSERVACAO VARCHAR(100),
	@MARGEM_LUCRO FLOAT
AS 
	IF (SELECT COUNT(*) FROM TB_PRODUTO WHERE COD_EAN = @COD_EAN AND FL_ATIVO = 1) > 0 
	BEGIN
		UPDATE 
			TB_PRODUTO 
		SET 
			DS_PRODUTO = @DS_PRODUTO, 
			ID_DEPTO = @ID_DEPTO, 
			DS_NCM = @DS_NCM, 
			CD_CFOP_ENTRADA = @CD_CFOP_ENTRADA,
			CD_CFOP_SAIDA = @CD_CFOP_SAIDA, 
			VLR_CUSTO = @VLR_CUSTO, 
			VLR_VENDA = @VLR_VENDA, 
			DS_UNIDADE_MEDIDA = @DS_UNIDADE_MEDIDA,
			DS_OBSERVACAO = @DS_OBSERVACAO,
			MARGEM_LUCRO = @MARGEM_LUCRO,
			qtd_estq_atual = @QTD_ESTQ_ATUAL
		WHERE
			COD_EAN = @COD_EAN
			AND fl_ativo = 1
	END
	ELSE 
	BEGIN
		INSERT INTO TB_PRODUTO 
			(
				COD_EAN,
				DS_PRODUTO,
				ID_DEPTO, 
				DS_NCM, 
				CD_CFOP_ENTRADA,
				CD_CFOP_SAIDA,
				VLR_CUSTO,
				VLR_VENDA, 
				DS_UNIDADE_MEDIDA,
				QTD_ESTQ_ATUAL,
				DS_OBSERVACAO,
				MARGEM_LUCRO
			)
		VALUES
			(
				@COD_EAN,
				@DS_PRODUTO,
				@ID_DEPTO, 
				@DS_NCM, 
				@CD_CFOP_ENTRADA,
				@CD_CFOP_SAIDA,
				@VLR_CUSTO,
				@VLR_VENDA, 
				@DS_UNIDADE_MEDIDA,
				@QTD_ESTQ_ATUAL,
				@DS_OBSERVACAO,
				@MARGEM_LUCRO	
			)
	END
GO

--PROCEDURE QUE DEIXARÁ O PRODUTO INATIVO
---------------------------------------------------------------------------------------------------------------------------
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_EXCLUIR_PRODUTO]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[SP_EXCLUIR_PRODUTO]
GO
CREATE PROCEDURE [dbo].[SP_EXCLUIR_PRODUTO]
@COD_EAN VARCHAR(13)
AS 
	UPDATE 
		TB_PRODUTO 
	SET 
		FL_ATIVO = 0 
	WHERE 
		COD_EAN = @COD_EAN
		AND FL_ATIVO = 1
GO

--CARREGAR DADOS DE UM PRODUTO ESPECÍFICO
---------------------------------------------------------------------------------------------------------------------------
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_CARREGAR_PRODUTO]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[SP_CARREGAR_PRODUTO]
GO
CREATE PROCEDURE [dbo].[SP_CARREGAR_PRODUTO]
@COD_EAN VARCHAR(13)
AS
	SELECT 
		ID_PRODUTO,
		COD_EAN,
		DS_PRODUTO,                     
		ID_DEPTO,  
		DS_NCM,                  
		CD_CFOP_ENTRADA,
		CD_CFOP_SAIDA,
		VLR_CUSTO,                   
		VLR_VENDA,           
		QTD_ESTQ_ATUAL,       
		DS_UNIDADE_MEDIDA,
		MARGEM_LUCRO,
		DS_OBSERVACAO,                  
		DT_INCLUSAO                         
	FROM 
		TB_PRODUTO 
	WHERE 
		FL_ATIVO = 1
		AND COD_EAN = @COD_EAN
GO

--LISTAR TODOS OS PRODUTOS
---------------------------------------------------------------------------------------------------------------------------
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_LISTAR_PRODUTOS]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [dbo].[SP_LISTAR_PRODUTOS]
GO
CREATE PROCEDURE [dbo].[SP_LISTAR_PRODUTOS]
AS
	SELECT 
		ID_PRODUTO,
		COD_EAN,
		DS_PRODUTO,                     
		ID_DEPTO,  
		DS_NCM,                  
		CD_CFOP_ENTRADA,
		CD_CFOP_SAIDA,                 
		VLR_CUSTO,                   
		VLR_VENDA, 
		QTD_ESTQ_ATUAL,                
		DS_UNIDADE_MEDIDA, 
		MARGEM_LUCRO,
		DS_OBSERVACAO,                 
		DT_INCLUSAO                         
	FROM 
		TB_PRODUTO 
	WHERE 
		FL_ATIVO = 1
GO