unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.ValEdit, Vcl.ComCtrls, Vcl.CategoryButtons, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.Ribbon, Vcl.RibbonLunaStyleActnCtrls, Vcl.ActnList,
  Vcl.Buttons, Vcl.ImgList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ScreenTips,
  Utils, Variables, Vcl.DBGrids, Vcl.ButtonGroup, Registry, xlsrep;


Type TFormData = Record
      Left, Top, Width, Height : Integer;
     end;

Const MaxGridColumns = 20;
Const CurrentDBGridVer = 3;
Type TGridData = Record
      Ver      : integer;
      ColumnsW : Array[0..MaxGridColumns] of integer;
      ColumnsVis : Array[0..MaxGridColumns] of Boolean;
      ColumnsN : Integer;
     end;

Type TRibbonStatus = Record
      SearchText : String;
      Filtered   : Boolean;
      SearchEnabled, FilterEnabled : Boolean;
      ActiveTab: integer;
     End;

Var RibbonStatus : Array[1..MaxPanels] of TRibbonStatus;

type
  TMainForm = class(TForm)
    Ribbon1: TRibbon;
    RibbonPage1: TRibbonPage;
    RibbonGroup1: TRibbonGroup;
    RibbonPage2: TRibbonPage;
    RibbonPage3: TRibbonPage;
    RibbonGroup2: TRibbonGroup;
    RibbonGroup3: TRibbonGroup;
    RibbonGroup4: TRibbonGroup;
    RibbonGroup5: TRibbonGroup;
    RibbonGroup6: TRibbonGroup;
    RibbonGroup7: TRibbonGroup;
    RibbonPage5: TRibbonPage;
    RibbonGroup12: TRibbonGroup;
    RibbonGroup13: TRibbonGroup;
    ActionManager1: TActionManager;
    Action_db_open: TAction;
    action_db_close: TAction;
    Action_exit: TAction;
    ImageList16: TImageList;
    RibbonGroup14: TRibbonGroup;
    Action4: TAction;
    ScreenTipsManager1: TScreenTipsManager;
    action_admin_showhints: TAction;
    StatusBar1: TStatusBar;
    CategoryPanelGroup1: TCategoryPanelGroup;
    CategoryPanel1: TCategoryPanel;
    CategoryPanel2: TCategoryPanel;
    CategoryPanel3: TCategoryPanel;
    CategoryPanel4: TCategoryPanel;
    CategoryPanel5: TCategoryPanel;
    CategoryImageList1: TImageList;
    CategoryPanel6: TCategoryPanel;
    Panel1: TPanel;
    StaticText1: TStaticText;
    Panel2: TPanel;
    StaticText2: TStaticText;
    Panel3: TPanel;
    StaticText3: TStaticText;
    Panel4: TPanel;
    StaticText4: TStaticText;
    Panel5: TPanel;
    StaticText5: TStaticText;
    Panel6: TPanel;
    StaticText6: TStaticText;
    Action1: TAction;
    RibbonGroup15: TRibbonGroup;
    CategoryPanel7: TCategoryPanel;
    CategoryPanel8: TCategoryPanel;
    CategoryPanel9: TCategoryPanel;
    Panel7: TPanel;
    StaticText7: TStaticText;
    Panel8: TPanel;
    StaticText8: TStaticText;
    Panel9: TPanel;
    StaticText9: TStaticText;
    ImageList32: TImageList;
    Action2: TAction;
    Panel10: TPanel;
    DBGrid1: TDBGrid;
    action_s1: TAction;
    action_s2: TAction;
    action_s3: TAction;
    action_s4: TAction;
    action_s5: TAction;
    action_s6: TAction;
    action_s7: TAction;
    action_s8: TAction;
    action_s9: TAction;
    action_s10: TAction;
    ButtonGroup1: TButtonGroup;
    Action3: TAction;
    Action5: TAction;
    Panel11: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    DBGridPers: TDBGrid;
    SearchEdit: TEdit;
    Action6: TAction;
    Procedure SaveFormParametres(Form : TForm; Reg : TRegistry);
    Function RestoreFormParametres(Form : TForm; Reg : TRegistry;wh : boolean = true) : Boolean;
    Procedure SaveDBGridParam(gr : TDBGrid; reg : TRegistry);
    Function  RestoreDBGridParam(gr : TDBGrid; reg : TRegistry) : Boolean;

    procedure Action_exitExecute(Sender: TObject);
    procedure action_admin_showhintsExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Action_db_openExecute(Sender: TObject);
    procedure action_db_closeExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CategoryPanel1Expand(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure action_s1Execute(Sender: TObject);
    procedure action_s2Execute(Sender: TObject);
    procedure action_s3Execute(Sender: TObject);
    procedure action_s5Execute(Sender: TObject);
    procedure action_s4Execute(Sender: TObject);
    procedure action_s6Execute(Sender: TObject);
    procedure action_s7Execute(Sender: TObject);
    procedure action_s8Execute(Sender: TObject);
    procedure action_s9Execute(Sender: TObject);
    procedure CategoryPanel1Collapse(Sender: TObject);
    procedure DBGridPersDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CheckBox1Click(Sender: TObject);
    procedure SearchEditChange(Sender: TObject);
    procedure Action6Execute(Sender: TObject);
    procedure UpdateFilteredText;
    procedure Action3Execute(Sender: TObject);
    procedure ButtonGroup1Items0Click(Sender: TObject);
    procedure ButtonGroup1Items1Click(Sender: TObject);
    procedure ButtonGroup1Items2Click(Sender: TObject);
    procedure ButtonGroup1Items3Click(Sender: TObject);
  private
    { Private declarations }
  public
  Procedure UpdateStatus;
  Procedure UpdateRibbon;
  Procedure SavePanelRibbon;
  Procedure RestorePanelRibbon;
  Procedure Export2Excel;
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
Uses Data, ADUsers;

{$R *.dfm}

procedure TMainForm.Action1Execute(Sender: TObject);
begin
  DM.ShowSprFilials;
end;

procedure TMainForm.Action2Execute(Sender: TObject);
begin
  DM.ShowUsers;
end;

procedure TMainForm.Action3Execute(Sender: TObject);
begin
   Export2Excel;
end;

procedure TMainForm.Action6Execute(Sender: TObject);
begin
  Action6.Checked:=not Action6.Checked;
  UpdateFilteredText;
  SearchEditChange(Sender);
end;

procedure TMainForm.action_admin_showhintsExecute(Sender: TObject);
begin
  MainForm.ShowHint:=Not MainForm.ShowHint;
  action_admin_showhints.Checked:=MainForm.ShowHint;
end;

procedure TMainForm.action_db_closeExecute(Sender: TObject);
begin
  if DM.pDatabaseIsOpen then DM.CloseDatabase;
  UpdateStatus;
  UpdateRibbon;
end;

procedure TMainForm.Action_db_openExecute(Sender: TObject);
begin
  if not DM.pDatabaseIsOpen then DM.OpenDatabase;
  UpdateStatus;
  UpdateRibbon;
end;

procedure TMainForm.Action_exitExecute(Sender: TObject);
begin
   Close;
end;

procedure TMainForm.action_s1Execute(Sender: TObject);
begin
  DM.ShowTownWindow;
end;

procedure TMainForm.action_s2Execute(Sender: TObject);
begin
  DM.ShowPromplWindow;
end;

procedure TMainForm.action_s3Execute(Sender: TObject);
begin
  DM.ShowBuildWindow;
end;

procedure TMainForm.action_s4Execute(Sender: TObject);
begin
  DM.ShowPlacesWindow;
end;

procedure TMainForm.action_s5Execute(Sender: TObject);
begin
  DM.ShowServWindow;
end;

procedure TMainForm.action_s6Execute(Sender: TObject);
begin
  DM.ShowTypesWindow;
end;

procedure TMainForm.action_s7Execute(Sender: TObject);
begin
  DM.ShowMarkWindow;
end;

procedure TMainForm.action_s8Execute(Sender: TObject);
begin
  DM.ShowVendorWindow;
end;

procedure TMainForm.action_s9Execute(Sender: TObject);
begin
  DM.ShowSupplWindow;
end;

procedure TMainForm.ButtonGroup1Items0Click(Sender: TObject);
begin
   DM.AddPersonal;
end;

procedure TMainForm.ButtonGroup1Items1Click(Sender: TObject);
begin
   DM.EditPersonal;
end;

procedure TMainForm.ButtonGroup1Items2Click(Sender: TObject);
begin
  DM.DelPersonal;
end;

procedure TMainForm.ButtonGroup1Items3Click(Sender: TObject);
begin
  DM.ShowADUsersWindow;
end;

procedure TMainForm.CategoryPanel1Collapse(Sender: TObject);
begin
  case (sender as TCategoryPanel).Tag of
       panUsers: DM.ClosePanelPersonal;
  end;
end;

procedure TMainForm.CategoryPanel1Expand(Sender: TObject);
Var i : integer;
    catpanel : TCategoryPanel;
    DeactivatePanel : Integer;

begin
  SavePanelRibbon;
  DeactivatePanel:=ActivePanel;
  ActivePanel:=(sender as TCategoryPanel).Tag;
    for i := 1 to 9 do begin
      catpanel:=(FindComponent('CategoryPanel'+IntToStr(i)) AS TCategoryPanel);
      if i<>ActivePanel then catpanel.Collapse;
  end;
  (FindComponent('Panel'+IntToStr(DeactivatePanel)) AS TPanel).Visible:=false;
  (FindComponent('Panel'+IntToStr(ActivePanel)) AS TPanel).Align:=alClient;
  (FindComponent('Panel'+IntToStr(ActivePanel)) AS TPanel).Visible:=True;

  case ActivePanel of
       panUsers: DM.OpenPanelPersonal;
  end;
  RestorePanelRibbon;
  SearchEditChange(Sender);
end;

procedure TMainForm.CheckBox1Click(Sender: TObject);
begin
    DM.PanelFilter(ActivePanel);
end;

procedure TMainForm.DBGridPersDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Not VarisNull(DBGridPers.DataSource.DataSet.FieldByName('ad_id').Value)
  then DBGridPers.Canvas.Font.Color:=clBlue;

  if (Not VarisNull(DBGridPers.DataSource.DataSet.FieldByName('isBlocked').Value) and
      DBGridPers.DataSource.DataSet.FieldByName('isBlocked').Value<>0) or
     (Not VarisNull(DBGridPers.DataSource.DataSet.FieldByName('isDisable').Value) and
      DBGridPers.DataSource.DataSet.FieldByName('isDisable').Value<>0)
      then DBGridPers.Canvas.Font.Color:=clRed;

  DBGridPers.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  DBGridPers.Canvas.Font.Style:=[];
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
Var reg : TRegistry;
begin
  SaveWndPos(MainForm);

  reg:=TRegistry.Create;
  With reg Do
  Try
    RootKey:=HKEY_CURRENT_USER;
    if OpenKey(cRegKey,True) then begin
      SaveDBGridParam(MainForm.DBGridPers,reg);
      SaveFormParametres(ADUsersForm,reg);
      SaveDBGridParam(ADUsersForm.DBGrid1,reg);
    end;
  Finally
    Free;
  End;

  DM.CloseDatabase;
end;

procedure TMainForm.FormShow(Sender: TObject);
Var reg : TRegistry;
begin
  GetCurrentResolution;
  action_admin_showhints.Checked:=MainForm.ShowHint;
  SetWndPos(MainForm);
  DM.OpenDatabase;
  UpdateStatus;
  ActivePanel:=panUsers;
  CategoryPanelGroup1.CollapseAll;
  (FindComponent('CategoryPanel'+IntToStr(ActivePanel)) AS TCategoryPanel).Expand;

  With RibbonStatus[panOrgtech] do begin SearchText:=''; Filtered:=False; SearchEnabled:=True; FilterEnabled:=True; ActiveTab:=1; end;
  With RibbonStatus[panUsers] do begin SearchText:=''; Filtered:=False; SearchEnabled:=True; FilterEnabled:=True; ActiveTab:=1; end;
  With RibbonStatus[panProg] do begin SearchText:=''; Filtered:=False; SearchEnabled:=True; FilterEnabled:=True; ActiveTab:=1; end;
  With RibbonStatus[panNetwork] do begin SearchText:=''; Filtered:=False; SearchEnabled:=True; FilterEnabled:=True; ActiveTab:=1; end;
  With RibbonStatus[panSKS] do begin SearchText:=''; Filtered:=False; SearchEnabled:=True; FilterEnabled:=True; ActiveTab:=1; end;
  With RibbonStatus[panPrint] do begin SearchText:=''; Filtered:=False; SearchEnabled:=True; FilterEnabled:=True; ActiveTab:=1; end;
  With RibbonStatus[panTO] do begin SearchText:=''; Filtered:=False; SearchEnabled:=True; FilterEnabled:=True; ActiveTab:=1; end;
  With RibbonStatus[panDoc] do begin SearchText:=''; Filtered:=False; SearchEnabled:=True; FilterEnabled:=True; ActiveTab:=1; end;
  With RibbonStatus[panReport] do begin SearchText:=''; Filtered:=False; SearchEnabled:=True; FilterEnabled:=True; ActiveTab:=1; end;

  reg:=TRegistry.Create;
  With reg Do
  Try
    RootKey:=HKEY_CURRENT_USER;
    if OpenKey(cRegKey,True) then begin
      RestoreDBGridParam(MainForm.DBGridPers,reg);
      RestoreFormParametres(ADUsersForm,reg,True);
      RestoreDBGridParam(ADUsersForm.DBGrid1,reg);
    end;
  Finally
    Free;
  End;

  RestorePanelRibbon;
end;

Procedure TMainForm.UpdateStatus;
Begin
  StatusBar1.Panels[0].Text:=DM.pLoginInfo.LoginName+'/'+DM.pLoginInfo.ServerName;
  StatusBar1.Panels[1].Text:='Res:'+ScreenResolution;
  StatusBar1.Panels[2].Text:=intToStr(DM.pFilialInfo.fil_id)+':'+DM.pFilialInfo.fil_code+':'+DM.pFilialInfo.fil_name;

  //  MainForm.StatusBar1.Panels[0].Text:=ActiveUser.name+'/'+ActiveUser.fio+'/'+roles[ActiveUser.mainRole];
//  if pDatabaseIsOpen then
//  StatusBar1.Panels[1].Text:='�������:'+intToStr(DM.ADOQuery4.RecordCount);
//
end;

Procedure TMainForm.UpdateRibbon;
Begin
  Action_db_open.Enabled:=Not DM.pDatabaseIsOpen;
  Action_db_close.Enabled:=DM.pDatabaseIsOpen;
end;

Procedure TMainForm.RestorePanelRibbon;
Begin
  SearchEdit.Text:=RibbonStatus[ActivePanel].SearchText;
  Action6.Checked:=RibbonStatus[ActivePanel].Filtered;
  SearchEdit.Enabled:=RibbonStatus[ActivePanel].SearchEnabled;
  Action6.Enabled:=RibbonStatus[ActivePanel].FilterEnabled;
  Ribbon1.TabIndex:=RibbonStatus[ActivePanel].ActiveTab;
  UpdateFilteredText;
end;

Procedure TMainForm.SavePanelRibbon;
Begin
  RibbonStatus[ActivePanel].SearchText:=SearchEdit.Text;
  RibbonStatus[ActivePanel].Filtered:=Action6.Checked;
  RibbonStatus[ActivePanel].ActiveTab:=Ribbon1.TabIndex;
end;

Procedure TMainForm.UpdateFilteredText;
Begin
  if Action6.Checked then Action6.Caption:='���������� ��������' else Action6.Caption:='���������� ���������';
End;


Procedure TMainForm.SaveFormParametres(Form : TForm; Reg : TRegistry);
Var FormData : TFormData;
Begin
  FormData.Left:=Form.Left;
  FormData.Top:=Form.Top;
  FormData.Width:=Form.Width;
  FormData.Height:=Form.Height;
  reg.WriteBinaryData(Form.Name,FormData,SizeOf(FormData));
End;

procedure TMainForm.SearchEditChange(Sender: TObject);
begin
   if Action6.Checked
   then DM.PanelFilter(ActivePanel)
   else DM.PanelSearch(SearchEdit.Text,ActivePanel);
end;

Function TMainForm.RestoreFormParametres(Form : TForm; Reg : TRegistry;wh : boolean = true) : Boolean;
Var FormData : TFormData;
Begin
  if reg.ValueExists(Form.Name) then begin
     reg.ReadBinaryData(Form.Name,FormData,SizeOf(FormData));
     Form.Left:=FormData.Left;
     Form.Top:=FormData.Top;
     if wh Then begin
        Form.Width:=FormData.Width;
        Form.Height:=FormData.Height;
     end;
     result:=True;
  end else Result:=False;
End;

Procedure TMainForm.SaveDBGridParam(gr : TDBGrid; reg : TRegistry);
Var GridData : TGridData;
    i : integer;
    grName : String;
Begin
  grName:=gr.Owner.Name+gr.Name;
  GridData.ColumnsN:=gr.Columns.Count;
  GridData.Ver:=CurrentDBGridVer;
  if GridData.ColumnsN>MaxGridColumns Then GridData.ColumnsN:=MaxGridColumns;
  For i:=0 to GridData.ColumnsN-1 do begin
      GridData.ColumnsW[i]:=gr.Columns[i].Width;
  end;
  reg.WriteBinaryData(grName,GridData,SizeOf(GridData));
End;

Function TMainForm.RestoreDBGridParam(gr : TDBGrid; reg : TRegistry) : Boolean;
Var GridData : TGridData;
    i : integer;
    grName : String;
Begin
  result:=False;
  grName:=gr.Owner.Name+gr.Name;
  if reg.ValueExists(grName) then begin
     reg.ReadBinaryData(grName,GridData,SizeOf(GridData));
     if GridData.Ver<>CurrentDBGridVer Then Exit;
     For i:=0 to GridData.ColumnsN-1 do begin
         gr.Columns[i].Width:=GridData.ColumnsW[i];
     end;
     result:=True;
  end else Result:=False;
End;

Procedure TMainForm.Export2Excel;
Begin
  case ActivePanel of
       panUsers: ExcelExp1(DBGridPers,false);
  end;
End;

end.
