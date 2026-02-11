program ERPSales;
uses Vcl.Forms,
 MainForm in 'Forms\MainForm.pas' {frmMain},
 LoginForm in 'Forms\LoginForm.pas' {frmLogin},
 ClientForm in 'Forms\ClientForm.pas' {frmClient},
 ArticleForm in 'Forms\ArticleForm.pas' {frmArticle},
 VenteForm in 'Forms\VenteForm.pas' {frmVente},
 AchatForm in 'Forms\AchatForm.pas' {frmAchat},
 DmConnection in 'DataModules\DmConnection.pas' {dmConnection: TDataModule},
 DmData in 'DataModules\DmData.pas' {dmData: TDataModule},
 ExerciceForm in 'Forms\ExerciceForm.pas' {frmExercice};
{$R *.res}
begin
 Application.Initialize;
 Application.MainFormOnTaskbar := True;
 Application.CreateForm(TdmConnection, dmConnection);
 Application.CreateForm(TdmData, dmData);
 Application.CreateForm(TfrmLogin, frmLogin);
 Application.Run;
end.