unit Data;

interface

uses
  System.SysUtils, System.Classes, System.UITypes, untAdoLoginDlg, Data.DB, Data.Win.ADODB, Variants, Variables, Queryes, Dialogs,
  VCL.controls, Vcl.StdCtrls;

Type TLoginInfo = Record
        LoginName  : String;
        HostName   : String;
        ServerName : String;
        DBName     : String;

        mainRole  : integer;
        uid        : integer;
        fio        : string;
        access     : string;
     end;

Type TFilialInfo = Record
        fil_id  : integer;
        fil_code: String;
        fil_name: String;
     end;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQueryLogin: TADOQuery;
    DataSourceFilials: TDataSource;
    ADOQueryFilials: TADOQuery;
    ADOQuery1: TADOQuery;
    DataSourceUsers: TDataSource;
    ADOQueryUsers: TADOQuery;
    DataSource1: TDataSource;
    ADOQueryTowns: TADOQuery;
    DataSourceTowns: TDataSource;
    DataSourcePrompl: TDataSource;
    ADOQueryPrompl: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    pDatabaseIsOpen : Boolean;
    pLoginInfo      : TLoginInfo;
    pFilialInfo     : TFilialInfo;

    Procedure OpenDatabase;
    Procedure CloseDatabase;
    Procedure GetLoginInfo;
    Procedure GetFilialInfo;
    Procedure GetUserRights;

    //��������� ������������� ���������
    Procedure ShowUsers;
    Procedure GrantUserRights;
    Procedure RevokeUserRights;
    procedure UsersListAfterScroll(DataSet: TDataSet);
    procedure UsersListBeforeScroll(DataSet: TDataSet);
    Function AccessIsGranted(acs_id : integer) : boolean;

    // ��������� ������ �� ������������ ��������
    Procedure ShowSprFilials;

    // ��������� ������ �� ������������ ���������� �������
    Procedure ShowTownWindow;
    Function  SelectTown : integer;
    Procedure AddTown;
    Procedure EditTown;
    Procedure DelTown;
    Procedure LocateTown(town_name : String);

    // ��������� ������ �� ������������ �����������
    Procedure ShowPromplWindow;
    Procedure AddPrompl;
    Procedure EditPrompl;
    Procedure DelPrompl;
    Procedure LocatePrompl(Prompl_name : String);

 end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses Main, Filials, Users, SysUsers, towns, Edit1Field, prompl, EditPrompl;

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  pDatabaseIsOpen:=False;
end;

Procedure TDM.OpenDatabase;
Begin
  if Not LoginADODataBase(ADOConnection1,FDBConfigFileName,FUserConfigFileName) Then exit;
  ADOConnection1.Open;
  pDatabaseIsOpen:=True;
  GetLoginInfo;
  GetFilialInfo;
  GetUserRights;
End;

Procedure TDM.CloseDatabase;
Begin
  ADOConnection1.Close;
  pDatabaseIsOpen:=False;
  With pLoginInfo do begin
       LoginName  :='-';
       HostName   :='-';
       ServerName :='-';
       DBName     :='-';
  end;
End;

Procedure TDM.GetLoginInfo;
Begin
  With pLoginInfo do begin
       LoginName  :='-';
       HostName   :='-';
       ServerName :='-';
       DBName     :='-';
  end;
  if Not pDataBaseIsOpen Then Exit;
  ADOQueryLogin.SQL.Clear;
  ADOQueryLogin.SQL.Add(sql_GetLoginInfo);
  ADOQueryLogin.Open;
  if Not ADOQueryLogin.IsEmpty Then
    With pLoginInfo do begin
         if ADOQueryLogin['UserName']<>NULL Then LoginName:=ADOQueryLogin['UserName'];
         if ADOQueryLogin['ServerName']<>NULL Then HostName:=ADOQueryLogin['ServerName'];
         if ADOQueryLogin['HostName']<>NULL Then ServerName:=ADOQueryLogin['HostName'];
         if ADOQueryLogin['DBName']<>NULL Then DBName:=ADOQueryLogin['DBName'];
    end;
  ADOQueryLogin.Close;
End;

Procedure TDM.GetFilialInfo;
Begin
  With pFilialInfo do begin
       fil_id  :=-1;
       fil_Name:='-';
       fil_code:='-';
  end;
  if Not pDataBaseIsOpen Then Exit;
  ADOQueryLogin.SQL.Clear;
  ADOQueryLogin.SQL.Add(sql_GetFilialInfo);
  ADOQueryLogin.Open;
  if Not ADOQueryLogin.IsEmpty Then
    With pFilialInfo do begin
         if ADOQueryLogin['fil_id']<>NULL Then fil_id:=ADOQueryLogin['fil_id'];
         if ADOQueryLogin['fil_code']<>NULL Then fil_code:=ADOQueryLogin['fil_code'];
         if ADOQueryLogin['fil_name']<>NULL Then fil_name:=ADOQueryLogin['fil_name'];
    end;
  ADOQueryLogin.Close;
End;

Procedure TDM.GetUserRights;
Begin
  if Not pDataBaseIsOpen Then Exit;
  ADOQuery1.SQL.Clear;
  ADOQuery1.Parameters.Clear;
  ADOQuery1.SQL.Add(sql_getrights);
  ADOQuery1.Prepared:=True;
  ADOQuery1.Parameters.ParamByName('uname').Value:=pLoginInfo.LoginName;
  ADOQuery1.Open;
  if Not ADOQuery1.IsEmpty Then
  With pLoginInfo do begin
       uid:=ADOQuery1['uid'];
       if ADOQuery1['status']<>NULL Then mainRole:=ADOQuery1['status'] else mainRole:=role_none;
       if ADOQuery1['fio']<>NULL Then fio:=ADOQuery1['fio'] else fio:='';
       if ADOQuery1['access']<>NULL Then access:=ADOQuery1['access'] else access:='';
       if UPPERCASE(pLoginInfo.LoginName)='SA' Then mainRole:=role_admin;
  end;
  ADOQuery1.Close;
End;


Procedure TDM.ShowSprFilials;
Begin
  if pLoginInfo.mainRole<>role_Admin then begin
     MessageDlg(msg_noAdminRights,mtInformation,[mbOk],0);
     exit;
  end;

  if Not pDataBaseIsOpen Then Exit;
  ADOQueryFilials.SQL.Clear;
  ADOQueryFilials.SQL.Add(sql_GetFilials);
  ADOQueryFilials.Open;

  FilialsForm.DBGrid1.DataSource:=DataSourceFilials;
  FilialsForm.ShowModal;
  FilialsForm.DBGrid1.DataSource:=nil;

  ADOQueryFilials.Close;
End;

Procedure TDM.GrantUserRights;
var uid : integer;
Begin
  if pLoginInfo.mainRole<>role_Admin then begin
     MessageDlg(msg_noAdminRights,mtInformation,[mbOk],0);
     exit;
  end;

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add(sql_sysusers);
  ADOQuery1.Open;
  with SysUsersForm do begin
     DBGrid1.DataSource:=DM.DataSource1;
     if (ShowModal=mrOk) and (Not ADOQuery1.IsEmpty) Then Begin
          uid:=ADOQuery1['uid'];
          ADOQueryUsers.Append;
          ADOQueryUsers['uname']:=ADOQuery1['loginname'];
          ADOQueryUsers['uid']:=uid;
          ADOQueryUsers.Post;
          ADOQueryUsers.Requery;
          ADOQueryUsers.Locate('uid',uid,[]);
     end;
     DBGrid1.DataSource:=nil;
  end;
  ADOQuery1.Close;
end;

Procedure TDM.RevokeUserRights;
Begin
  if pLoginInfo.mainRole<>role_Admin then begin
     MessageDlg(msg_noAdminRights,mtInformation,[mbOk],0);
     exit;
  end;

  if Not ADOQueryUsers.IsEmpty then
  if MessageDlg('������� ������?',mtConfirmation,[mbYes, mbNo],0)=mrYes
  then ADOQueryUsers.Delete;
end;


Procedure TDM.ShowUsers;
Begin
  if pLoginInfo.mainRole<>role_Admin then begin
     MessageDlg(msg_noAdminRights,mtInformation,[mbOk],0);
     exit;
  end;

  if Not pDataBaseIsOpen Then Exit;

  ADOQueryUsers.SQL.Clear;
  ADOQueryUsers.SQL.Add(sql_GetUsers);
  ADOQueryUsers.Open;
  ADOQueryUsers.AfterScroll:=UsersListAfterScroll;
  ADOQueryUsers.BeforeScroll:=UsersListBeforeScroll;

  UsersListAfterScroll(ADOQueryUsers);
  With UsersForm do begin
    DBGrid1.DataSource:=DataSourceUsers;
    DBEdit1.DataSource:=DataSourceUsers;
    st_changed:=false;
    ShowModal;
    DBGrid1.DataSource:=nil;
    DBEdit1.DataSource:=nil;
  end;
  UsersListBeforeScroll(ADOQueryUsers);

  ADOQueryUsers.AfterScroll:=nil;
  ADOQueryUsers.BeforeScroll:=nil;
  ADOQueryUsers.Close;
End;

procedure TDM.UsersListAfterScroll(DataSet: TDataSet);
Var access : String;
    i      : integer;
begin
With UsersForm do begin
  if ADOQueryUsers['status']<>Null then ComboBox1.ItemIndex:=ADOQueryUsers['status'] else ComboBox1.ItemIndex:=0;
  if ADOQueryUsers['access']<>Null then access:=ADOQueryUsers['access'] else access:='';
  if ADOQueryUsers['otv_id']<>Null then otv_id:=ADOQueryUsers['otv_id'] else otv_id:=-1;

  for i:=1 to MaxRightCheckBox do
      CheckListBox1.Checked[i-1]:=(access[i]='1');
end;
end;

procedure TDM.UsersListBeforeScroll(DataSet: TDataSet);
Var access   : string;
    i        : integer;
begin
With UsersForm do
  if st_changed Then begin
     access:='';

     for i:=1 to MaxRightCheckBox do
         if (CheckListBox1.Checked[i-1]) then access:=access+'1' else access:=access+'0';

     ADOQueryUsers.Edit;
     if otv_id>=0 then ADOQueryUsers['otv_id']:=otv_id else ADOQueryUsers['otv_id']:=NULL;
     ADOQueryUsers['status']:=ComboBox1.ItemIndex;
     ADOQueryUsers['access']:=access;
     ADOQueryUsers.Post;

     st_changed:=false;
     if ADOQueryUsers['uid']=pLoginInfo.uid Then Begin
         pLoginInfo.access:=access;
     End
  end;
end;

Function TDM.AccessIsGranted(acs_id : integer) : boolean;
begin
  if ((pLoginInfo.mainRole<>role_Admin) and (pLoginInfo.mainRole<>role_User))
  then result:=false
  else result:=(pLoginInfo.access[acs_id]='1');
end;

Procedure TDM.ShowTownWindow;
Begin
  if Not pDataBaseIsOpen Then Exit;

  ADOQueryTowns.SQL.Clear;
  ADOQueryTowns.SQL.Add(sql_GetTowns);
  ADOQueryTowns.Open;

  With TownsForm Do begin
      isSelectForm:=False;
      DBGrid1.DataSource:=DataSourceTowns;
      ShowModal;
      DBGrid1.DataSource:=nil;
  End;
  ADOQueryTowns.Close;
End;

Function TDM.SelectTown : integer;
var mr : integer;
Begin
  mr:=mrCancel;
  if Not pDataBaseIsOpen Then Exit;

  ADOQueryTowns.SQL.Clear;
  ADOQueryTowns.SQL.Add(sql_GetTowns);
  ADOQueryTowns.Open;

  With TownsForm Do begin
      isSelectForm:=true;
      sel_town_id:=-1;
      sel_town_name:='';
      DBGrid1.DataSource:=DataSourceTowns;
      mr:=ShowModal;
      if  ModalResult=mrOk then Begin
         sel_town_id:=ADOQueryTowns['town_id'];
         sel_town_name:=ADOQueryTowns['town_name'];
      end;
      DBGrid1.DataSource:=nil;
  End;
  ADOQueryTowns.Close;
  result:=mr;
End;


Procedure TDM.AddTown;
Begin
  if not AccessIsGranted(acs_spr_town) then begin
     MessageDlg(msg_noRights,mtInformation,[mbOk],0);
     exit;
  end;

  with Edit1FieldForm do begin
     Caption:='�������� ���������� �����';
     Label1.Caption:='�������� ����������� ������:';
     Edit1.Text:='';
     if (ShowModal=mrOk) Then Begin
          ADOQueryTowns.Append;
          ADOQueryTowns['town_name']:=Edit1.Text;
          ADOQueryTowns.Post;
     end;
  end;
End;

Procedure TDM.EditTown;
Begin
  if not AccessIsGranted(acs_spr_town) then begin
     MessageDlg(msg_noRights,mtInformation,[mbOk],0);
     exit;
  end;

  with Edit1FieldForm do begin
     Caption:='�������� ���������� �����';
     Label1.Caption:='�������� ����������� ������:';
     Edit1.Text:=ADOQueryTowns['town_name'];
     if (ShowModal=mrOk) Then Begin
          ADOQueryTowns.Edit;
          ADOQueryTowns['town_name']:=Edit1.Text;
          ADOQueryTowns.Post;
     end;
  end;
End;

Procedure TDM.DelTown;
Begin
  if not AccessIsGranted(acs_spr_town) then begin
     MessageDlg(msg_noRights,mtInformation,[mbOk],0);
     exit;
  end;

  if Not ADOQueryTowns.Eof Then
  if MessageDlg('������� ������?',mtConfirmation,[mbYes, mbNo],0)=mrYes
  then begin
     ADOQueryTowns.Delete;
  end;
End;

Procedure TDM.LocateTown(town_name : String);
Begin
  ADOQueryTowns.Locate('town_name','%'+town_name,[loCaseInsensitive, loPartialKey]);
End;

Procedure TDM.ShowPromplWindow;
Begin
  if Not pDataBaseIsOpen Then Exit;

  ADOQueryPrompl.SQL.Clear;
  ADOQueryPrompl.SQL.Add(sql_GetPrompl);
  ADOQueryPrompl.Open;

  With PromplForm Do begin
      isSelectForm:=False;
      DBGrid1.DataSource:=DataSourcePrompl;
      ShowModal;
      DBGrid1.DataSource:=nil;
  End;
  ADOQueryPrompl.Close;
End;

Procedure TDM.AddPrompl;
Begin
  if not AccessIsGranted(acs_spr_prompl) then begin
     MessageDlg(msg_noRights,mtInformation,[mbOk],0);
     exit;
  end;

  with EditPromplForm do begin
     Caption:='�������� ������������';
     Edit1.Text:='';
     Edit2.Text:='';
     town_id:=-1;
     if (ShowModal=mrOk) Then Begin
          ADOQueryPrompl.Append;
          ADOQueryPrompl['prompl_name']:=Edit1.Text;
          ADOQueryPrompl['town_id']:=town_id;
          ADOQueryPrompl.Post;
     end;
  end;
End;

Procedure TDM.EditPrompl;
Var prompl_id : integer;
Begin
  if not AccessIsGranted(acs_spr_prompl) then begin
     MessageDlg(msg_noRights,mtInformation,[mbOk],0);
     exit;
  end;

  with EditPromplForm do begin
     Caption:='�������� ������������';
     Edit1.Text:=ADOQueryPrompl['prompl_name'];
     Edit2.Text:=ADOQueryPrompl['town_name'];
     town_id:=ADOQueryPrompl['town_id'];
     prompl_id:=ADOQueryPrompl['prompl_id'];
     if (ShowModal=mrOk) Then Begin
          ADOQueryPrompl.Edit;
          ADOQueryPrompl['prompl_name']:=Edit1.Text;
          ADOQueryPrompl['town_id']:=town_id;
          ADOQueryPrompl.Post;
          ADOQueryPrompl.Requery();
          ADOQueryPrompl.Locate('prompl_id',prompl_id,[]);
     end;
  end;
End;

Procedure TDM.DelPrompl;
Begin
  if not AccessIsGranted(acs_spr_prompl) then begin
     MessageDlg(msg_noRights,mtInformation,[mbOk],0);
     exit;
  end;

  if Not ADOQueryPrompl.Eof Then
  if MessageDlg('������� ������?',mtConfirmation,[mbYes, mbNo],0)=mrYes
  then begin
     ADOQueryPrompl.Delete;
  end;
End;

Procedure TDM.LocatePrompl(prompl_name : String);
Begin
  ADOQueryPrompl.Locate('prompl_name','%'+prompl_name,[loCaseInsensitive, loPartialKey]);
End;



end.

