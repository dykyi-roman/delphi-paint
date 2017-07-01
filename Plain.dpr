program Plain;

uses
  Forms,
  uMain in 'uMain.pas' {Form1},
  uSetting in 'uSetting.pas' {Form2},
  uPlane in 'uPlane.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
