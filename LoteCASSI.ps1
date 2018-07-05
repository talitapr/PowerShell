## CRIA PASTA RELEASE ##

$Versao = Read-Host "Informe número versão"
$Release = Read-Host "Informe número release"

cd D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versão  

## COPIAR ARQUIVOS LOTE ##
Copy-Item -Path D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\APLICAÇÃO -Recurse -Destination D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versao\$Release\ARQUIVOS\APLICAÇÃO
xcopy D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versao\PADRAO\*.txt D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versao\$Release
xcopy D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versao\PADRAO\*.pdf D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versao\$Release
Copy-Item -Path D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versao\PADRAO\Relatorio_versao -Recurse -Destination D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versao\$Release
Rename-Item -Path "D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versao\$Release\Documentacao - Versao SC-CASSI 8.44 - Release_00.PDF" -NewName "Documentacao - Versao SC-CASSI $Versao - Release_$Release.PDF"

# COPIA ARQUIVOS DIRETÓRIOS ##

xcopy D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\APLICAÇÃO\*.dll D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\SERVIDOR /y
xcopy D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\APLICAÇÃO\*.bpl D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\SERVIDOR /y
xcopy D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\APLICAÇÃO\*.mrt D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\SERVIDOR /y
xcopy D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\APLICAÇÃO\*.xml D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\SERVIDOR /y
xcopy D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\APLICAÇÃO\*.exe D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\SERVIDOR /y
del D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\APLICAÇÃO\*.dll
del D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\APLICAÇÃO\*.bpl
del D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\APLICAÇÃO\*.mrt
del D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\APLICAÇÃO\*.xml
del D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\APLICAÇÃO\*.exe
cd  D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\APLICAÇÃO\


if(Test-Path D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\APLICAÇÃO\WEBAPP\)
{
    Copy-Item -Path D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\APLICAÇÃO\WEBAPP\ -Recurse -Destination D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\ -Force
    Remove-Item WEBAPP -Recurse
    $WEB = 1
}

## CORRIGE NOME RELATORIOS ##
cd D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\APLICAÇÃO
    Dir -R *.rpt| Rename-Item -NewName { $_.name -replace "ã","a" }
    Dir -R *.rpt| Rename-Item -NewName { $_.name -replace "á","a" }
    Dir -R *.rpt| Rename-Item -NewName { $_.name -replace "é","e" }
    Dir -R *.rpt| Rename-Item -NewName { $_.name -replace "ê","e" }
    Dir -R *.rpt| Rename-Item -NewName { $_.name -replace "í","i" }
    Dir -R *.rpt| Rename-Item -NewName { $_.name -replace "õ","o" }
    Dir -R *.rpt| Rename-Item -NewName { $_.name -replace "ó","o" }
    Dir -R *.rpt| Rename-Item -NewName { $_.name -replace "ú","u" }
    Dir -R *.rpt| Rename-Item -NewName { $_.name -replace "ç","c" }
    Dir -R *.rpt| Rename-Item -NewName { $_.name -replace "_","" }
    Dir -R *.rpt| Rename-Item -NewName { $_.name -replace "-","" }
    Dir -R *.rpt| Rename-Item -NewName { $_.name -replace " ","" }

## COPIA PLUGIN SPCOOKER ##
#Copy-Item  D:\Fingolo\BennerSaude\PACOTES\ATUALIZACOES\SC\$Versao\FERRAMENTAS\SPCOOKER\*.dll -Recurse -Destination D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\SP\#

## Se versão = Corrente ##
$EhCorrente = Read-Host "É versão Corrente (S / N)?" 
if ($EhCorrente -eq 'S') 
{
    ## COPIA APOLLO DESKTOP ##
    $ApolloDesktop = Read-Host  "Informe Build Desktop (Caso não tenha digite 0)"
    if ($ApolloDesktop -ne 0)
    {
        $Dir = "\\mga-sc001\Build\Corrente\Desktop"
        cd D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versao\$Release\ARQUIVOS
        Copy-Item -Path $Dir\$ApolloDesktop -Recurse -Destination  D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versao\$Release\ARQUIVOS\$ApolloDesktop -Force
        Rename-Item -Path  D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versao\$Release\ARQUIVOS\$ApolloDesktop -NewName $ApolloDesktop-desktop
        Copy-Item -Path $Dir\$ApolloDesktop\*.* -Destination D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\SERVIDOR -Exclude Benner.Tecnologia.Business.Test.dll -Force -Recurse
        cd  D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\SERVIDOR 
        $WEB = 1
    }


    ## COPIA APOLLO SERVICO ##
    $ApolloServico = Read-Host  "Informe Build Servico (Caso não tenha digite 0)"
    if ($ApolloServico -ne 0)
    {
        $Dir = "\\mga-sc001\Build\Corrente\Servico"
        cd  D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versao\$Release\ARQUIVOS
        Copy-Item -Path $Dir\$ApolloServico -Recurse -Destination  D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versao\$Release\ARQUIVOS\$ApolloServico -Force
        Rename-Item -Path  D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versao\$Release\ARQUIVOS\$ApolloServico -NewName $ApolloServico-servico
        cd  D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\
        Remove-Item SERVICO -Recurse
        Copy-Item -Path $Dir\$ApolloServico -Destination D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao -Exclude Benner.Tecnologia.Business.Test.dll -Force -Recurse
        Rename-Item -Path D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\$ApolloServico -NewName SERVICO
        $WEB = 1
    }

    ## COPIA APOLLO SOCWEB ## 
    $ApolloSocWeb = Read-Host  "Informe Build SOCWEB (Caso não tenha digite 0)"
    if ($ApolloSocWeb -ne 0)
    {
        $Dir = "\\mga-sc001\Build\Corrente\SocWeb"
        cd  D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versao\$Release\ARQUIVOS
        Copy-Item -Path $Dir\$ApolloSocWeb -Recurse -Destination  D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versao\$Release\ARQUIVOS\$ApolloSocWeb -Force
        Rename-Item -Path  D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versao\$Release\ARQUIVOS\$ApolloSocWeb -NewName $ApolloSocWeb-socweb
        cd D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\
        Remove-Item SOCWEB -Recurse
        Copy-Item -Path $Dir\$ApolloSocWeb -Destination D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao -Exclude Benner.Tecnologia.Business.Test.dll -Force -Recurse
        Rename-Item -Path D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\$ApolloSocWeb -NewName SOCWEB
        $WEB = 1
    }
}
else 
{
    ## COPIA APOLLO DESKTOP ##
    $ApolloDesktop = Read-Host  "Informe Build Desktop (Caso não tenha digite 0)"
    if ($ApolloDesktop -ne 0)
    {
        $Dir = "\\mga-sc001\Build\Versao\$Versao\Desktop"
        cd D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versao\$Release\ARQUIVOS
        Copy-Item -Path $Dir\$ApolloDesktop -Recurse -Destination  D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versao\$Release\ARQUIVOS\$ApolloDesktop -Force
        Rename-Item -Path  D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versao\$Release\ARQUIVOS\$ApolloDesktop -NewName $ApolloDesktop-desktop
        Copy-Item -Path $Dir\$ApolloDesktop\*.* -Destination D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\SERVIDOR -Exclude Benner.Tecnologia.Business.Test.dll -Force -Recurse
        cd  D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\SERVIDOR 
        $WEB = 1
    }


    ## COPIA APOLLO SERVICO ##
    $ApolloServico = Read-Host  "Informe Build Servico (Caso não tenha digite 0)"
    if ($ApolloServico -ne 0)
    {
        $Dir = "\\mga-sc001\Build\Versao\$Versao\Servico"
        cd  D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versao\$Release\ARQUIVOS
        Copy-Item -Path $Dir\$ApolloServico -Recurse -Destination  D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versao\$Release\ARQUIVOS\$ApolloServico -Force
        Rename-Item -Path  D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versao\$Release\ARQUIVOS\$ApolloServico -NewName $ApolloServico-servico
        cd  D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\
        Remove-Item SERVICO -Recurse
        Copy-Item -Path $Dir\$ApolloServico -Destination D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao -Exclude Benner.Tecnologia.Business.Test.dll -Force -Recurse
        Rename-Item -Path D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\$ApolloServico -NewName SERVICO
        $WEB = 1
    }

    ## COPIA APOLLO SOCWEB ##
    $ApolloSocWeb = Read-Host  "Informe Build SOCWEB (Caso não tenha digite 0)"
    if ($ApolloSocWeb -ne 0)
    {
        $Dir = "\\mga-sc001\Build\Versao\$Versao\SocWeb"
        cd  D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versao\$Release\ARQUIVOS
        Copy-Item -Path $Dir\$ApolloSocWeb -Recurse -Destination  D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versao\$Release\ARQUIVOS\$ApolloSocWeb -Force
        Rename-Item -Path  D:\Fingolo\BennerSaude\PACOTES\CASSI\$Versao\$Release\ARQUIVOS\$ApolloSocWeb -NewName $ApolloSocWeb-socweb
        cd D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\
        Remove-Item SOCWEB -Recurse
        Copy-Item -Path $Dir\$ApolloSocWeb -Destination D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao -Exclude Benner.Tecnologia.Business.Test.dll -Force -Recurse
        Rename-Item -Path D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\$ApolloSocWeb -NewName SOCWEB
        $WEB = 1
    }
}
## DELETA ARQUIVOS KERNEL
#cd D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL
    #Remove-Item APLICAÇÃO -Recurse
    #Remove-Item COMUM     -Recurse
    #Remove-Item OUTROS    -Recurse
    #Remove-Item SERVIDOR  -Recurse
    #Remove-Item SP        -Recurse


## COPIAR ARQUIVOS TMP PARA BNU-AOL 
 #Copy-Item -Path D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\APLICAÇÃO -Recurse -Destination D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL
 #Copy-Item -Path D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\COMUM -Recurse -Destination D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL
 #Copy-Item -Path D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\OUTROS -Recurse -Destination D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL
 #Copy-Item -Path D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\SERVIDOR -Recurse -Destination D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL
 #Copy-Item -Path D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL\SP -Recurse -Destination D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\KERNEL

## DELETA AWB + GERA NOVO ##
if ($WEB -eq 1)
{
    del D:\Fingolo\DirTMPAtualizador\AG-CASSI\$Versao\ATUALIZACAO_WEB.awb

    $GravaAwb = 'D:\Fingolo\DirTMPAtualizador\AG-CASSI\'+$Versao+'\ATUALIZACAO_WEB.awb'
    Start-Process -FilePath D:\Fingolo\BennerSaude\PACOTES\ATUALIZACOES\SC\$Versao\Ferramentas\AWBExporter\AwbExporterCMD.exe -ArgumentList ($Versao,$GravaAwb ,'.BAK') 

    #Start-Process -FilePath D:\Fingolo\BennerSaude\PACOTES\ATUALIZACOES\SC\$Versao\Ferramentas\AWBExporter\CASSI_AWB.bat
}