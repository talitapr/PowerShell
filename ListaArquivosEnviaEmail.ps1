Remove-Item E:\BACKUPSQL.txt -Recurse -Force

#Lista pastas na origem - Caso seja mapeado um novo database no Plano de Backup a cópia será efetuada
$PathsBackup = Get-Content -Path E:\ListaPastas.txt

#write-host $PathsBackup

foreach ($Path in $PathsBackup) 
{
    $files = Get-ChildItem -Path $Path -Recurse -Exclude *.log,*.ps1
    $files >> ("E:\BACKUPSQL.txt")
}
 #### Configurando Servidor Smtp #################
 $servidor = "smtp.office365.com";
 $porta_smtp="25";
 $porta_smtp_ssl="587";
 #### Configurando Conta Smtp ####################
 $conta = "EMAIL@OUTLOOK.com.br";
 $senha = "SENHA";
 #### Configurando Assunto, corpo da mensagem e anexo ##########
 $anexo = "E:\BACKUPSQL.txt";
 $assunto = "Lista arquivos BACKUPSQL";
 $corpo = "Anexo lista de arquivos de backup do Servidor BACKUPSQL";
 
 #### Configurando E-mail do Destinatario das Mensagens ########
 $destinatario = "talita.avansini@gmail.com";
 
$message = New-Object System.Net.Mail.MailMessage
$message.From = $conta
$message.To.Add($destinatario)
$message.IsBodyHtml= $true
$message.Subject = $assunto
$attach = New-Object Net.mail.attachment($anexo)
$message.Attachments.Add($attach)
$message.Body = $corpo


$smtpClient = New-Object Net.mail.smtpClient($servidor,$porta_smtp_ssl)
$smtpClient.EnableSsl = $true
$smtpClient.Credentials = New-Object System.Net.NetworkCredential($conta, $senha) 
 #Management.Automation.PSCredential
#$Credenciais = New-Object System.Net.NetworkCredential($conta, $senha) 
$smtpClient.Send($message)
