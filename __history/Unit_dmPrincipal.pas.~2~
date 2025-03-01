unit Unit_dmPrincipal;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, Data.FMTBcd,
  Datasnap.Provider, Datasnap.DBClient, Data.DBXMSSQL;

type
  TdmPrincipal = class(TDataModule)
    sqlConexao: TSQLConnection;
    cdsListarProdutos: TClientDataSet;
    dspListarProdutos: TDataSetProvider;
    sqlListarProdutos: TSQLQuery;
    sqlExcluirProduto: TSQLStoredProc;
    sqlGravarProduto: TSQLStoredProc;
    cdsCarregarProduto: TClientDataSet;
    dspCarregarProduto: TDataSetProvider;
    sqlCarregarProduto: TSQLStoredProc;
    cdsCarregarProdutoID_PRODUTO: TIntegerField;
    cdsCarregarProdutoCOD_EAN: TStringField;
    cdsCarregarProdutoDS_PRODUTO: TStringField;
    cdsCarregarProdutoID_DEPTO: TIntegerField;
    cdsCarregarProdutoDS_NCM: TStringField;
    cdsCarregarProdutoCD_CFOP_ENTRADA: TStringField;
    cdsCarregarProdutoCD_CFOP_SAIDA: TStringField;
    cdsCarregarProdutoVLR_CUSTO: TFMTBCDField;
    cdsCarregarProdutoVLR_VENDA: TFMTBCDField;
    cdsCarregarProdutoQTD_ESTQ_ATUAL: TFloatField;
    cdsCarregarProdutoDS_UNIDADE_MEDIDA: TStringField;
    cdsCarregarProdutoMARGEM_LUCRO: TFloatField;
    cdsCarregarProdutoDS_OBSERVACAO: TStringField;
    cdsCarregarProdutoDT_INCLUSAO: TSQLTimeStampField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
