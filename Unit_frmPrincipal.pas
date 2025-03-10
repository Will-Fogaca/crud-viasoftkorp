﻿unit Unit_frmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Vcl.Mask, Vcl.DBCtrls, System.ImageList,
  Vcl.ImgList, Vcl.Imaging.pngimage;

type
  TfrmPrincipal = class(TForm)
    edtCfopEntrada: TLabeledEdit;
    edtCfopSaida: TLabeledEdit;
    edtEstoqueAtual: TLabeledEdit;
    edtNcm: TLabeledEdit;
    edtValorCusto: TLabeledEdit;
    edtValorVenda: TLabeledEdit;
    pnlAcao: TPanel;
    pnlDados: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    edtMargem: TLabeledEdit;
    pnlCabecalho: TPanel;
    Label1: TLabel;
    GroupBox3: TGroupBox;
    edtObservacao: TLabeledEdit;
    edtUnidadeMedida: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    edtCodEan: TLabeledEdit;
    ScrollBox1: TScrollBox;
    btn_excluir: TBitBtn;
    btn_novo: TBitBtn;
    btn_gravar: TBitBtn;
    btn_procurar: TBitBtn;
    ImageList1: TImageList;
    ScrollBox2: TScrollBox;
    cbx_depto: TComboBox;
    Label2: TLabel;
    sbtn_buscar: TSpeedButton;
    procedure edtValorCustoChange(Sender: TObject);
    procedure edtValorVendaChange(Sender: TObject);
    procedure edtCodEanChange(Sender: TObject);
    procedure edtNcmChange(Sender: TObject);
    procedure edtCfopEntradaChange(Sender: TObject);
    procedure edtCfopSaidaChange(Sender: TObject);
    procedure edtEstoqueAtualChange(Sender: TObject);
    procedure edtEstoqueInicialChange(Sender: TObject);
    procedure edtMargemChange(Sender: TObject);
    procedure edtMargemExit(Sender: TObject);
    procedure btn_gravarClick(Sender: TObject);
    procedure sbtn_buscarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure edtCodEanKeyPress(Sender: TObject; var Key: Char);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_procurarClick(Sender: TObject);
  private
    { Private declarations }
    procedure LimparCampos;
  public
    { Public declarations }
    procedure BuscarProdutoCodEan(codEan: string);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses Unit_funcoes, System.SysUtils, Produto, Unit_dmPrincipal,
  Unit_frmBuscaProduto;

procedure TfrmPrincipal.btn_excluirClick(Sender: TObject);
var
  produto: TProduto;
  codEanInt64: Int64;
begin
  try
    if Trim(edtCodEan.Text) = EmptyStr then
    begin
      MessageDlg('Nenhum produto carregado para a exclusão.', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK],0);
      Exit;
    end;

    if MessageDlg('Deseja realmente excluir esse registro?', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
    begin
      produto.CodEAN:= dmPrincipal.cdsCarregarProdutoCOD_EAN.AsString;
      if produto.ExcluirProduto then
      begin
        MessageDlg('Produto excluído com sucesso!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
        LimparCampos
      end
      else
       MessageDlg('Ocorreu um erro ao excluir o produto!', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);

    end;
  except
    on E: Exception do
      ShowMessage('Erro ao excluir o registro: ' + E.Message);
  end;
end;

procedure TfrmPrincipal.btn_gravarClick(Sender: TObject);
var
  Produto: TProduto;
  codEan: int64;
  ncm, cfopEntrada, cfopSaida: integer;
  vlrCusto, vlrVenda, margem, estqAtual: double;
  ncmStr, cfopEntradaStr, cfopSaidaStr: string;
begin
  try
    if not TryStrToInt64(edtCodEan.Text, codEan) then
    begin
      MessageDlg('Código Ean inválido. Verifique os campos.', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
      edtCodEan.SetFocus;
      Exit;
    end;

    if Trim(edtDescricao.Text) = EmptyStr then
    begin
      MessageDlg('A descrição do produto não pode ser vazia. Verifique os campos.', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
      edtDescricao.SetFocus;
      Exit;
    end;

    ncmStr:= Trim(edtNcm.Text);
    cfopEntradaStr:= Trim(edtCfopEntrada.Text);
    cfopSaidaStr:= Trim(edtCfopSaida.Text);

    if ncmStr <> EmptyStr then
    begin
      if (not TryStrToInt(ncmStr, ncm)) or (ncmStr.Length > 8) then
      begin
        MessageDlg('NCM inválido. Verifique os campos.', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
        edtNcm.SetFocus;
        Exit;
      end;
    end;

    if cfopEntradaStr <> EmptyStr then
    begin
      if (not TryStrToInt(cfopEntradaStr, cfopEntrada)) or (cfopEntradaStr.Length <> 4) then
      begin
        MessageDlg('CFOP de entrada inválido. Verifique os campos.', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
        edtNcm.SetFocus;
        Exit;
      end;
    end;

    if cfopSaidaStr <> EmptyStr then
    begin
      if (not TryStrToInt(cfopSaidaStr, cfopSaida)) or (cfopSaidaStr.Length <> 4) then
      begin
        MessageDlg('CFOP de saída inválido. Verifique os campos.', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
        edtNcm.SetFocus;
        Exit;
      end;
    end;

    if Trim(edtEstoqueAtual.Text) <> EmptyStr then
    begin
      if not TryStrToFloat(edtEstoqueAtual.Text, estqAtual) then
      begin
        MessageDlg('Estoque atual é inválido. Verifique os campos.', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
        edtEstoqueAtual.SetFocus;
        Exit;
      end;
    end
    else
      estqAtual:= 0;


    if Trim(edtMargem.Text)  <> EmptyStr then
    begin
      if not TryStrToFloat(edtMargem.Text, margem) then
      begin
        MessageDlg('Margem de lucro inválida. Verifique os campos.', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
        edtMargem.SetFocus;
        Exit;
      end;
    end;

    if Trim(edtValorCusto.Text) <> EmptyStr then
    begin
      if not TryStrToFloat(edtValorCusto.Text, vlrCusto) then
      begin
        MessageDlg('Valor de custo inválido. Verifique os campos.', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
        edtValorCusto.SetFocus;
        Exit;
      end;
    end;

    if not TryStrToFloat(edtValorVenda.Text, vlrVenda) then
    begin
      MessageDlg('Valor de venda inválido. Verifique os campos.', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
      edtValorVenda.SetFocus;
      Exit;
    end;

    Produto := TProduto.Create;
    try
      Produto.CodEAN := IntToStr(codEan);
      Produto.Descricao := edtDescricao.Text;
      Produto.IdDepto := cbx_depto.ItemIndex + 1;
      Produto.Ncm := IntToStr(ncm);
      Produto.CfopEntrada := IntToStr(cfopEntrada);
      Produto.CfopSaida := IntToStr(cfopSaida);
      Produto.ValorCusto := StrToCurrDef(edtValorCusto.Text, 0);
      Produto.ValorVenda := StrToCurrDef(edtValorVenda.Text, 0);
      Produto.UnidadeMedida := edtUnidadeMedida.Text;
      Produto.QtdEstqAtual:= estqAtual;
      Produto.Observacao := edtObservacao.Text;
      Produto.MargemLucro := margem;

      if Produto.GravarProduto then
        MessageDlg('Produto gravado com sucesso!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOk], 0)
      else
        MessageDlg('Ocorreu um erro ao gravar produto', TMsgDlgType.mtError, [TMsgDlgBtn.mbOk], 0);

    finally
      Produto.Free;
    end;

  except on E:Exception do
    ShowMessage('Erro ao gravar produto: ' + E.Message + #13 + '---Classe : ' + E.ClassName);
  end;

end;


procedure TfrmPrincipal.btn_novoClick(Sender: TObject);
begin
  LimparCampos;
end;


procedure TfrmPrincipal.btn_procurarClick(Sender: TObject);
var
  produto: TProduto;
begin
  if produto.ListarProdutos then
  begin
    if not Assigned(frmBuscaProduto) then
      frmBuscaProduto:= TfrmBuscaProduto.Create(Application);

    frmBuscaProduto.ShowModal;
  end;

end;

procedure TfrmPrincipal.BuscarProdutoCodEan(codEan: string);
var
  produto: TProduto;
  codEanInt64: Int64;
  fs: TFormatSettings;
begin
  try
    if not TryStrToInt64(codEan, codEanInt64) then
      Exit;

    fs := FormatSettings;
    fs.DecimalSeparator := '.';

    produto := TProduto.Create;
    try
      if produto.BuscarProdutoPorEAN(codEan) then
      begin
        edtCodEan.Text:= codEan;
        edtDescricao.Text := produto.Descricao;
        cbx_depto.ItemIndex := produto.IdDepto - 1;
        edtEstoqueAtual.Text := StringReplace(FloatToStrF(produto.QtdEstqAtual, ffFixed, 15, 2, fs), '.', ',', [rfReplaceAll]);
        edtNcm.Text := produto.Ncm;

        if produto.CfopEntrada = '0' then
          edtCfopEntrada.Text := ''
        else
          edtCfopEntrada.Text := produto.CfopEntrada;

        if produto.CfopSaida = '0' then
          edtCfopSaida.Text := ''
        else
          edtCfopSaida.Text := produto.CfopSaida;

        edtValorCusto.Text := StringReplace(FloatToStrF(produto.ValorCusto, ffFixed, 15, 2, fs), '.', ',', [rfReplaceAll]);
        edtValorVenda.Text := StringReplace(FloatToStrF(produto.ValorVenda, ffFixed, 15, 2, fs), '.', ',', [rfReplaceAll]);
        edtMargem.Text := StringReplace(FloatToStrF(produto.MargemLucro, ffFixed, 15, 2, fs), '.', ',', [rfReplaceAll]) + '%';
        edtUnidadeMedida.Text := produto.UnidadeMedida;
        edtObservacao.Text := produto.Observacao;
      end
      else
      begin
        MessageDlg('Produto não encontrado.', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
        LimparCampos;
        edtCodEan.SetFocus;
      end;
    finally
      produto.Free;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao buscar produto pelo código EAN: ' + E.Message + #13 + '--Classe: ' + E.ClassName);
  end;
end;

procedure TfrmPrincipal.edtCfopEntradaChange(Sender: TObject);
begin
  FormatarNumero(TEdit(Sender));
end;

procedure TfrmPrincipal.edtCfopSaidaChange(Sender: TObject);
begin
  FormatarNumero(TEdit(Sender));
end;

procedure TfrmPrincipal.edtCodEanChange(Sender: TObject);
begin
  FormatarNumero(TEdit(Sender));
end;

procedure TfrmPrincipal.edtCodEanKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    BuscarProdutoCodEan(edtCodEan.Text);
end;

procedure TfrmPrincipal.edtEstoqueAtualChange(Sender: TObject);
begin
  FormatarNumeroDecimal(TEdit(Sender));
end;

procedure TfrmPrincipal.edtEstoqueInicialChange(Sender: TObject);
begin
  FormatarNumero(TEdit(Sender));
end;

procedure TfrmPrincipal.edtMargemChange(Sender: TObject);
begin
  FormatarNumeroDecimal(TEdit(Sender));
end;

procedure TfrmPrincipal.edtMargemExit(Sender: TObject);
var
  vlrCusto, vlrMargem: Double;
  strCusto, strMargem: String;
  fs: TFormatSettings;
begin
  fs := FormatSettings;
  fs.DecimalSeparator := '.';

  strMargem := StringReplace(edtMargem.Text, '%', '', [rfReplaceAll]);
  strMargem := StringReplace(strMargem, ',', '.', [rfReplaceAll]);
  if not TryStrToFloat(strMargem, vlrMargem, fs) then
    Exit;
  strCusto := StringReplace(edtValorCusto.Text, '.', '', [rfReplaceAll]);
  strCusto := StringReplace(strCusto, ',', '.', [rfReplaceAll]);
  if TryStrToFloat(strCusto, vlrCusto, fs) then
  begin
    edtValorVenda.Text := FloatToStrF(vlrCusto + (vlrCusto * vlrMargem / 100), ffFixed, 15, 2);
  end;
end;


procedure TfrmPrincipal.edtNcmChange(Sender: TObject);
begin
  FormatarNumero(TEdit(Sender));
end;

procedure TfrmPrincipal.edtValorCustoChange(Sender: TObject);
begin
  FormatarValorMonetario(TEdit(Sender));
end;

procedure TfrmPrincipal.edtValorVendaChange(Sender: TObject);
begin
  FormatarValorMonetario(TEdit(Sender));
end;

procedure TfrmPrincipal.LimparCampos;
var
  i: integer;
begin
  for I := 0 to frmPrincipal.ComponentCount - 1 do
  begin
    if frmPrincipal.Components[i] is TLabeledEdit then
       TLabeledEdit(frmPrincipal.Components[I]).Text := '';

    if frmPrincipal.Components[i] is TComboBox then
      TComboBox(frmPrincipal.Components[i]).ItemIndex := 0;
  end;
end;

procedure TfrmPrincipal.sbtn_buscarClick(Sender: TObject);
begin
  BuscarProdutoCodEan(edtCodEan.Text);
end;

end.
