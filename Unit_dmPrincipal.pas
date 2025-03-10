unit Unit_dmPrincipal;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, Data.FMTBcd,
  Datasnap.Provider, Datasnap.DBClient, Data.DBXMSSQL, Midas, MidasLib,
  DBAccess, MSAccess, MemDS;

type
  TdmPrincipal = class(TDataModule)
    cdsListarProdutos: TClientDataSet;
    dspListarProdutos: TDataSetProvider;
    cdsCarregarProduto: TClientDataSet;
    dspCarregarProduto: TDataSetProvider;
    dsListarProdutos: TDataSource;
    sqlConexao: TMSConnection;
    sqlListarProdutos: TMSQuery;
    sqlCarregarProduto: TMSQuery;
    sqlGravarProduto: TMSStoredProc;
    sqlExcluirProduto: TMSStoredProc;
    cdsListarProdutosID_PRODUTO: TIntegerField;
    cdsListarProdutosCOD_EAN: TStringField;
    cdsListarProdutosDS_PRODUTO: TStringField;
    cdsListarProdutosID_DEPTO: TIntegerField;
    cdsListarProdutosDS_NCM: TStringField;
    cdsListarProdutosCD_CFOP_ENTRADA: TStringField;
    cdsListarProdutosCD_CFOP_SAIDA: TStringField;
    cdsListarProdutosVLR_CUSTO: TCurrencyField;
    cdsListarProdutosVLR_VENDA: TCurrencyField;
    cdsListarProdutosQTD_ESTQ_ATUAL: TFloatField;
    cdsListarProdutosDS_UNIDADE_MEDIDA: TStringField;
    cdsListarProdutosMARGEM_LUCRO: TFloatField;
    cdsListarProdutosDS_OBSERVACAO: TStringField;
    cdsListarProdutosDT_INCLUSAO: TDateTimeField;
    cdsCarregarProdutoID_PRODUTO: TIntegerField;
    cdsCarregarProdutoCOD_EAN: TStringField;
    cdsCarregarProdutoDS_PRODUTO: TStringField;
    cdsCarregarProdutoID_DEPTO: TIntegerField;
    cdsCarregarProdutoDS_NCM: TStringField;
    cdsCarregarProdutoCD_CFOP_ENTRADA: TStringField;
    cdsCarregarProdutoCD_CFOP_SAIDA: TStringField;
    cdsCarregarProdutoVLR_CUSTO: TCurrencyField;
    cdsCarregarProdutoVLR_VENDA: TCurrencyField;
    cdsCarregarProdutoQTD_ESTQ_ATUAL: TFloatField;
    cdsCarregarProdutoDS_UNIDADE_MEDIDA: TStringField;
    cdsCarregarProdutoMARGEM_LUCRO: TFloatField;
    cdsCarregarProdutoDS_OBSERVACAO: TStringField;
    cdsCarregarProdutoDT_INCLUSAO: TDateTimeField;
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
