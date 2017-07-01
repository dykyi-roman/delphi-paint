unit uSetting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin, ComCtrls;

type
  TForm2 = class(TForm)
    btnClose: TButton;
    rg1: TRadioGroup;
    rg2: TRadioGroup;
    btnChange: TButton;
    txt1: TStaticText;
    txt4: TStaticText;
    seRadius: TSpinEdit;
    txt7: TStaticText;
    trckbrPlan1: TTrackBar;
    trckbrPlan2: TTrackBar;
    chkLine: TCheckBox;
    seP1X: TSpinEdit;
    seP1Y: TSpinEdit;
    seP2X: TSpinEdit;
    seP2Y: TSpinEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText4: TStaticText;
    seFP1Y: TSpinEdit;
    seFP1X: TSpinEdit;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText3: TStaticText;
    StaticText7: TStaticText;
    seFP2Y: TSpinEdit;
    seFP2X: TSpinEdit;
    StaticText8: TStaticText;
    procedure btnCloseClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure chkLineClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
    uMain, uPlane;

{$R *.dfm}

procedure TForm2.btnChangeClick(Sender: TObject);
begin
   with Plane do
   begin
       Radius       := seRadius.Value;
       with Plane1 do
       begin
           Step     := trckbrPlan1.Position;
           Plane.X  := seP1X.Value;
           Plane.Y  := seP1Y.Value;
           Finish.X := seFP1X.Value;
           Finish.Y := seFP1Y.Value;
       end;
       //
       with Plane2 do
       begin
           Step     := trckbrPlan2.Position;
           Plane.X  := seP2X.Value;
           Plane.Y  := seP2Y.Value;
           Finish.X := seFP2X.Value;
           Finish.Y := seFP2Y.Value;
       end;

     //Save
     with Form1 do
     begin
       //Plane 1
       shpPlane1.Left := Round(Plane1.Plane.X);
       shpPlane1.Top  := Round(Plane1.Plane.Y);
       //Plane 2
       shpPlane2.Left := Round(Plane2.Plane.X);
       shpPlane2.Top  := Round(Plane2.Plane.Y);
       shpPlane1.OnMouseDown(nil,mbLeft,[],0,0);
       shpPlane2.OnMouseDown(nil,mbLeft,[],0,0);

       road1.Flag := False;
       road2.Flag := False;
       roadp.Flag := False;

       Repaint;
     end;
   end;
//   Close;
end;

procedure TForm2.btnCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TForm2.chkLineClick(Sender: TObject);
begin
    Form1.Repaint;
end;
//Load
procedure TForm2.FormShow(Sender: TObject);
begin
   //Plane 1
   seP1X.Value := Round(Plane.Plane1.Plane.X);
   seP1Y.Value := Round(Plane.Plane1.Plane.Y);
   //Plane 2
   seP2X.Value := Round(Plane.Plane2.Plane.X);
   seP2Y.Value := Round(Plane.Plane2.Plane.Y);
   //Finish1
   seFP1X.Value := Round(Plane.Plane1.Finish.X);
   seFP1Y.Value := Round(Plane.Plane1.Finish.Y);
   //Finish2
   seFP2X.Value := Round(Plane.Plane2.Finish.X);
   seFP2Y.Value := Round(Plane.Plane2.Finish.Y);
end;

end.

