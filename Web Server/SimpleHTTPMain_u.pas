unit SimpleHTTPMain_u; // Added by Br 2018/09/04 12:48:20 PM

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Sockets, StdCtrls;

type
  TForm1 = class(TForm)
    memoOutput: TMemo;
    btnStart: TButton;
    btnStop: TButton;
    btnExit: TButton;
    tcpsrvrServer: TTcpServer;
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure tcpsrvrServerAccept(Sender: TObject;
      ClientSocket: TCustomIpClient);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnExitClick(Sender: TObject);
begin
  btnStopClick(Sender);
  Close;
end;

procedure TForm1.btnStartClick(Sender: TObject);
begin
  tcpsrvrServer.Open;
  memoOutput.Lines.Add(DateTimeToStr(Now) + ': server started');
end;

procedure TForm1.btnStopClick(Sender: TObject);
begin
  tcpsrvrServer.Close;
  memoOutput.Lines.Add(DateTimeToStr(Now) + ': server stopped');
end;

procedure TForm1.tcpsrvrServerAccept(Sender: TObject;
  ClientSocket: TCustomIpClient);
var
  sLine: string;
  Path: string;
  HTTPPos: Integer;
begin
  sLine:= ' ';

  while ClientSocket.Connected and (sLine <> '') do
  begin
    sLine:= ClientSocket.Receiveln();

    memoOutput.Lines.Add(sLine);

    if Copy(sLine,1,3) = 'GET' then
    begin
      HTTPPos:= Pos('HTTP',sLine);

      Path:= Copy(sLine, 5, HTTPPos - 6);

      memoOutput.Lines.Add('Path: ' + Path);
    end;
  end;

  if Path = '/' then
     Path:= 'index.html';

  if FileExists('htdocs/' + Path) then
   with TStringList.Create do
   begin
     LoadFromFile('htdocs/' + Path);
     ClientSocket.Sendln('HTTP/1.0 200 OK');
     ClientSocket.Sendln('');
     ClientSocket.Sendln(Text);
     ClientSocket.Close;

     Free;
     Exit;
   end;

  ClientSocket.Sendln('HTTP/1.0 404 Not Found');
  ClientSocket.Sendln('');
  ClientSocket.Sendln('<h1>404 Not Found</h1><br><br>Path: ' + Path);
  ClientSocket.Close;
end;

end.
