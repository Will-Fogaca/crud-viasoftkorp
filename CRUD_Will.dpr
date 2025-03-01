program CRUD_Will;

uses
  Vcl.Forms,
  Unit_frmPrincipal in 'Unit_frmPrincipal.pas' {frmPrincipal},
  Unit_dmPrincipal in 'Unit_dmPrincipal.pas' {dmPrincipal: TDataModule},
  Produto in 'Classes\Produto.pas',
  Unit_funcoes in 'Unit_funcoes.pas',
  Unit_frmBuscaProduto in 'Unit_frmBuscaProduto.pas' {frmBuscaProduto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmBuscaProduto, frmBuscaProduto);
  Application.Run;
end.
