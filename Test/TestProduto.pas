unit TestProduto;

interface

uses
  TestFramework, FireDAC.Comp.Client, Data.DB, Produto, System.SysUtils,
  System.Classes, Unit_dmPrincipal;

type
  TestTProduto = class(TTestCase)
  strict private
    FProduto: TProduto;
    FDmPrincipal: TdmPrincipal;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestGravarProduto;
    procedure TestExcluirProduto;
    procedure TestBuscarProdutoPorEAN;
    procedure TestListarProdutos;
  end;

implementation

procedure TestTProduto.SetUp;
begin
  FDmPrincipal := TdmPrincipal.Create(nil);
  try
    FDmPrincipal.sqlConexao.Connected := True;
  except
    on E: Exception do
      raise Exception.Create('Erro ao configurar o DataModule: ' + E.Message);
  end;

  FProduto := TProduto.Create;
end;

procedure TestTProduto.TearDown;
begin
  FProduto.Free;
  FProduto := nil;

  FDmPrincipal.Free;
  FDmPrincipal := nil;
end;

procedure TestTProduto.TestGravarProduto;
var
  ReturnValue: Boolean;
begin
  try
    FDmPrincipal.sqlGravarProduto.Params[1].Value := '1234567890123';
    FDmPrincipal.sqlGravarProduto.Params[2].Value := 'Produto Teste';
    FDmPrincipal.sqlGravarProduto.Params[3].Value := 1;
    FDmPrincipal.sqlGravarProduto.Params[4].Value := '1234.56.78';
    FDmPrincipal.sqlGravarProduto.Params[5].Value := '5405';
    FDmPrincipal.sqlGravarProduto.Params[6].Value := '6404';
    FDmPrincipal.sqlGravarProduto.Params[7].Value := 10.50;
    FDmPrincipal.sqlGravarProduto.Params[8].Value := 20.00;
    FDmPrincipal.sqlGravarProduto.Params[9].Value := 'UN';
    FDmPrincipal.sqlGravarProduto.Params[10].Value := 100;
    FDmPrincipal.sqlGravarProduto.Params[11].Value := 'Produto de teste';
    FDmPrincipal.sqlGravarProduto.Params[12].Value := 50.0;

    FDmPrincipal.sqlGravarProduto.ExecProc;
    ReturnValue := True;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao gravar produto: ' + E.Message);
      ReturnValue := False;
    end;
  end;

  CheckTrue(ReturnValue, 'Falha ao gravar produto');
end;

procedure TestTProduto.TestExcluirProduto;
var
  ReturnValue: Boolean;
begin
  try
    FDmPrincipal.sqlExcluirProduto.Params[1].Value := '1234567890123';
    FDmPrincipal.sqlExcluirProduto.ExecProc;
    ReturnValue := True;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao excluir produto: ' + E.Message);
      ReturnValue := False;
    end;
  end;

  CheckTrue(ReturnValue, 'Falha ao excluir produto');
end;

procedure TestTProduto.TestBuscarProdutoPorEAN;
var
  ReturnValue: Boolean;
  CodEan: string;
begin
  CodEan := '1234567890123';

  try
    FDmPrincipal.cdsCarregarProduto.Close;
    FDmPrincipal.cdsCarregarProduto.Params[1].Value := CodEan;
    FDmPrincipal.cdsCarregarProduto.Open;

    if FDmPrincipal.cdsCarregarProduto.RecordCount = 0 then
    begin
      ReturnValue := False;
      Writeln('Produto não encontrado no banco de dados.');
    end
    else
    begin

      FProduto.IdProduto := FDmPrincipal.cdsCarregarProdutoID_PRODUTO.AsInteger;
      FProduto.Descricao := FDmPrincipal.cdsCarregarProdutoDS_PRODUTO.AsString;
      FProduto.IdDepto := FDmPrincipal.cdsCarregarProdutoID_DEPTO.AsInteger;
      FProduto.QtdEstqAtual := FDmPrincipal.cdsCarregarProdutoQTD_ESTQ_ATUAL.AsFloat;
      FProduto.Ncm := FDmPrincipal.cdsCarregarProdutoDS_NCM.AsString;
      FProduto.CfopEntrada := FDmPrincipal.cdsCarregarProdutoCD_CFOP_ENTRADA.AsString;
      FProduto.CfopSaida := FDmPrincipal.cdsCarregarProdutoCD_CFOP_SAIDA.AsString;
      FProduto.ValorCusto := FDmPrincipal.cdsCarregarProdutoVLR_CUSTO.AsCurrency;
      FProduto.ValorVenda := FDmPrincipal.cdsCarregarProdutoVLR_VENDA.AsCurrency;
      FProduto.MargemLucro := FDmPrincipal.cdsCarregarProdutoMARGEM_LUCRO.AsFloat;
      FProduto.UnidadeMedida := FDmPrincipal.cdsCarregarProdutoDS_UNIDADE_MEDIDA.AsString;
      FProduto.Observacao := FDmPrincipal.cdsCarregarProdutoDS_OBSERVACAO.AsString;
      
      ReturnValue := True;
      Writeln('Produto encontrado com sucesso.');
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao buscar produto: ' + E.Message);
      ReturnValue := False;
      Writeln('Erro ao buscar produto: ' + E.Message);
    end;
  end;

  CheckTrue(ReturnValue, 'Falha ao buscar produto por EAN');
end;

procedure TestTProduto.TestListarProdutos;
var
  ReturnValue: Boolean;
begin
  try
    FDmPrincipal.cdsListarProdutos.Close;
    FDmPrincipal.cdsListarProdutos.Open;
    ReturnValue := True;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao listar produtos: ' + E.Message);
      ReturnValue := False;
    end;
  end;

  CheckTrue(ReturnValue, 'Falha ao listar produtos');
end;

initialization
  RegisterTest(TestTProduto.Suite);
end.
