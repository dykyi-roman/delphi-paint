object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Setting'
  ClientHeight = 369
  ClientWidth = 366
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnClose: TButton
    Left = 272
    Top = 328
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 0
    OnClick = btnCloseClick
  end
  object rg1: TRadioGroup
    Left = 8
    Top = 8
    Width = 350
    Height = 114
    Caption = 'Plain1'
    TabOrder = 1
  end
  object rg2: TRadioGroup
    Left = 8
    Top = 128
    Width = 350
    Height = 118
    Caption = 'Plain2'
    TabOrder = 2
  end
  object btnChange: TButton
    Left = 8
    Top = 328
    Width = 75
    Height = 25
    Caption = 'Change'
    TabOrder = 3
    OnClick = btnChangeClick
  end
  object txt1: TStaticText
    Left = 31
    Top = 151
    Width = 34
    Height = 17
    Caption = 'Speed'
    TabOrder = 4
  end
  object txt4: TStaticText
    Left = 31
    Top = 27
    Width = 34
    Height = 17
    Caption = 'Speed'
    TabOrder = 5
  end
  object seRadius: TSpinEdit
    Left = 82
    Top = 270
    Width = 65
    Height = 22
    MaxValue = 100
    MinValue = 50
    TabOrder = 6
    Value = 50
  end
  object txt7: TStaticText
    Left = 8
    Top = 272
    Width = 68
    Height = 17
    Caption = 'Crash radius:'
    TabOrder = 7
  end
  object trckbrPlan1: TTrackBar
    Left = 80
    Top = 27
    Width = 257
    Height = 33
    Max = 5
    Min = 1
    Position = 2
    SelEnd = 5
    SelStart = 1
    TabOrder = 8
  end
  object trckbrPlan2: TTrackBar
    Left = 80
    Top = 151
    Width = 257
    Height = 33
    Max = 5
    Min = 1
    Position = 2
    SelEnd = 5
    SelStart = 1
    TabOrder = 9
  end
  object chkLine: TCheckBox
    Left = 169
    Top = 272
    Width = 138
    Height = 17
    Caption = 'Show Line'
    Checked = True
    State = cbChecked
    TabOrder = 10
    OnClick = chkLineClick
  end
  object seP1X: TSpinEdit
    Left = 82
    Top = 66
    Width = 41
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 11
    Value = 0
  end
  object seP1Y: TSpinEdit
    Left = 152
    Top = 66
    Width = 41
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 12
    Value = 0
  end
  object seP2X: TSpinEdit
    Left = 80
    Top = 190
    Width = 43
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 13
    Value = 0
  end
  object seP2Y: TSpinEdit
    Left = 152
    Top = 190
    Width = 41
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 14
    Value = 0
  end
  object StaticText1: TStaticText
    Left = 33
    Top = 66
    Width = 43
    Height = 17
    Caption = 'Plane: X'
    TabOrder = 15
  end
  object StaticText2: TStaticText
    Left = 136
    Top = 66
    Width = 10
    Height = 17
    Caption = 'Y'
    TabOrder = 16
  end
  object StaticText4: TStaticText
    Left = 136
    Top = 190
    Width = 10
    Height = 17
    Caption = 'Y'
    TabOrder = 17
  end
  object seFP1Y: TSpinEdit
    Left = 152
    Top = 94
    Width = 41
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 18
    Value = 0
  end
  object seFP1X: TSpinEdit
    Left = 82
    Top = 94
    Width = 41
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 19
    Value = 0
  end
  object StaticText5: TStaticText
    Left = 34
    Top = 94
    Width = 44
    Height = 17
    Caption = 'Finish: X'
    TabOrder = 20
  end
  object StaticText6: TStaticText
    Left = 136
    Top = 94
    Width = 10
    Height = 17
    Caption = 'Y'
    TabOrder = 21
  end
  object StaticText3: TStaticText
    Left = 31
    Top = 190
    Width = 43
    Height = 17
    Caption = 'Plane: X'
    TabOrder = 22
  end
  object StaticText7: TStaticText
    Left = 30
    Top = 218
    Width = 44
    Height = 17
    Caption = 'Finish: X'
    TabOrder = 23
  end
  object seFP2Y: TSpinEdit
    Left = 152
    Top = 218
    Width = 41
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 24
    Value = 0
  end
  object seFP2X: TSpinEdit
    Left = 80
    Top = 218
    Width = 43
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 25
    Value = 0
  end
  object StaticText8: TStaticText
    Left = 136
    Top = 218
    Width = 10
    Height = 17
    Caption = 'Y'
    TabOrder = 26
  end
end
