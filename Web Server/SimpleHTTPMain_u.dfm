object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object memoOutput: TMemo
    Left = 0
    Top = 0
    Width = 447
    Height = 161
    Align = alTop
    Lines.Strings = (
      '--LOG--')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object btnStart: TButton
    Left = 8
    Top = 167
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 1
    OnClick = btnStartClick
  end
  object btnStop: TButton
    Left = 120
    Top = 167
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 2
    OnClick = btnStopClick
  end
  object btnExit: TButton
    Left = 364
    Top = 167
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 3
    OnClick = btnExitClick
  end
  object tcpsrvrServer: TTcpServer
    LocalHost = 'localhost'
    LocalPort = '7777'
    OnAccept = tcpsrvrServerAccept
    Left = 344
    Top = 40
  end
end
