program Project2;

uses
  Vcl.Forms,
  UAvalia��o in 'UAvalia��o.pas' {Form2},
  Ucaixa in 'Ucaixa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
