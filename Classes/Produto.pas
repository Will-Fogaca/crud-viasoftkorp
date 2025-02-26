unit Produto;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.Client;

type
  TProduto = class
  private
    FIdProduto: Integer;
    FCodEAN: String;
    FDescricao: String;
    FIdDepto: Integer;
    FNcm: String;
    FCFop: String;
    FValorIcms: Double;
    FValorIpi: Double;
    FValorPisCofins: Double;
    FValorCusto: Currency;
    FValorVenda: Currency;
    FUnidadeMedida: String;
    FAtivo: Boolean;
    procedure SetIdProduto(const Value: Integer);
    procedure SetCodEAN(const Value: String);
    procedure SetDescricao(const Value: String);
    procedure SetIdDepto(const Value: Integer);
    procedure SetNcm(const Value: String);
    procedure SetCFop(const Value: String);
    procedure SetValorIcms(const Value: Double);
    procedure SetValorIpi(const Value: Double);
    procedure SetValorPisCofins(const Value: Double);
    procedure SetValorCusto(const Value: Currency);
    procedure SetValorVenda(const Value: Currency);
    procedure SetUnidadeMedida(const Value: String);
    procedure SetAtivo(const Value: Boolean);
  public
    property IdProduto: Integer read FIdProduto write SetIdProduto;
    property CodEAN: String read FCodEAN write SetCodEAN;
    property Descricao: String read FDescricao write SetDescricao;
    property IdDepto: Integer read FIdDepto write SetIdDepto;
    property Ncm: String read FNcm write SetNcm;
    property CFop: String read FCFop write SetCFop;
    property ValorIcms: Double read FValorIcms write SetValorIcms;
    property ValorIpi: Double read FValorIpi write SetValorIpi;
    property ValorPisCofins: Double read FValorPisCofins write SetValorPisCofins;
    property ValorCusto: Currency read FValorCusto write SetValorCusto;
    property ValorVenda: Currency read FValorVenda write SetValorVenda;
    property UnidadeMedida: String read FUnidadeMedida write SetUnidadeMedida;
    property Ativo: Boolean read FAtivo write SetAtivo;

    // M�todos para o CRUD
    function GravarProduto: Boolean;
    function ExcluirProduto: Boolean;
    function BuscarProdutoPorEAN: Boolean;
  end;

implementation

{ TProduto }

uses Unit_dmPrincipal, Vcl.Dialogs;

procedure TProduto.SetIdProduto(const Value: Integer);
begin
  FIdProduto := Value;
end;

procedure TProduto.SetCodEAN(const Value: String);
begin
  FCodEAN := Value;
end;

procedure TProduto.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TProduto.SetIdDepto(const Value: Integer);
begin
  FIdDepto := Value;
end;

procedure TProduto.SetNcm(const Value: String);
begin
  FNcm := Value;
end;

procedure TProduto.SetCFop(const Value: String);
begin
  FCFop := Value;
end;

procedure TProduto.SetValorIcms(const Value: Double);
begin
  FValorIcms := Value;
end;

procedure TProduto.SetValorIpi(const Value: Double);
begin
  FValorIpi := Value;
end;

procedure TProduto.SetValorPisCofins(const Value: Double);
begin
  FValorPisCofins := Value;
end;

procedure TProduto.SetValorCusto(const Value: Currency);
begin
  FValorCusto := Value;
end;

procedure TProduto.SetValorVenda(const Value: Currency);
begin
  FValorVenda := Value;
end;

procedure TProduto.SetUnidadeMedida(const Value: String);
begin
  FUnidadeMedida := Value;
end;

procedure TProduto.SetAtivo(const Value: Boolean);
begin
  FAtivo := Value;
end;

function TProduto.GravarProduto: Boolean;
begin
  try
    dmPrincipal.sqlGravarProduto.Params[0].Value := FCodEAN;
    dmPrincipal.sqlGravarProduto.Params[1].Value := FDescricao;
    dmPrincipal.sqlGravarProduto.Params[2].Value := FIdDepto;
    dmPrincipal.sqlGravarProduto.Params[3].Value := FNcm;
    dmPrincipal.sqlGravarProduto.Params[4].Value := FCFop;
    dmPrincipal.sqlGravarProduto.Params[5].Value := FValorIcms;
    dmPrincipal.sqlGravarProduto.Params[6].Value := FValorIpi;
    dmPrincipal.sqlGravarProduto.Params[7].Value := FValorPisCofins;
    dmPrincipal.sqlGravarProduto.Params[8].Value := FValorCusto;
    dmPrincipal.sqlGravarProduto.Params[9].Value := FValorVenda;
    dmPrincipal.sqlGravarProduto.Params[10].Value:= FUnidadeMedida;

    dmPrincipal.sqlGravarProduto.ExecProc;
    Result:= true;
  except on E:Exception do
    begin
      ShowMessage('Ocorreu um erro ao gravar o produto: ' + E.Message);
      Result:= false;
    end;
  end;

end;

function TProduto.ExcluirProduto: Boolean;
begin
  result:= false;
end;

function TProduto.BuscarProdutoPorEAN: Boolean;
begin

end;


end.

