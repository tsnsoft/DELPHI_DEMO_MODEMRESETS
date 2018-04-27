program ModemReseTS;

uses
  Forms,
  SysUtils,
  windows,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2};

{$R *.res}

const
   MemFileSize = 127;
   MemFileName = 'ModemReseTS';

var  MemHnd: HWND;

begin

  try

   MemHnd := CreateFileMapping(HWND($FFFFFFFF), nil, PAGE_READWRITE, 0,
             MemFileSize, MemFileName);

   if GetLastError <> ERROR_ALREADY_EXISTS then begin
      Application.Initialize;
      Application.CreateForm(TForm1, Form1);
      Application.CreateForm(TForm2, Form2);
  Application.Run;
   end else begin
    Application.MessageBox('Приложение уже запущено '+
      '(возможно оно свернуто в трей)!'+#$0a+#$0d+
      'Используйте запущенную копию программы.',
      'Контроль роутера DSL-2600U by TSN', MB_OK);
      Application.Terminate;
   end;

  finally

    CloseHandle(MemHnd);

  end;



end.
