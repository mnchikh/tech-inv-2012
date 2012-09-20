unit Towns;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ToolWin, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TTownsForm = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    DBGrid1: TDBGrid;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    procedure ToolButton6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    isSelectForm : boolean;
    sel_town_id  : integer;
    sel_town_name : String;
  end;

var
  TownsForm: TTownsForm;

implementation
Uses Main, Data;

{$R *.dfm}

procedure TTownsForm.DBGrid1DblClick(Sender: TObject);
begin
  if isSelectForm then ModalResult:=mrOk;
end;

procedure TTownsForm.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then ModalResult:=mrOk;
   if key=#27 then ModalResult:=mrCancel;
end;

procedure TTownsForm.Edit1Change(Sender: TObject);
begin
  DM.LocateTown(Edit1.Text);
end;

procedure TTownsForm.FormShow(Sender: TObject);
begin
   ToolButton1.Visible:=Not isSelectForm;
   ToolButton2.Visible:=Not isSelectForm;
   ToolButton3.Visible:=Not isSelectForm;
   ToolButton4.Visible:=isSelectForm;
   ToolButton5.Visible:=isSelectForm;
   ToolButton6.Visible:=Not isSelectForm;
   Edit1.Text:='';
end;

procedure TTownsForm.ToolButton1Click(Sender: TObject);
begin
  DM.AddTown;
end;

procedure TTownsForm.ToolButton2Click(Sender: TObject);
begin
  DM.EditTown;
end;

procedure TTownsForm.ToolButton3Click(Sender: TObject);
begin
  DM.DelTown;
end;

procedure TTownsForm.ToolButton4Click(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TTownsForm.ToolButton5Click(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TTownsForm.ToolButton6Click(Sender: TObject);
begin
  Close;
end;

end.
