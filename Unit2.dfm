object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 291
  ClientWidth = 249
  Color = 14733246
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 19
    Width = 59
    Height = 13
    Caption = #1061#1086#1089#1090' '#1087#1080#1085#1075#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 25
    Top = 70
    Width = 145
    Height = 13
    Caption = #1055#1072#1091#1079#1072' '#1084#1077#1078#1076#1091' '#1086#1087#1088#1086#1089#1072#1084#1080', '#1084#1080#1085':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 25
    Top = 97
    Width = 67
    Height = 13
    Caption = #1061#1086#1089#1090' '#1084#1086#1076#1077#1084#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 24
    Top = 46
    Width = 91
    Height = 13
    Caption = #1040#1083#1100#1090'. '#1093#1086#1089#1090' '#1087#1080#1085#1075#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 24
    Top = 126
    Width = 140
    Height = 13
    Hint = #1042#1088#1077#1084#1103' '#1074#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1072' '#1080#1079' '#1088#1077#1078#1080#1084#1072' '#1089#1085#1072
    Caption = #1042#1088#1077#1084#1103' '#1074#1086#1089#1089#1090#1072#1085'. '#1086#1090' '#1089#1085#1072', '#1089#1077#1082':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 233
    Height = 153
  end
  object Bevel2: TBevel
    Left = 8
    Top = 167
    Width = 233
    Height = 90
  end
  object Edit1: TEdit
    Left = 89
    Top = 16
    Width = 136
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = 'mail.ru'
  end
  object Edit2: TEdit
    Left = 176
    Top = 70
    Width = 49
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = '5'
  end
  object Edit3: TEdit
    Left = 98
    Top = 97
    Width = 127
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = '192.168.1.1'
  end
  object Edit4: TEdit
    Left = 121
    Top = 43
    Width = 104
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 'mail.kz'
  end
  object Edit5: TEdit
    Left = 189
    Top = 124
    Width = 36
    Height = 21
    Hint = #1042#1088#1077#1084#1103' '#1074#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1072' '#1080#1079' '#1088#1077#1078#1080#1084#1072' '#1089#1085#1072
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Text = '30'
  end
  object Button1: TButton
    Left = 71
    Top = 263
    Width = 107
    Height = 21
    Cancel = True
    Caption = #1054#1050
    TabOrder = 5
    OnClick = Button1Click
  end
  object RadioGroup1: TRadioGroup
    Left = 24
    Top = 175
    Width = 201
    Height = 66
    Caption = #1055#1077#1088#1077#1079#1072#1075#1088#1091#1079#1082#1072' '#1087#1086' '#1090#1072#1081#1084#1077#1088#1091
    ItemIndex = 2
    Items.Strings = (
      #1087#1086#1089#1090#1086#1103#1085#1085#1086
      #1086#1076#1085#1086#1082#1088#1072#1090#1085#1086
      #1085#1080#1082#1086#1075#1076#1072)
    TabOrder = 6
  end
  object DateTimePicker1: TDateTimePicker
    Left = 137
    Top = 207
    Width = 67
    Height = 21
    Date = 40167.042361111110000000
    Format = 'HH:mm'
    Time = 40167.042361111110000000
    Kind = dtkTime
    TabOrder = 7
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 104
    Top = 144
  end
end
