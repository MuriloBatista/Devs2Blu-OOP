unit UCaixa;

interface

type

  TOpcoes = (stAbrirCaixa, stSuprimento, stSangria, stSaldoAtual,
    stFecharCaixa);

  TCaixa = class
  private
    FSaldoInicial: Double;
    FSaldoAtual: Double;
    FCaixaAberto: Boolean;

  public
    function AbrirCaixa(aValor: String): String;
    function RetirarValor(aValor: String): String;
    function AdicionarValor(aValor: String): String;
    function SaldoAtual: String;
    function FecharCaixa: String;

  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ TCaixa }

function TCaixa.AbrirCaixa(aValor: String): String;

begin
  if FCaixaAberto = True then
  begin
    raise Exception.Create('O Caixa j� est� Aberto.');
  end;

  if not TryStrToFloat(aValor, FSaldoAtual) then
  begin
    raise Exception.Create('Informe um Valor V�lido para abrir o Caixa.');
  end;

  FCaixaAberto := True;

  Result := 'O caixa foi aberto com o valor de R$:' +
    FormatFloat('0.00', FSaldoAtual);

end;

function TCaixa.AdicionarValor(aValor: String): String;
var
  xValor: Double;
begin
  if FCaixaAberto = False then
  begin
    raise Exception.Create('O Caixa n�o foi Aberto.');
  end;

  if not TryStrToFloat(aValor, xValor) then
  begin
    raise Exception.Create('Informe um valor v�lido.');
  end;

  FSaldoAtual := FSaldoAtual + xValor;
  Result := 'Foi adicionado ao Caixa: R$' + FormatFloat('0.00', xValor);
end;

function TCaixa.RetirarValor(aValor: String): String;
var
  xValor: Double;
begin
  if FCaixaAberto = False then
  begin
    raise Exception.Create('O Caixa n�o foi Aberto.');
  end;

  if not TryStrToFloat(aValor, xValor) then
  begin
    raise Exception.Create('Informe um valor v�lido para Retirada.');
  end;

  FSaldoAtual := FSaldoAtual - xValor;
  Result := 'Foi Retirado do Caixa: R$' + FormatFloat('0.00', xValor);
end;

function TCaixa.SaldoAtual: String;
begin
  if FCaixaAberto = False then
  begin
    raise Exception.Create('O Caixa n�o foi Aberto.');
  end;

  Result := 'O Saldo atual � de R$' + FormatFloat('0.00', FSaldoAtual);
end;

function TCaixa.FecharCaixa: String;
begin
  if FCaixaAberto = False then
  begin
    raise Exception.Create('O Caixa n�o est� Aberto.');
  end;

  Result := 'O Valor final do caixa � de: R$' + FormatFloat('0.00',
    FSaldoAtual);

    FCaixaAberto := False;
end;

end.
