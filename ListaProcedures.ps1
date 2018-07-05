## Salva texto dos nomes no arquivo ##

$PastaPl2 = Read-Host "Informe a pasta onde encontra-se os arquivos .PL2"

Get-ChildItem -Path $PastaPl2\*.pl2 -Recurse -Name | Out-File -FilePath $PastaPl2\arquivo.txt

$Procedure = Get-Content $PastaPl2\arquivo.txt 

## Parâmetros  ##

$Server = Read-Host "Informe o servidor de aplicação" 
$System = Read-Host "Informe o nome do sistema no ServerManager"
$User = Read-Host "Informe usuário de acesso ao sistema"
$Pass = Read-Host "Informe a senha do usuário de acesso"

## Deleta script e Zip.
Remove-Item $PastaPl2\script.txt
Remove-Item $PastaPl2\Procedures.zip -Recurse

## Cria script ##
Foreach ($Procedure in get-content $PastaPl2\arquivo.txt ){
$Comando = 'SPCookerTranslator.exe File='+$Procedure+' server='+$Server+' system='+$System+' user='+$User+' pass='+$Pass+' show_log=true'
Out-File -FilePath $PastaPl2\script.txt -Append -Encoding string -InputObject $Comando
}

## Compacta arquivos .Pl2 + script ##    
    $path = $PastaPl2
    $destination = Join-Path $path "Procedures.zip"
    $exclude = @("arquivo.txt")
    $files = Get-ChildItem -Path $path -Exclude $exclude
    Compress-Archive -Path $files -DestinationPath $destination -CompressionLevel Fastest

## Envia e-mail ##
$EnviaEmail = Read-Host "Deseja enviar por e-mail o pacote de arquivo (S / N)?"
if ($EnviaEmail -eq 'S') 
{ 
    $Email = Read-Host "Informe e-mail para envio"
    Send-MailMessage –From talita.rodrigues@benner.com.br –To $Email –Subject “Script Procedures” –Body "Segue em anexo script de procedures" -SmtpServer webmail.benner.com.br -Port 587 -Attachments $PastaPl2\Procedures.zip
}

 

