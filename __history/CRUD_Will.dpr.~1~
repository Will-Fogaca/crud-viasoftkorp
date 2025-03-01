program CRUD_Will;

uses
  Vcl.Forms,
  Unit_frmPrincipal in 'Unit_frmPrincipal.pas' {frmPrincipal},
  Unit_dmPrincipal in 'Unit_dmPrincipal.pas' {dmPrincipal: TDataModule},
  Produto in 'Classes\Produto.pas',
  Unit_funcoes in 'Unit_funcoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.Run;
end.
