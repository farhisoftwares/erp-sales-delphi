unit DmConnection;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.IBBase,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  Data.DB;

type
  TdmConnection = class(TDataModule)
    FDConnection: TFDConnection;
    FDTransaction: TFDTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private { Private declarations }
  public { Public declarations }
    function ConnectToDatabase(const AServer, ADatabase: string): Boolean;
    function DisconnectFromDatabase: Boolean;
    function IsConnected: Boolean;
  end;

var
  dmConnection: TdmConnection;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmConnection.DataModuleCreate(Sender: TObject);
begin
  FDConnection.DriverName := 'FB';
end;

function TdmConnection.ConnectToDatabase(const AServer, ADatabase: string): Boolean;
begin
  try
    with FDConnection do
    begin
      Params.Clear;
      Params.Add('Server=' + AServer);
      Params.Add('Database=' + ADatabase);
      Params.Add('User_Name=SYSDBA');
      Params.Add('Password=masterkey');
      Params.Add('Port=3050');
      Params.Add('Charset=UTF8');
      Connected := True;
      Result := True;
    end;
  except
    on E: Exception do
    begin
      Result := False;
      ShowMessage('Connection Error: ' + E.Message);
    end;
  end;
end;

function TdmConnection.DisconnectFromDatabase: Boolean;
begin
  try
    FDConnection.Connected := False;
    Result := True;
  except
    Result := False;
  end;
end;

function TdmConnection.IsConnected: Boolean;
begin
  Result := FDConnection.Connected;
end;

end.