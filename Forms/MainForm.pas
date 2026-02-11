unit MainForm;

interface

uses
  Forms, Menus, ClientsForm, ArticlesForm, SalesForm, PurchasesForm, ExerciceManagementForm;

type
  TfrmMain = class(TForm)
  private
    MainMenu: TMainMenu;
    procedure ClientsMenuClick(Sender: TObject);
    procedure ArticlesMenuClick(Sender: TObject);
    procedure SalesMenuClick(Sender: TObject);
    procedure PurchasesMenuClick(Sender: TObject);
    procedure ExerciceManagementMenuClick(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

constructor TfrmMain.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  // Create the main menu
  MainMenu := TMainMenu.Create(Self);
  Self.Menu := MainMenu;

  // Create menu items
  with MainMenu.Items do
  begin
    Add(TMenuItem.Create(MainMenu));
    Items[Count - 1].Caption := 'Clients';
    Items[Count - 1].OnClick := ClientsMenuClick;
     
    Add(TMenuItem.Create(MainMenu));
    Items[Count - 1].Caption := 'Articles';
    Items[Count - 1].OnClick := ArticlesMenuClick;
     
    Add(TMenuItem.Create(MainMenu));
    Items[Count - 1].Caption := 'Sales';
    Items[Count - 1].OnClick := SalesMenuClick;
     
    Add(TMenuItem.Create(MainMenu));
    Items[Count - 1].Caption := 'Purchases';
    Items[Count - 1].OnClick := PurchasesMenuClick;
     
    Add(TMenuItem.Create(MainMenu));
    Items[Count - 1].Caption := 'Exercice Management';
    Items[Count - 1].OnClick := ExerciceManagementMenuClick;
  end;
end;

procedure TfrmMain.ClientsMenuClick(Sender: TObject);
begin
  // Handle client management logic here
  // Show ClientsForm
  ClientsForm.Show;
end;

procedure TfrmMain.ArticlesMenuClick(Sender: TObject);
begin
  // Handle articles management logic here
  // Show ArticlesForm
  ArticlesForm.Show;
end;

procedure TfrmMain.SalesMenuClick(Sender: TObject);
begin
  // Handle sales management logic here
  // Show SalesForm
  SalesForm.Show;
end;

procedure TfrmMain.PurchasesMenuClick(Sender: TObject);
begin
  // Handle purchases management logic here
  // Show PurchasesForm
  PurchasesForm.Show;
end;

procedure TfrmMain.ExerciceManagementMenuClick(Sender: TObject);
begin
  // Handle exercice management logic here
  // Show ExerciceManagementForm
  ExerciceManagementForm.Show;
end;

end.