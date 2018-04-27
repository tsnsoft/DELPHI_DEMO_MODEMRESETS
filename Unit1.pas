unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,  IdRawClient, IdIcmpClient, jpeg, SHDocVw,
  OleCtrls, IdBaseComponent, IdComponent, IdRawBase, ImgList, inifiles, Menus,
  DateUtils;

type
  TForm1 = class(TForm)
    Button1: TButton;
    WebBrowser1: TWebBrowser;
    Button2: TButton;
    IdIcmpClient1: TIdIcmpClient;
    Timer1: TTimer;
    Label3: TLabel;
    Button3: TButton;
    Timer2: TTimer;
    Label5: TLabel;
    Bevel1: TBevel;
    Image1: TImage;
    Label6: TLabel;
    TrayIcon1: TTrayIcon;
    Button4: TButton;
    Timer3: TTimer;
    CheckBox1: TCheckBox;
    Bevel2: TBevel;
    Timer4: TTimer;
    Label8: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Label9: TLabel;
    Label10: TLabel;
    N5: TMenuItem;
    Timer5: TTimer;
    Button5: TButton;
    Timer6: TTimer;
    Label1: TLabel;
    Timer7: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure WebBrowser1NavigateError(ASender: TObject; const pDisp: IDispatch;
      var URL, Frame, StatusCode: OleVariant; var Cancel: WordBool);
    procedure Timer2Timer(Sender: TObject);
    procedure ResetModem;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Timer6Timer(Sender: TObject);
    procedure Timer7Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const setini='setting.ini';

const dd=1000*60; dd3=dd*5;  d3='5'; xts=30;
var
  Form1: TForm1;
  dt: tdatetime;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.FormActivate(Sender: TObject);
{ Загрузка настроек из файла }
var t: tinifile;
begin
   try
     t:=TIniFile.Create(ExtractFilePath(application.exename)+setini);
     form2.edit1.Text:=t.ReadString('MAIN','host1',form2.edit1.Text);
     form2.edit4.Text:=t.ReadString('MAIN','host2',form2.edit4.Text);
     form2.edit2.Text:=t.ReadString('MAIN','Interval',form2.edit2.Text);
     form2.edit3.Text:=t.ReadString('MAIN','IP_Modem',form2.edit3.Text);
     form2.edit5.Text:=t.ReadString('MAIN','TS',form2.edit5.Text);
     CheckBox1.Checked:=t.ReadBool('MAIN','Tray',CheckBox1.Checked);

     form2.RadioGroup1.ItemIndex:=t.ReadInteger('MAIN','RG1',
       form2.RadioGroup1.ItemIndex);
     form2.DateTimePicker1.Time:=t.ReadTime('MAIN','Time_RST',
       form2.DateTimePicker1.Time);


   finally
     t.Free;
   end;

     if CheckBox1.Checked=true then timer3.Enabled:=true;


  button1.Click;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
{ Сохранение настроек в файл }
var t: tinifile;
begin

  if messagedlg('Внимание!'+#$0a+#$0d+
     'При закрытии программы роутер не будет контролироваться!'+#$0a+#$0d+
     'Это может привести к потере связи с интернетом.'+#$0a+#$0d+
     'Вы можете не закрыть, а скрутить программу в трей кнопкой "Свернуть в трей".'+#$0a+#$0d+
     'Действительно нужно закрыть программу? (нажмите "No" для отмены выхода, или "OK" для выхода)', mtWarning,
     [mbNo, mbOk],0)=mrNo then abort;

   try
     t:=TIniFile.Create(ExtractFilePath(application.exename)+setini);
     t.WriteString('MAIN','host1',form2.edit1.Text);
     t.WriteString('MAIN','host2',form2.edit4.Text);
     t.WriteString('MAIN','Interval',form2.edit2.Text);
     t.WriteString('MAIN','IP_Modem',form2.edit3.Text);
     t.WriteString('MAIN','TS',form2.edit5.Text);
     t.WriteBool('MAIN','Tray',CheckBox1.Checked);

     t.WriteInteger('MAIN','RG1',form2.RadioGroup1.ItemIndex);
     t.WriteTime('MAIN','Time_RST',form2.DateTimePicker1.Time);

     t.Updatefile;
   finally
     t.Free;
   end;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
TrayIcon1Click(sender);
end;

procedure TForm1.N4Click(Sender: TObject);
begin
 close;
end;

procedure TForm1.Button1Click(Sender: TObject);
{ Запуск контроля }
begin
  if form2.edit1.Text='' then form2.edit1.Text:='mail.ru';
  if form2.edit4.Text='' then form2.edit4.Text:='mail.kz';
  try
    Timer1.Interval:=strtoint(form2.edit2.text)*dd;
    if strtoint(form2.edit5.text)<xts then abort;
    if Timer1.Interval<dd3 then abort;
    Timer1.Enabled:=false;
    Timer1.Enabled:=true;
    label3.Caption:='Запуск произведен';
    Timer1Timer(Sender);
    MessageBeep(MB_ICONEXCLAMATION);
   except
    Timer1.Interval:=dd3;
    form2.edit2.text:=d3;
    form2.edit5.text:=inttostr(xts);
    label3.Caption:='СТОП';
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
{ Остановка контроля }
begin
  try
    Timer1.Enabled:=false;
    label3.Caption:='СТОП';
    Shape2.Visible:=true;
    Shape1.Visible:=false;
  except
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
{ Пинг хостов }
var f: boolean;
begin
  dt:=now;

  f:=false;
  try
    IdIcmpClient1.Host:=form2.edit1.Text;
    label3.Caption:='Пингую хост ...';
    try Application.ProcessMessages; except end;
    IdIcmpClient1.Ping;
    label3.Caption:=datetimetostr(now)+': Пинг хоста успешен';
    f:=false; Shape1.Visible:=true; Shape2.Visible:=false;
  except
     f:=true;
  end;

  if f=false then exit;

  try
    IdIcmpClient1.Host:=form2.edit4.Text;
    label3.Caption:='Пингую альтернативный хост ...';
    try Application.ProcessMessages; except end;
    IdIcmpClient1.Ping;
    label3.Caption:=datetimetostr(now)+': Пинг альтернативного хоста успешен';
    f:=false; Shape1.Visible:=true; Shape2.Visible:=false;
  except
     f:=true;
  end;

      try Application.ProcessMessages; except end;

   if f=true then ResetModem;
end;

procedure TForm1.Button3Click(Sender: TObject);
{ Принудительная перезагрузка }
begin
  button2.Click;
  ResetModem;

    Timer1.Enabled:=false;
    Timer1.Enabled:=true;
    dt:=now;

    label3.Caption:='Попытка принудительной перезагрузки роутера';


end;

procedure TForm1.ResetModem;
{ Перезагрузка роутера }
var Flags: OleVariant;
begin
  Flags:=navNoReadFromCache;

   try
     IdIcmpClient1.Host:=form2.edit3.Text;
     label3.Caption:='Пингую роутер перед перезагрузкой ...';
    try Application.ProcessMessages; except end;
     IdIcmpClient1.Ping;
     label3.Caption:='Пинг роутера успешен';

       try
         label3.Caption:='Попытка перезагрузить роутер ...';
         try Application.ProcessMessages; except end;

         try WebBrowser1.Stop; except end;
         sleep(500);


         WebBrowser1.Navigate('http:\\'+form2.edit3.text+'/rebootinfo.cgi', Flags);
         label3.Caption:=datetimetostr(now)+': Роутеру послана команда перезагрузки.';
         label6.Caption:=label3.Caption;
         try Application.ProcessMessages; except end;
         sleep(2000);
       except
         label3.Caption:=datetimetostr(now)+': Ошибка связи с роутером!';
         try Application.ProcessMessages; except end;
         Shape2.Visible:=true;
         Shape1.Visible:=false;
       end;

   except
      label3.Caption:=datetimetostr(now)+': Нет связи с роутером!';
      try Application.ProcessMessages; except end;
      Shape2.Visible:=true;
      Shape1.Visible:=false;
   end;

         MessageBeep(MB_ICONERROR);

         if TrayIcon1.Visible then
         try TrayIcon1.BalloonHint:=label3.Caption;
         TrayIcon1.BalloonTitle:='ВНИМАНИЕ!';
         TrayIcon1.ShowBalloonHint; except end;


      try Application.ProcessMessages; except end;
end;

procedure TForm1.WebBrowser1NavigateError(ASender: TObject;
  const pDisp: IDispatch; var URL, Frame, StatusCode: OleVariant;
  var Cancel: WordBool);
{ Ошибка при вызове скрипта по http }
begin
  label3.Caption:='Подготовка к пингу роутера ...';
  Cancel:=true;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
{ Состояние программы }
begin
  try
  if Timer1.Enabled=true then begin
     label5.color:=clLime; label5.Caption:='ВКЛ'
   end else begin
     label5.color:=clMaroon; label5.Caption:='ВЫКЛ'
   end;
   except
   label5.Caption:=''
  end;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
{ Уход в трей при старте }
begin
  if (Shape1.Visible=true) and (Timer3.Enabled) then begin
    button4.Click; timer3.Enabled:=false;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
{ Уйти в трей }
begin
  try
    TrayIcon1.Visible := false;
    TrayIcon1.IconIndex:=0;
    TrayIcon1.Visible := True;
    Application.MainForm.Hide;
  except
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  form2.showmodal;
end;

procedure TForm1.Timer4Timer(Sender: TObject);
{ Время и Анимация трея }
begin

  try label8.Caption:=datetimetostr(now); except label8.Caption:=''; end;

  try
    if Timer1.Enabled then
    label9.Caption:=formatfloat('#####0.00',
      ((timer1.Interval-MilliSecondSpan(now, dt))/dd)) else abort;
  except
    label9.Caption:='';
  end;

  if TrayIcon1.Visible then begin
  TrayIcon1.Hint:='Контроль роутера D-link DSL-2600U'+
    #$0a+#$0d+label3.Caption+#$0a+#$0d+label6.Caption+
    #$0a+#$0d+'До опроса осталось: '+label9.Caption+' мин';

  end;

  if TrayIcon1.Visible then begin
  try if Shape1.Visible=true then begin
    TrayIcon1.Animate:=false;
    TrayIcon1.IconIndex:=0;
     end else TrayIcon1.Animate:=true;
  except
    TrayIcon1.Animate:=false;
    TrayIcon1.IconIndex:=0;
  end;
  end;

end;

procedure TForm1.TrayIcon1Click(Sender: TObject);
{ Восстановление из трея }
begin
  try
    TrayIcon1.Visible := False;
    TrayIcon1.IconIndex:=0;
    Application.MainForm.Show;
  except
  end;
end;

procedure TForm1.Timer5Timer(Sender: TObject);
{ Проверка на режим сна }
const _dd: tdatetime=0; _dt=1;
var _k: int64;
begin
 Application.ProcessMessages;
  if _dd=0 then begin _dd:=now; exit; end;
  _k:=MinutesBetween(now,_dd); _dd:=now;
  if _k >=_dt then begin
    button2.Click;
    MessageBeep(MB_ICONEXCLAMATION);
    label3.Caption:='Восстановление из режима сна';
    Application.ProcessMessages;
    sleep(strtoint(form2.edit5.text)*1000);
    button1.Click;
  end;
end;

procedure TForm1.Timer6Timer(Sender: TObject);
{ Перезагрузка по таймеру }
var s, s2: string; fs: TFormatSettings;
begin
  if form2.radiogroup1.itemindex=2 then exit;
  s2:=timetostr(form2.DateTimePicker1.Time);
  s2[7]:='0'; s2[8]:='0';
  s:=timetostr(Time); s[7]:='0'; s[8]:='0';
  if (s=s2) and (Shape1.Visible) then begin
    label3.Caption:='Попытка перезагрузки по таймеру ...';
    if form2.radiogroup1.itemindex=1 then
       form2.radiogroup1.itemindex:=2;
     try Application.ProcessMessages; except end;
    sleep(2000);
    button3.Click;
  end;
end;

procedure TForm1.Timer7Timer(Sender: TObject);
var s1,s2: string; k: integer;
begin
  try
    k:=form2.RadioGroup1.Itemindex;
    s1:=form2.RadioGroup1.Items[k];
    if k<>2 then s2:=' в '+timetostr(form2.DateTimePicker1.time) else s2:='';


    label1.Caption:='Будильник:  '+s1+' '+s2;
  except

  end;
end;

end.
