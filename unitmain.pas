unit UnitMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  StrUtils;

type

  { TFormMain }

  TFormMain = class(TForm)
    ButtonOK: TButton;
    ButtonExit: TButton;
    SiteNumber: TEdit;
    ProductKey: TEdit;
    GroupBoxMain: TGroupBox;
    LabelDash: TLabel;
    LabelMain: TLabel;

    procedure ButtonOKClick(Sender: TObject);
    procedure ButtonExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject);
  private

  public

  end;

var
  FormMain: TFormMain;

implementation

{$R *.lfm}

{ TFormMain }

procedure Validator(Site: String; Product: String);
var
  blacklist: array of String = ('333', '444', '555', '666',
                               '777', '888', '999');
  isSiteValid: Boolean;
  isProductValid: Boolean;
  ProductSum: Integer;
  Index: Integer;
begin
  { Site Code Validation }
  isSiteValid := False;
  if IndexStr(Site, Blacklist) = -1 then isSiteValid := True;

  ProductSum := 0;
  for Index := 1 to Length(Product) do begin
      ProductSum := ProductSum + StrToInt(Product[Index]);
  end;

  { Product Key Mod7 Algorithm Validation}
  isProductValid := False;
  if (ProductSum mod 7 = 0) then isProductValid := True;

  { End Result }
  if (isProductValid and isSiteValid) then
     ShowMessage('The Key is Valid!')
  else ShowMessage('Sorry, This Key is Invalid!');
end;

procedure TFormMain.ButtonOKClick(Sender: TObject);
begin
  if (Length(SiteNumber.Text) < 3) or (Length(ProductKey.Text) < 7) then
     ShowMessage('Please, Enter a Valid Product Key!')
  else begin
     Validator(SiteNumber.Text, ProductKey.Text);
  end;
end;

procedure TFormMain.ButtonExitClick(Sender: TObject);
begin
  ShowMessage('Goodbye!');
  Halt;
end;

procedure TFormMain.FormClose(Sender: TObject);
begin
  Halt;
end;

end.

