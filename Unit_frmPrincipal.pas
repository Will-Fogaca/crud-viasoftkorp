unit Unit_frmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Vcl.Mask, Vcl.DBCtrls, System.ImageList,
  Vcl.ImgList;

type
  TfrmPrincipal = class(TForm)
    edtCfopEntrada: TLabeledEdit;
    edtCfopSaida: TLabeledEdit;
    edtEstoqueAtual: TLabeledEdit;
    edtEstoqueInicial: TLabeledEdit;
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
    edtDepartamento: TLabeledEdit;
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
    procedure btn_novoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btn_novoClick(Sender: TObject);
var
  i: integer;
begin
  for I := 0 to frmPrincipal.ComponentCount - 1 do
  begin
    if frmPrincipal.Components[i] is TLabeledEdit then
       TLabeledEdit(frmPrincipal.Components[I]).Text := '';
  end;

end;

end.
