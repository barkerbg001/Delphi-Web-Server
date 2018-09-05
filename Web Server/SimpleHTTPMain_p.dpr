program SimpleHTTPMain_p;

uses
  Forms,
  SimpleHTTPMain_u in 'SimpleHTTPMain_u.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
