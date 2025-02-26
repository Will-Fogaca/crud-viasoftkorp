object dmPrincipal: TdmPrincipal
  Height = 480
  Width = 640
  object sqlConexao: TSQLConnection
    DriverName = 'MSSQL'
    LoginPrompt = False
    Params.Strings = (
      'SchemaOverride=%.dbo'
      'DriverUnit=Data.DBXMSSQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver280.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMsSqlMetaDataCommandFactory,DbxMSSQLDr' +
        'iver280.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMsSqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMSSQLDriver,Version=24.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMSSQL'
      'LibraryName=dbxmss.dll'
      'VendorLib=sqlncli10.dll'
      'VendorLibWin64=sqlncli10.dll'
      'HostName=127.0.0.1'
      'DataBase=db_crud_will'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'OSAuthentication=False'
      'PrepareSQL=True'
      'User_Name=sistema'
      'Password=d22m04'
      'BlobSize=-1'
      'ErrorResourceFile='
      'OS Authentication=False'
      'Prepare SQL=False')
    Connected = True
    Left = 48
    Top = 32
  end
  object cdsListarProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 112
  end
  object dspListarProdutos: TDataSetProvider
    Left = 200
    Top = 112
  end
  object sqlListarProdutos: TSQLQuery
    Params = <>
    Left = 48
    Top = 112
  end
  object sqlExcluirProduto: TSQLStoredProc
    Params = <>
    Left = 168
    Top = 280
  end
  object sqlGravarProduto: TSQLStoredProc
    Params = <>
    Left = 48
    Top = 280
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
    Left = 336
    Top = 176
    object cdsCarregarProdutoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
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
    object cdsCarregarProdutoVLR_CUSTO: TFMTBCDField
      FieldName = 'VLR_CUSTO'
      Precision = 19
      Size = 4
    end
    object cdsCarregarProdutoVLR_VENDA: TFMTBCDField
      FieldName = 'VLR_VENDA'
      Precision = 19
      Size = 4
    end
    object cdsCarregarProdutoQTD_ESTQ_ATUAL: TIntegerField
      FieldName = 'QTD_ESTQ_ATUAL'
    end
    object cdsCarregarProdutoQTD_ESTQ_INICIAL: TIntegerField
      FieldName = 'QTD_ESTQ_INICIAL'
    end
    object cdsCarregarProdutoDS_UNIDADE_MEDIDA: TStringField
      FieldName = 'DS_UNIDADE_MEDIDA'
    end
    object cdsCarregarProdutoDS_OBSERVACAO: TStringField
      FieldName = 'DS_OBSERVACAO'
      Size = 100
    end
    object cdsCarregarProdutoDT_INCLUSAO: TSQLTimeStampField
      FieldName = 'DT_INCLUSAO'
    end
  end
  object dspCarregarProduto: TDataSetProvider
    DataSet = sqlCarregarProduto
    Left = 200
    Top = 176
  end
  object sqlCarregarProduto: TSQLStoredProc
    SchemaName = 'dbo'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Precision = 10
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Size = 10
        Value = 0
      end
      item
        DataType = ftString
        Precision = 13
        Name = '@COD_EAN'
        ParamType = ptInput
      end>
    SQLConnection = sqlConexao
    StoredProcName = 'SP_CARREGAR_PRODUTO'
    Left = 48
    Top = 176
  end
end
