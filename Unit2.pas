unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    Bevel1: TBevel;
    Edit4: TEdit;
    Label7: TLabel;
    Label11: TLabel;
    Edit5: TEdit;
    RadioGroup1: TRadioGroup;
    DateTimePicker1: TDateTimePicker;
    Bevel2: TBevel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click (Sender: TObject);
begin
  close;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  if RadioGroup1.ItemIndex=2 then DateTimePicker1.Enabled:=false else
     DateTimePicker1.Enabled:=true; 
end;

end.
