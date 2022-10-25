unit UCaixa;

interface

type
TCaixa = class
private
   FCaixaAberto  : Boolean;
   FSaldoInicial : Double;
   FSaldoFinal   : Double;
    function GetCaixaAberto: Boolean;
    function GetSaldoFInal: Double;
    function GetSaldoInicial: Double;
    procedure SetSaldoFinal(const Value: Double);
    procedure SetValorInicial(const Value: Double);
    procedure SetCaixaAberto(const Value: Boolean);
public
  procedure AbrirCaixa;
  procedure FecharCaixa;
  function RetirarValor(aValorRetirada : Double) : Double;
  function AdicionarValor(aValorAdicionado : Double) : Double;


  property CaixaAberto  : Boolean read GetCaixaAberto  write SetCaixaAberto;
  property SaldoInicial : Double  read GetSaldoInicial write SetValorInicial;
  property SaldoFinal   : Double  read GetSaldoFInal   write SetSaldoFinal;

  constructor Create (const CaixaAberto : Boolean = False;
                      const SaldoInicial: Double  = 0);
end;


implementation

uses
  System.SysUtils;

{ TCaixa }

procedure TCaixa.AbrirCaixa;
begin
  if CaixaAberto then
    raise Exception.Create('Caixa j� est� aberto');

  FCaixaAberto := True;
end;

function TCaixa.AdicionarValor(aValorAdicionado: Double): Double;
begin
  SaldoFinal := (SaldoFinal + aValorAdicionado);
  result     := SaldoFinal;
end;

constructor TCaixa.Create(const CaixaAberto : Boolean = False;
                      const SaldoInicial: Double  = 0);
begin
   FCaixaAberto  := CaixaAberto;
   FSaldoInicial := SaldoInicial;
   FSaldoFinal   := SaldoFinal;
end;

procedure TCaixa.FecharCaixa;
begin
  if not CaixaAberto then
    raise Exception.Create('Caixa j� est� fechado');

  FCaixaAberto := False;
end;


function TCaixa.RetirarValor(aValorRetirada: Double): Double;
begin
  SaldoFinal := SaldoFinal - aValorRetirada;
  result := SaldoFinal;
end;

function TCaixa.GetCaixaAberto: Boolean;
begin
  result := FCaixaAberto;
end;

function TCaixa.GetSaldoFInal: Double;
begin
  result := FSaldoFinal;
end;

function TCaixa.GetSaldoInicial: Double;
begin
  result := FSaldoInicial
end;


procedure TCaixa.SetCaixaAberto(const Value: Boolean);
begin
  FCaixaAberto := Value;
end;

procedure TCaixa.SetSaldoFinal(const Value: Double);
begin
  FSaldoFinal := Value;
end;

procedure TCaixa.SetValorInicial(const Value: Double);
begin
  FSaldoInicial := Value;
end;

end.
