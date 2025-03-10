object dmPrincipal: TdmPrincipal
  Height = 480
  Width = 640
  object cdsListarProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspListarProdutos'
    Left = 336
    Top = 112
    object cdsListarProdutosID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      ReadOnly = True
    end
    object cdsListarProdutosCOD_EAN: TStringField
      FieldName = 'COD_EAN'
      Size = 13
    end
    object cdsListarProdutosDS_PRODUTO: TStringField
      FieldName = 'DS_PRODUTO'
      Size = 200
    end
    object cdsListarProdutosID_DEPTO: TIntegerField
      FieldName = 'ID_DEPTO'
    end
    object cdsListarProdutosDS_NCM: TStringField
      FieldName = 'DS_NCM'
      Size = 8
    end
    object cdsListarProdutosCD_CFOP_ENTRADA: TStringField
      FieldName = 'CD_CFOP_ENTRADA'
      Size = 4
    end
    object cdsListarProdutosCD_CFOP_SAIDA: TStringField
      FieldName = 'CD_CFOP_SAIDA'
      Size = 4
    end
    object cdsListarProdutosVLR_CUSTO: TCurrencyField
      FieldName = 'VLR_CUSTO'
    end
    object cdsListarProdutosVLR_VENDA: TCurrencyField
      FieldName = 'VLR_VENDA'
    end
    object cdsListarProdutosQTD_ESTQ_ATUAL: TFloatField
      FieldName = 'QTD_ESTQ_ATUAL'
    end
    object cdsListarProdutosDS_UNIDADE_MEDIDA: TStringField
      FieldName = 'DS_UNIDADE_MEDIDA'
    end
    object cdsListarProdutosMARGEM_LUCRO: TFloatField
      FieldName = 'MARGEM_LUCRO'
    end
    object cdsListarProdutosDS_OBSERVACAO: TStringField
      FieldName = 'DS_OBSERVACAO'
      Size = 100
    end
    object cdsListarProdutosDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
    end
  end
  object dspListarProdutos: TDataSetProvider
    DataSet = sqlListarProdutos
    Left = 208
    Top = 112
  end
  object cdsCarregarProduto: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Precision = 10
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Size = 10
      end
      item
        DataType = ftString
        Precision = 13
        Name = '@COD_EAN'
        ParamType = ptInput
      end>
    ProviderName = 'dspCarregarProduto'
    Left = 352
    Top = 192
    object cdsCarregarProdutoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      ReadOnly = True
    end
    object cdsCarregarProdutoCOD_EAN: TStringField
      FieldName = 'COD_EAN'
      Size = 13
    end
    object cdsCarregarProdutoDS_PRODUTO: TStringField
      FieldName = 'DS_PRODUTO'
      Size = 200
    end
    object cdsCarregarProdutoID_DEPTO: TIntegerField
      FieldName = 'ID_DEPTO'
    end
    object cdsCarregarProdutoDS_NCM: TStringField
      FieldName = 'DS_NCM'
      Size = 8
    end
    object cdsCarregarProdutoCD_CFOP_ENTRADA: TStringField
      FieldName = 'CD_CFOP_ENTRADA'
      Size = 4
    end
    object cdsCarregarProdutoCD_CFOP_SAIDA: TStringField
      FieldName = 'CD_CFOP_SAIDA'
      Size = 4
    end
    object cdsCarregarProdutoVLR_CUSTO: TCurrencyField
      FieldName = 'VLR_CUSTO'
    end
    object cdsCarregarProdutoVLR_VENDA: TCurrencyField
      FieldName = 'VLR_VENDA'
    end
    object cdsCarregarProdutoQTD_ESTQ_ATUAL: TFloatField
      FieldName = 'QTD_ESTQ_ATUAL'
    end
    object cdsCarregarProdutoDS_UNIDADE_MEDIDA: TStringField
      FieldName = 'DS_UNIDADE_MEDIDA'
    end
    object cdsCarregarProdutoMARGEM_LUCRO: TFloatField
      FieldName = 'MARGEM_LUCRO'
    end
    object cdsCarregarProdutoDS_OBSERVACAO: TStringField
      FieldName = 'DS_OBSERVACAO'
      Size = 100
    end
    object cdsCarregarProdutoDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
    end
  end
  object dspCarregarProduto: TDataSetProvider
    DataSet = sqlCarregarProduto
    Left = 208
    Top = 192
  end
  object dsListarProdutos: TDataSource
    DataSet = cdsListarProdutos
    Left = 464
    Top = 112
  end
  object sqlConexao: TMSConnection
    Database = 'db_crud'
    Options.Provider = prSQL
    Username = 'sistema'
    Server = 'PC-WILL\MSSQLSERVERDEV'
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 40
    EncryptedPassword = '8CFF96FF8CFF8BFF9AFF92FF9EFF'
  end
  object sqlListarProdutos: TMSQuery
    Connection = sqlConexao
    SQL.Strings = (
      '{:RETURN_VALUE = CALL [SP_LISTAR_PRODUTOS]}')
    Left = 56
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end>
    CommandStoredProcName = '[SP_LISTAR_PRODUTOS]'
  end
  object sqlCarregarProduto: TMSQuery
    Connection = sqlConexao
    SQL.Strings = (
      '{:RETURN_VALUE = CALL SP_CARREGAR_PRODUTO (:COD_EAN)}')
    Left = 56
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@COD_EAN'
        ParamType = ptInput
        Value = nil
      end>
    CommandStoredProcName = 'SP_CARREGAR_PRODUTO'
  end
  object sqlGravarProduto: TMSStoredProc
    StoredProcName = 'SP_GRAVAR_PRODUTO'
    Connection = sqlConexao
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL SP_GRAVAR_PRODUTO (:COD_EAN, :DS_PRODUTO, ' +
        ':ID_DEPTO, :DS_NCM, :CD_CFOP_ENTRADA, :CD_CFOP_SAIDA, :VLR_CUSTO' +
        ', :VLR_VENDA, :DS_UNIDADE_MEDIDA, :QTD_ESTQ_ATUAL, :DS_OBSERVACA' +
        'O, :MARGEM_LUCRO)}')
    Left = 56
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = nil
      end
      item
        DataType = ftString
        Name = 'COD_EAN'
        ParamType = ptInput
        Size = 13
        Value = nil
      end
      item
        DataType = ftString
        Name = 'DS_PRODUTO'
        ParamType = ptInput
        Size = 200
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'ID_DEPTO'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'DS_NCM'
        ParamType = ptInput
        Size = 8
        Value = nil
      end
      item
        DataType = ftString
        Name = 'CD_CFOP_ENTRADA'
        ParamType = ptInput
        Size = 4
        Value = nil
      end
      item
        DataType = ftString
        Name = 'CD_CFOP_SAIDA'
        ParamType = ptInput
        Size = 4
        Value = nil
      end
      item
        DataType = ftCurrency
        Name = 'VLR_CUSTO'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftCurrency
        Name = 'VLR_VENDA'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'DS_UNIDADE_MEDIDA'
        ParamType = ptInput
        Size = 20
        Value = nil
      end
      item
        DataType = ftFloat
        Name = 'QTD_ESTQ_ATUAL'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'DS_OBSERVACAO'
        ParamType = ptInput
        Size = 100
        Value = nil
      end
      item
        DataType = ftFloat
        Name = 'MARGEM_LUCRO'
        ParamType = ptInput
        Value = nil
      end>
    CommandStoredProcName = 'SP_GRAVAR_PRODUTO'
  end
  object sqlExcluirProduto: TMSStoredProc
    StoredProcName = 'SP_EXCLUIR_PRODUTO'
    Connection = sqlConexao
    SQL.Strings = (
      '{:RETURN_VALUE = CALL SP_EXCLUIR_PRODUTO (:COD_EAN)}')
    Left = 216
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = nil
      end
      item
        DataType = ftString
        Name = 'COD_EAN'
        ParamType = ptInput
        Size = 13
        Value = nil
      end>
    CommandStoredProcName = 'SP_EXCLUIR_PRODUTO'
  end
end
