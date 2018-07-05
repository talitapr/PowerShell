## CRIA PASTA RELEASE ##
[void][System.Reflection.Assembly]::LoadWithPartialName( 
    "System.Windows.Forms") 
[void][System.Reflection.Assembly]::LoadWithPartialName( 
    "Microsoft.VisualBasic") 

$Versao = Read-Host "Informe número versão"
$Release = Read-Host "Informe número release"

cd D:\Fingolo\BennerSaude\PACOTES\PORTAL\$Versão  

## COPIAR ARQUIVOS LOTE ##
Copy-Item -Path D:\Fingolo\DirTMPAtualizador\PORTAL\$Versao\ -Recurse -Destination D:\Fingolo\BennerSaude\PACOTES\PORTAL\$Versao\$Release\

# COPIA ARQUIVOS DIRETÓRIOS ##

xcopy D:\Fingolo\DirTMPAtualizador\PORTAL\$Versao\APLICAÇÃO\*.dll D:\Fingolo\DirTMPAtualizador\PORTAL\$Versao\SERVIDOR /y
xcopy D:\Fingolo\DirTMPAtualizador\PORTAL\$Versao\APLICAÇÃO\*.bpl D:\Fingolo\DirTMPAtualizador\PORTAL\$Versao\SERVIDOR /y
xcopy D:\Fingolo\DirTMPAtualizador\PORTAL\$Versao\APLICAÇÃO\*.mrt D:\Fingolo\DirTMPAtualizador\PORTAL\$Versao\SERVIDOR /y
xcopy D:\Fingolo\DirTMPAtualizador\PORTAL\$Versao\APLICAÇÃO\*.xml D:\Fingolo\DirTMPAtualizador\PORTAL\$Versao\SERVIDOR /y
xcopy D:\Fingolo\DirTMPAtualizador\PORTAL\$Versao\APLICAÇÃO\*.exe D:\Fingolo\DirTMPAtualizador\PORTAL\$Versao\SERVIDOR /y
del D:\Fingolo\DirTMPAtualizador\PORTAL\$Versao\APLICAÇÃO\*.dll
del D:\Fingolo\DirTMPAtualizador\PORTAL\$Versao\APLICAÇÃO\*.bpl
del D:\Fingolo\DirTMPAtualizador\PORTAL\$Versao\APLICAÇÃO\*.mrt
del D:\Fingolo\DirTMPAtualizador\PORTAL\$Versao\APLICAÇÃO\*.xml
del D:\Fingolo\DirTMPAtualizador\PORTAL\$Versao\APLICAÇÃO\*.exe

if(Test-Path D:\Fingolo\DirTMPAtualizador\PORTAL\$Versao\APLICAÇÃO\#WEBAPP\)
{
 Copy-Item -Path D:\Fingolo\DirTMPAtualizador\PORTAL\$Versao\APLICAÇÃO\#WEBAPP\ -Recurse -Destination D:\Fingolo\DirTMPAtualizador\PORTAL\$Versao\WEB\ -Force
 Rename-Item D:\Fingolo\DirTMPAtualizador\PORTAL\$Versao\WEB\#WEBAPP -NewName D:\Fingolo\DirTMPAtualizador\PORTAL\$Versao\WEB\WEBAPP
    Remove-Item D:\Fingolo\DirTMPAtualizador\PORTAL\$Versao\APLICAÇÃO\#WEBAPP\ -Recurse
}

if(Test-Path D:\Fingolo\DirTMPAtualizador\PORTAL\$Versao\APLICAÇÃO\#WEB\)
{
 Copy-Item -Path D:\Fingolo\DirTMPAtualizador\PORTAL\$Versao\APLICAÇÃO\#WEB\ -Recurse -Destination D:\Fingolo\DirTMPAtualizador\PORTAL\$Versao\WEBAPP\ -Force
    Remove-Item D:\Fingolo\DirTMPAtualizador\PORTAL\$Versao\APLICAÇÃO\#WEB\ -Recurse
}

## CRIA ARQUIVO PDF ##

Out-File -FilePath "D:\Fingolo\BennerSaude\PACOTES\PORTAL\$Versao\$Release\DocumentacaoPortalV$Versao R$Release.PDF"
[System.Windows.Forms.MessageBox]::Show("Gerar Relatório via SISCON", 'Relatório', 'OK', 'Warning')