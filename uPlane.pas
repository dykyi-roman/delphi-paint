unit uPlane;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, StdCtrls, ExtCtrls;

type
    TPoint = record
      X : Double;
      Y : Double;
    end;

    TPlaneEx = class
    public
      dx,dy  : real;
      Step   : Integer;
      Plane  : TPoint;
      Start  : TPoint;
      Finish : TPoint;
      procedure MoveTo(const Obj: TImage);
      procedure Move(const Obj: TShape);
      procedure Radius(const Radius : Integer);
      //
      constructor Create;
    end;

//    TState = (sStart, sStop);
    TPlane = class
    private
        procedure SetRadius(const Value : Integer);
//        procedure SetState(const Value : TState);
    public
//        FStatus : TState;
        FRadius : Integer;
        Plane1  : TPlaneEx;
        Plane2  : TPlaneEx;
    public
        constructor Create;
        destructor Destroy; override;
        function GetPosition(APlane : TShape): TPoint;
        property Radius : Integer read FRadius write SetRadius;
//        property Status : TState  read FStatus write SetState default sStop;
    end;

var
  Plane: TPlane;

implementation

uses
    uMain;

{ TPlane }

constructor TPlane.Create;
begin
//    Status := sStop;
    Radius := 50;
    //
    Plane1 := TPlaneEx.Create;
    Plane2 := TPlaneEx.Create;
end;

destructor TPlane.Destroy;
begin
  FreeAndNil( Plane1 );
  FreeAndNil( Plane2 );
  inherited;
end;

function TPlane.GetPosition(APlane : TShape) : TPoint;
begin
    Result.X := APlane.Left;
    Result.Y := APlane.Top;
end;

procedure TPlane.SetRadius(const Value: Integer);
begin
  FRadius := Value;
end;

{ ------------------------------------------ TPlaneEx }

constructor TPlaneEx.Create;
begin
    Step    := 1;
    Plane.X := 0;
    Plane.Y := 0;
end;

procedure TPlaneEx.Move(const Obj: TShape);
begin
    if (sqrt(sqr(Finish.X - Plane.X) + sqr(Finish.Y - Plane.Y)) < Step) then
    begin
      Plane.X  := Finish.X;
      Plane.Y  := Finish.Y;
      Obj.Left := Round(Finish.X) +  round(1*sin(pi*Form1.se1.Value/180));;
      Obj.Top  := Round(Finish.Y);
   end else begin
      Plane.X  := Plane.X + dx;
      Plane.Y  := Plane.Y + dy;
      Obj.Left := round(Plane.X);
      Obj.Top  := round(Plane.Y);
   end;
end;

procedure TPlaneEx.MoveTo(const Obj: TImage);
var
  d: Real;
begin
    d := sqrt(sqr(Plane.X - Obj.Left) + sqr(Plane.X - Obj.Top))/step;

    dx := (Obj.Left - Plane.X) / d;
    dy := (Obj.Top - Plane.Y) / d;
    Finish.X := Obj.Left;
    Finish.Y := Obj.Top;
end;

procedure TPlaneEx.Radius(const Radius: Integer);
begin

end;

initialization
    Plane := TPlane.Create;

finalization
    FreeAndNil( Plane );

end.
