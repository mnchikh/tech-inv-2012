object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 409
  Width = 540
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Left = 32
    Top = 24
  end
  object ADOQueryLogin: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 32
    Top = 80
  end
  object DataSourceFilials: TDataSource
    DataSet = ADOQueryFilials
    Left = 40
    Top = 160
  end
  object ADOQueryFilials: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 40
    Top = 208
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 40
    Top = 344
  end
  object DataSourceUsers: TDataSource
    DataSet = ADOQueryUsers
    Left = 120
    Top = 160
  end
  object ADOQueryUsers: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 120
    Top = 208
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 40
    Top = 296
  end
  object ADOQueryTowns: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 200
    Top = 208
  end
  object DataSourceTowns: TDataSource
    DataSet = ADOQueryTowns
    Left = 200
    Top = 160
  end
  object DataSourcePrompl: TDataSource
    DataSet = ADOQueryPrompl
    Left = 288
    Top = 160
  end
  object ADOQueryPrompl: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 288
    Top = 208
  end
end
