object UsersForm: TUsersForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
  ClientHeight = 315
  ClientWidth = 829
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 315
    Align = alLeft
    TabOrder = 0
    ExplicitLeft = 432
    ExplicitTop = 176
    ExplicitHeight = 41
    object ToolBar1: TToolBar
      Left = 1
      Top = 1
      Width = 183
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 57
      Caption = 'ToolBar1'
      HotImages = MainForm.ImageList16
      Images = MainForm.ImageList16
      ShowCaptions = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        ImageIndex = 5
        OnClick = ToolButton1Click
      end
      object ToolButton2: TToolButton
        Left = 57
        Top = 0
        Caption = #1059#1076#1072#1083#1080#1090#1100
        ImageIndex = 6
        OnClick = ToolButton2Click
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 37
      Width = 183
      Height = 277
      Align = alClient
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'uname'
          Title.Alignment = taCenter
          Title.Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
          Width = 171
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 185
    Top = 0
    Width = 644
    Height = 315
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 504
    ExplicitTop = 184
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 145
      Height = 13
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' (MSSQL User):'
    end
    object Label2: TLabel
      Left = 177
      Top = 24
      Width = 85
      Height = 13
      Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081':'
    end
    object SpeedButton1: TSpeedButton
      Left = 376
      Top = 36
      Width = 23
      Height = 22
      Caption = '...'
    end
    object GroupBox1: TGroupBox
      Left = 5
      Top = 64
      Width = 587
      Height = 217
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1088#1072#1074' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      TabOrder = 0
      object Label3: TLabel
        Left = 10
        Top = 37
        Width = 80
        Height = 13
        Caption = #1054#1089#1085#1086#1074#1085#1072#1103' '#1088#1086#1083#1100':'
      end
      object ComboBox1: TComboBox
        Left = 96
        Top = 29
        Width = 169
        Height = 21
        TabOrder = 0
        OnSelect = ComboBox1Select
        Items.Strings = (
          #1053#1077#1090' '#1088#1086#1083#1080
          #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088
          #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
          #1043#1086#1089#1090#1100)
      end
      object CheckBox1: TCheckBox
        Left = 10
        Top = 72
        Width = 97
        Height = 17
        Caption = 'CheckBox1'
        TabOrder = 1
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 10
        Top = 87
        Width = 97
        Height = 17
        Caption = 'CheckBox1'
        TabOrder = 2
        OnClick = CheckBox1Click
      end
      object CheckBox3: TCheckBox
        Left = 10
        Top = 110
        Width = 97
        Height = 18
        Caption = 'CheckBox1'
        TabOrder = 3
        OnClick = CheckBox1Click
      end
      object CheckBox4: TCheckBox
        Left = 10
        Top = 128
        Width = 97
        Height = 17
        Caption = 'CheckBox1'
        TabOrder = 4
        OnClick = CheckBox1Click
      end
    end
    object Edit1: TEdit
      Left = 177
      Top = 37
      Width = 200
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 37
      Width = 145
      Height = 21
      Color = clBtnFace
      DataField = 'uname'
      ReadOnly = True
      TabOrder = 2
    end
  end
end
