unit Unit_funcoes;

interface

uses
  Vcl.StdCtrls, System.SysUtils;

procedure FormatarValorMonetario(edt: TEdit);
procedure FormatarNumero(edt: TEdit);
procedure FormatarNumeroDecimal(edt: TEdit);
function ConverterValorMonetarioParaFloat(const valor: string): string;

implementation



procedure FormatarValorMonetario(edt: TEdit);
var
  txt, txt2: string;
  x: integer;
begin
  txt := edt.Text;
  txt2 := '';
  for x := 0 to Length(txt) - 1 do
    if (txt.Chars[x] In ['0' .. '9']) then
      txt2 := txt2 + txt.Chars[x];

  txt := txt2;
  edt.Text := FormatFloat('#,##0.00', StrToFloatDef(txt, 0) / 100);
  edt.SelStart := Length(edt.Text);
end;

procedure FormatarNumero(edt: TEdit);
var
  txt, txt2: string;
  x: integer;
begin
  txt := edt.Text;
  txt2 := '';
  for x := 1 to Length(txt) do
    if txt[x] in ['0' .. '9'] then
      txt2 := txt2 + txt[x];
  edt.Text := txt2;
  edt.SelStart := Length(edt.Text);
end;

procedure FormatarNumeroDecimal(edt: TEdit);
var
  txt, txt2: string;
  x: Integer;
  decimalEncontrado: Boolean;
begin
  txt := edt.Text;
  txt2 := '';
  decimalEncontrado := False;
  for x := 1 to Length(txt) do
  begin
    if txt[x] in ['0'..'9'] then
      txt2 := txt2 + txt[x]
    else if (txt[x] in [',', '.']) and not decimalEncontrado then
    begin
      txt2 := txt2 + ',';
      decimalEncontrado := True;
    end;
  end;
  edt.Text := txt2;
  edt.SelStart := Length(edt.Text);
end;

function ConverterValorMonetarioParaFloat(const valor: string): string;
var
  i: Integer;
  resultado: string;
  temDecimal: Boolean;
begin
  resultado := '';
  temDecimal := False;

  for i := 1 to Length(valor) do
  begin
    if valor[i] in ['0'..'9'] then
      resultado := resultado + valor[i]
    else if (valor[i] in [',', '.']) and not temDecimal then
    begin
      resultado := resultado + '.';
      temDecimal := True;
    end;
  end;

  Result := resultado;
end;


end.
