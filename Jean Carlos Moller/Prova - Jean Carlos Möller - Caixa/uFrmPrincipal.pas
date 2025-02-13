unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, UCaixa;

type
  TForm1 = class(TForm)
    edt_valor: TEdit;
    rdg_opcoes: TRadioGroup;
    btn_executarOperacao: TButton;
    btn_exibirOperacoes: TButton;
    btn_sairAplicacao: TButton;
    Label1: TLabel;
    mm_apresentacaoInformacoes: TMemo;
    lb_resultados: TLabel;

    procedure edt_valorChange(Sender: TObject);
    procedure btn_executarOperacaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
    FCaixa: TCaixa;

    procedure Inicializando;
    procedure executarOperacoes;
    procedure exibirOperacoes;
    procedure sairOperacao;

    procedure abrirCaixa(const aValor: Double);
    procedure suprimento(const aValor: Double);
    procedure sangria   (const aValor: Double);
    procedure saldoAtual(const aValor: Double);
    procedure fecharCaixa;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn_executarOperacaoClick(Sender: TObject);
begin
  Inicializando;
end;

procedure TForm1.edt_valorChange(Sender: TObject);
begin
  Inicializando;
end;

procedure TForm1.Inicializando;
var
  xOpcoes: Integer;
  xValor: Double;

begin
  try
    xValor := StrToFloat(edt_valor.Text);

    if (edt_valor.Text = '0') then

    begin
      showMessage('Insira um valor v�lido para abrir caixa!');
    end;

    if (edt_valor.Text <> '0') then

      Case (rdg_opcoes.ItemIndex) of
        0: // Abrir caixa
          begin
            abrirCaixa(xValor);
          end;

        1: // Suprimento
          begin
            suprimento(xValor);
          end;

        2: // Sangria
          begin
            sangria(xValor);
          end;

        3: // Saldo atual
          begin
            saldoAtual(xValor);
          end;

        4: // Fechar caixa
          begin
            fecharCaixa;
          end;

      end;
  finally

  end;
end;

procedure TForm1.abrirCaixa (const aValor: Double);
begin
  FCaixa.AbrirCaixa(aValor)
end;

procedure TForm1.fecharCaixa;
begin
  showMessage('Fechar Caixa');
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FCaixa);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   FCaixa := TCaixa.Create();
end;

procedure TForm1.saldoAtual(const aValor: Double);
begin
  showMessage('Saldo Atual');
  FCaixa.SaldoAtual;
  ShowMessage(FCaixa.SaldoAtual.ToString);
end;

procedure TForm1.sangria(const aValor: Double);
begin
  showMessage('Sangria');
  FCaixa.RetirarValor(aValor);
end;

procedure TForm1.suprimento(const aValor: Double);
begin
  showMessage('Suprimento');
  FCaixa.AdicionarValor(aValor);
end;

procedure TForm1.executarOperacoes;
begin

end;

procedure TForm1.exibirOperacoes;
begin

end;

procedure TForm1.sairOperacao;
begin

end;

end.
