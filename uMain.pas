unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ActnList, PlatformDefaultStyleActnCtrls, ActnMan, jpeg, GIFImg, Spin, Menus;

type
  TForm1 = class(TForm)
    shpPlane1: TShape;
    shpPlane2: TShape;
    tmrPlane1: TTimer;
    actmgr1: TActionManager;
    actOpenSetting: TAction;
    tmrCrash: TTimer;
    actStart: TAction;
    actPouse: TAction;
    imgstart1: TImage;
    imgstart2: TImage;
    se1: TSpinEdit;
    se2: TSpinEdit;
    txt1: TStaticText;
    tmrPlane2: TTimer;
    se3: TSpinEdit;
    se4: TSpinEdit;
    txt3: TStaticText;
    pm1: TPopupMenu;
    N451: TMenuItem;
    N901: TMenuItem;
    N01: TMenuItem;
    N301: TMenuItem;
    N1201: TMenuItem;
    pm2: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    N302: TMenuItem;
    N303: TMenuItem;
    se5: TSpinEdit;
    se6: TSpinEdit;
    procedure actOpenSettingExecute(Sender: TObject);
    procedure tmrPlane1Timer(Sender: TObject);
    procedure tmrCrashTimer(Sender: TObject);
    procedure shpPlane1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shpPlane1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shpPlane1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure actStartExecute(Sender: TObject);
    procedure actPouseExecute(Sender: TObject);
    procedure imgstart1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imgstart1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure imgstart1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imgstart2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imgstart2MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure imgstart2MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure shpPlane1MouseEnter(Sender: TObject);
    procedure shpPlane1MouseLeave(Sender: TObject);
    procedure se3Change(Sender: TObject);
    procedure se4Change(Sender: TObject);
    procedure N1201Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure tmrPlane2Timer(Sender: TObject);
    procedure se1Change(Sender: TObject);
  private
  public
    { Public declarations }
  end;

  TParam = record
      Flag  : boolean;
      X0,Y0 : integer;
  end;

var
  Form1 : TForm1;
  b     :  Boolean = false;
  roadp,
  road1,
  road2 : TParam;

implementation

uses
    uSetting, uPlane;

{$R *.dfm}

procedure TForm1.actOpenSettingExecute(Sender: TObject);
begin
   Form2.Show;
end;

procedure TForm1.actStartExecute(Sender: TObject);
begin
    //Timer
    tmrPlane1.Enabled := False;
    tmrPlane2.Enabled := False;
    tmrCrash.Enabled  := False;

    // Plane 1
    shpPlane1.Left := imgstart1.Left + imgstart1.Width div 2;
    shpPlane1.Top  := imgstart1.Top  + imgstart1.Height div 2;
    Plane.Plane1.Step    := 2;
    Plane.Plane1.Plane.X := shpPlane1.Left;
    Plane.Plane1.Plane.Y := shpPlane1.Top;

    // Plane 2
    shpPlane2.Left := imgstart2.Left + imgstart2.Width div 2;
    shpPlane2.Top  := imgstart2.Top  + imgstart2.Height div 2;
    Plane.Plane2.Step    := 2;
    Plane.Plane2.Plane.X := shpPlane2.Left;
    Plane.Plane2.Plane.Y := shpPlane2.Top;

    //
    shpPlane1.Visible := True;
    shpPlane2.Visible := True;
    Repaint;
end;

procedure TForm1.actPouseExecute(Sender: TObject);
begin
    tmrPlane1.Enabled := not tmrPlane1.Enabled;
    tmrPlane2.Enabled := not tmrPlane2.Enabled;
    tmrCrash.Enabled  := not tmrCrash.Enabled;
    Repaint;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  actStartExecute( Sender );
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
   with Canvas do
   begin
      If Form2.chkLine.Checked Then
      begin
         Pen.Color := clRed;
         MoveTo(imgstart1.Left+imgstart1.Width div 2,imgstart1.Top+imgstart1.Width div 2); //Начальные координаты линии
         LineTo(shpPlane1.Left+shpPlane1.Width div 2,shpPlane1.Top+shpPlane1.Width div 2); //Конечные координаты линии
         //
         Pen.Color := clGreen;
         MoveTo(imgstart2.Left+imgstart2.Width div 2,imgstart2.Top+imgstart2.Width div 2); //Начальные координаты линии
         LineTo(shpPlane2.Left+shpPlane2.Width div 2,shpPlane2.Top+shpPlane2.Width div 2); //Конечные координаты линии
         //
       end;
       TextOut(10,10,'Press F5 to New route');
       TextOut(10,25,'Press F4 to Start/Stop');
       TextOut(10,40,'Press F2 to open a Setting form');
       TextOut(10,55,'Right Mouse to Up Plane Speed');

       Pen.Style := psSolid;
       if tmrCrash.Enabled then
         TextOut(Self.Width-100, 10,'[ Start ]')
       else
         TextOut(Self.Width-100, 10,'[ Stop ]');
   end;
end;

procedure TForm1.imgstart2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  with Road2 do
  begin
      Flag := Button = mbLeft;
      if Flag then
      begin
        x0 := x;
        y0 := y;
      end;
  end;
end;

procedure TForm1.imgstart2MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
    Obj: TImage;
begin
    with road2 do
    if Flag then
    begin
        with TControl(Sender) do
        begin
          Left := Left + x - x0;
          Top := Top + y - y0;
        end;
        Obj  := TImage(Sender as TObject);
        case Obj.Tag of
          3:
            begin
                Plane.Plane1.Start.X := Obj.Left;
                Plane.Plane1.Start.Y := Obj.Top;
            end;
        end;

    end;
    Repaint;
end;

procedure TForm1.imgstart2MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  with road2 do
      Flag := False;
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
   se2.Value := (Sender as TMenuItem).Tag;
  (Sender as TMenuItem).Checked := True;
   If Form2.chkLine.Checked Then
       InValidateRect(form1.handle,NIL,True);
end;

procedure TForm1.N1201Click(Sender: TObject);
begin
   se1.Value := (Sender as TMenuItem).Tag;
   (Sender as TMenuItem).Checked := True;

   If Form2.chkLine.Checked Then
       InValidateRect(form1.handle,NIL,True);
end;

procedure TForm1.imgstart1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  with Road1 do
  begin
      Flag := Button = mbLeft;
      if Flag then
      begin
        x0 := x;
        y0 := y;
      end;
  end;
end;

procedure TForm1.imgstart1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
    obj: TImage;
begin
    with road1 do
    if Flag then
    begin
        with TControl(Sender) do
        begin
          Left := Left + x - x0;
          Top := Top + y - y0;
        end;
        Obj  := TImage(Sender as TObject);
        case Obj.Tag of
          1:
            begin
                Plane.Plane1.Start.X := Obj.Left;
                Plane.Plane1.Start.Y := Obj.Top;
            end;
        end;
    end;
    Repaint;
end;

procedure TForm1.imgstart1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  with road1 do
      Flag := False;
end;

procedure TForm1.se1Change(Sender: TObject);
begin
   If Form2.chkLine.Checked Then
      InValidateRect(form1.handle,NIL,True);
end;

procedure TForm1.se3Change(Sender: TObject);
begin
  Form2.trckbrPlan1.Position := se3.Value;
  Plane.Plane1.Step := se3.Value;
end;

procedure TForm1.se4Change(Sender: TObject);
begin
  Form2.trckbrPlan2.Position := se4.Value;
  Plane.Plane2.Step := se4.Value;
end;

procedure TForm1.shpPlane1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  with roadp do
  begin
      Flag := Button = mbLeft;
      if Flag then
      begin
        x0 := x;
        y0 := y;
      end;
  end;

end;

procedure TForm1.shpPlane1MouseEnter(Sender: TObject);
begin
   Cursor := crHandPoint;
end;

procedure TForm1.shpPlane1MouseLeave(Sender: TObject);
begin
  Cursor := crDefault;
end;

procedure TForm1.shpPlane1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
    obj: TShape;
begin
    with roadp do
    if Flag then
    begin
        with TControl(Sender) do
        begin
          Left := Left + x - x0;
          Top := Top + y - y0;
        end;
        Obj  := TShape(Sender as TObject);
        case Obj.Tag of
          1:
            begin
                Plane.Plane1.Plane.X := Obj.Left;
                Plane.Plane1.Plane.Y := Obj.Top;
            end;
          2:
            begin
                Plane.Plane2.Plane.X := Obj.Left;
                Plane.Plane2.Plane.Y := Obj.Top;
            end;
        end;
    end;
end;

procedure TForm1.shpPlane1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  with roadp do
      Flag := False;

  case TShape(Sender as TObject).Tag of
    1:
      begin
        if Button = mbRight then
        begin
            pm1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
//          Form2.trckbrPlan1.Position := Form2.trckbrPlan1.Position + 1;
//          Plane.Plane1.Step := Form2.trckbrPlan1.Position;
        end;
      end;
    2:
      begin
        if Button = mbRight then
        begin
            pm2.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
//          Form2.trckbrPlan2.Position := Form2.trckbrPlan2.Position + 1;
//          Plane.Plane2.Step := Form2.trckbrPlan2.Position;
        end;
      end;
  end;

   If Form2.chkLine.Checked Then
       InValidateRect(form1.handle,NIL,True);
end;

procedure TForm1.tmrCrashTimer(Sender: TObject);
var
    L, tmpX, tmpY: Integer;
begin
    If Not Assigned(Plane) Then
        Exit;

    with Plane do
    begin
        tmpX := ABS(shpPlane1.Left - shpPlane2.Left);
        tmpY := Abs(shpPlane1.Top - shpPlane2.Top);
        L    := Canvas.TextWidth('Attention possible collision [99,99]');
        If ((tmpX < Radius) And (tmpX > 0)) And ((tmpY < Radius) And (tmpY > 0))  Then
        begin
            b := true;
            Canvas.TextOut((Width div 2) - (L div 2), 10,Format('Attention possible collision [%d,%d]',[tmpX, tmpY]))
        end
          else if b then
              Canvas.FillRect(Rect((Width div 2) - L div 2,10,(Width div 2) - L div 2,L));
    end;
end;

procedure TForm1.tmrPlane1Timer(Sender: TObject);
begin
  If (shpPlane1.Left + shpPlane1.Width > Form1.Width) or (shpPlane1.Top + shpPlane1.Height*2 > Form1.Height) or (shpPlane1.Left < 0) or (shpPlane1.Top < 0) Then
     Exit;

  try
    shpPlane1.Left := shpPlane1.Left + round(Plane.Plane1.Step*sin(pi*(90+se1.Value)/180));
    shpPlane1.Top := shpPlane1.Top - round(Plane.Plane1.Step*cos(pi*(90-se1.Value)/180));

        with Form1.Canvas do
        begin
          MoveTo(shpPlane1.Left+shpPlane1.Width div 2,shpPlane1.Top+shpPlane1.Width div 2); //Начальные координаты линии
           LineTo(
            shpPlane1.Left + se5.Value*10*round(Plane.Plane1.Step*sin(pi*(90+se1.Value)/180)) + shpPlane1.Width div 2,
            shpPlane1.Top  - se5.Value*10*round(Plane.Plane1.Step*cos(pi*(90-se1.Value)/180)) + shpPlane1.Width div 2); //Конечные координаты линии
        end;
  except

  end;
end;

procedure TForm1.tmrPlane2Timer(Sender: TObject);
begin
  If (shpPlane2.Left + shpPlane2.Width > Form1.Width) or (shpPlane2.Top + shpPlane2.Height*2 > Form1.Height) or (shpPlane2.Left < 0) or (shpPlane2.Top < 0) Then
    Exit;

  try
      shpPlane2.Left := shpPlane2.Left + round(Plane.Plane2.Step*sin(pi*(90+se2.Value)/180));
      shpPlane2.Top  := shpPlane2.Top - round(Plane.Plane2.Step*cos(pi*(90-se2.Value)/180));

        with Form1.Canvas do
        begin
          MoveTo(shpPlane2.Left+shpPlane2.Width div 2,shpPlane2.Top+shpPlane2.Width div 2); //Начальные координаты линии
           LineTo(
            shpPlane2.Left + se6.Value*10*round(Plane.Plane2.Step*sin(pi*(90+se2.Value)/180)) + shpPlane2.Width div 2,
            shpPlane2.Top  - se6.Value*10*round(Plane.Plane2.Step*cos(pi*(90-se2.Value)/180)) + shpPlane2.Width div 2); //Конечные координаты линии
        end;
  except

  end;
end;

end.
