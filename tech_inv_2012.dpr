program tech_inv_2012;

uses
  Vcl.Forms,
  Main in 'Main.pas' {MainForm},
  Data in 'Data.pas' {DM: TDataModule},
  untAdoLoginDlg in 'ADOLogin\untAdoLoginDlg.pas',
  untStrHex in 'ADOLogin\untStrHex.pas',
  ActiveDs_TLB in 'ADOLogin\ActiveDs_TLB.pas',
  Variables in 'Variables.pas',
  queryes in 'queryes.pas',
  Utils in 'Utils.pas',
  Filials in 'Filials.pas' {FilialsForm},
  Users in 'Users.pas' {UsersForm},
  SysUsers in 'SysUsers.pas' {SysUsersForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFilialsForm, FilialsForm);
  Application.CreateForm(TUsersForm, UsersForm);
  Application.CreateForm(TSysUsersForm, SysUsersForm);
  Application.Run;
end.
