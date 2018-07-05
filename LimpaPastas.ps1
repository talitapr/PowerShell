## LIMPA PASTAS  ##

$Versao = Read-Host "Informe número versão"

Remove-Item D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\APLICAÇÃO\* -Recurse
Remove-Item D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\COMUM\* -Recurse
Remove-Item D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\OUTROS\* -Recurse
Remove-Item D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\SERVIDOR\* -Recurse
Remove-Item D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\SP\* -Recurse