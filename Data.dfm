object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 821
  Width = 792
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
    Left = 16
    Top = 736
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
    Left = 16
    Top = 688
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
  object DataSourceBuild: TDataSource
    DataSet = ADOQueryBuild
    Left = 368
    Top = 160
  end
  object ADOQueryBuild: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 368
    Top = 208
  end
  object ADOQueryDynamic: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 104
    Top = 736
  end
  object DataSourceServ: TDataSource
    DataSet = ADOQueryServ
    Left = 448
    Top = 160
  end
  object ADOQueryServ: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 448
    Top = 208
  end
  object DataSourcePlaces: TDataSource
    DataSet = ADOQueryPlaces
    Left = 528
    Top = 160
  end
  object ADOQueryPlaces: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 528
    Top = 208
  end
  object DataSourceTypes: TDataSource
    DataSet = ADOQueryTypes
    Left = 40
    Top = 272
  end
  object ADOQueryTypes: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 40
    Top = 320
  end
  object DataSourceMark: TDataSource
    DataSet = ADOQueryMark
    Left = 120
    Top = 272
  end
  object ADOQueryMark: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 120
    Top = 320
  end
  object DataSourceEnlarge: TDataSource
    DataSet = ADOQueryEnlarge
    Left = 200
    Top = 272
  end
  object ADOQueryEnlarge: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 200
    Top = 320
  end
  object ADOQueryVendor: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 280
    Top = 320
  end
  object DataSourceVendor: TDataSource
    DataSet = ADOQueryVendor
    Left = 280
    Top = 272
  end
  object DataSourceSuppl: TDataSource
    DataSet = ADOQuerySuppl
    Left = 360
    Top = 272
  end
  object ADOQuerySuppl: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 360
    Top = 320
  end
  object DataSourcePers: TDataSource
    DataSet = ADOQueryPers
    Left = 32
    Top = 376
  end
  object ADOQueryPers: TADOQuery
    Connection = ADOConnection1
    OnFilterRecord = ADOQueryPersFilterRecord
    Parameters = <>
    Left = 32
    Top = 424
  end
  object DataSourceADUSers: TDataSource
    DataSet = ADOQueryADUsers
    Left = 120
    Top = 376
  end
  object ADOQueryADUsers: TADOQuery
    Connection = ADOConnection1
    OnFilterRecord = ADOQueryPersFilterRecord
    Parameters = <>
    Left = 120
    Top = 424
  end
end
