object frmBuscaProduto: TfrmBuscaProduto
  Left = 0
  Top = 0
  Caption = 'Buscar Produtos'
  ClientHeight = 442
  ClientWidth = 628
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnClose = FormClose
  TextHeight = 15
  object dbgProdutos: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 68
    Width = 622
    Height = 371
    Align = alClient
    DataSource = dmPrincipal.dsListarProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 20
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = dbgProdutosDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_EAN'
        Title.Caption = 'COD'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_PRODUTO'
        Title.Caption = 'DESCRI'#199#195'O'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_NCM'
        Title.Caption = 'NCM'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CD_CFOP_ENTRADA'
        Title.Caption = 'CFOP - ENTRADA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CD_CFOP_SAIDA'
        Title.Caption = 'CFOP - SAIDA'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_CUSTO'
        Title.Caption = 'VLR. CUSTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_VENDA'
        Title.Caption = 'VLR. VENDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD_ESTQ_ATUAL'
        Title.Caption = 'ESTQ. ATUAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_UNIDADE_MEDIDA'
        Title.Caption = 'UNIDADE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MARGEM_LUCRO'
        Title.Caption = 'MARGEM LUCRO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_INCLUSAO'
        Title.Caption = 'DATA DE CADASTRO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_OBSERVACAO'
        Title.Caption = 'OBS.'
        Visible = True
      end>
  end
  object pnlNavegacao: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 65
    Align = alTop
    Color = clHotLight
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 624
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 114
      Height = 19
      Caption = 'Buscar Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 20
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object edtFiltro: TEdit
      Left = 8
      Top = 29
      Width = 305
      Height = 23
      TabOrder = 0
    end
    object btn_selecionar: TBitBtn
      Left = 488
      Top = 11
      Width = 121
      Height = 45
      Caption = 'Selecionar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 20
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btn_selecionarClick
    end
  end
  object ImageList1: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Height = 40
    Width = 40
    Left = 528
    Top = 296
  end
end
