## CRIA PASTA RELEASE ##

$Versao = Read-Host "Informe número versão"
$Release = Read-Host "Informe número release"
$RAnterior = $Release -1 
  

## MAPEIA UNIDADE DE REDE ##

#New-PSDrive -Name "Y" -PSProvider FileSystem -Root "\\bnu-aol\Fingolo\" -Persist

cd D:\Fingolo\BennerSaude\PACOTES\MG\$Versao

## COPIAR ARQUIVOS LOTE ##
Copy-Item -Path D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$RAnterior -Recurse -Destination D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\
cd D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\
Remove-Item artefatos -Recurse
Copy-Item -Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO -Recurse -Destination D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\artefatos


# COPIA ARQUIVOS DIRETÓRIOS ##
if ($Versao -le '4.0.29')
{
    if(Test-Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\DLLS_WEB)
    {
        Copy-Item -Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\DLLS_WEB\*.* -Recurse -Destination D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\DLLS_WEB -Force
        Copy-Item -Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\DLLS_WEB\*.* -Recurse -Destination D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\ -Force
        $WEB = 1
    }

    if(Test-Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\SERVERFILES)
    {
        Copy-Item -Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\SERVERFILES\*.* -Recurse -Destination D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\ -Force
    }
}
else 
{
    xcopy D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\*.dll D:\Fingolo\DirTMPAtualizador\MG\$Versao\SERVIDOR /y
    xcopy D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\*.bpl D:\Fingolo\DirTMPAtualizador\MG\$Versao\SERVIDOR /y
    xcopy D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\*.mrt D:\Fingolo\DirTMPAtualizador\MG\$Versao\SERVIDOR /y
    xcopy D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\*.xml D:\Fingolo\DirTMPAtualizador\MG\$Versao\SERVIDOR /y

    del D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\*.dll
    del D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\*.bpl
    del D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\*.mrt
    del D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\*.xml

    if(Test-Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\DLLS_WEB)
    {
        Copy-Item -Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\DLLS_WEB\*.* -Recurse -Destination D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\DLLS_WEB -Force
        Copy-Item -Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\DLLS_WEB\*.* -Recurse -Destination D:\Fingolo\DirTMPAtualizador\MG\$Versao\SERVIDOR\ -Force
        $WEB = 1
    }

    if(Test-Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\SERVERFILES)
    {
        Copy-Item -Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\SERVERFILES\*.* -Recurse -Destination D:\Fingolo\DirTMPAtualizador\MG\$Versao\SERVIDOR\ -Force
    }
}

## VERIFICAÇÃO ARQUIVOS PASTA #PORTAISWEB ## 
 
if(Test-Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB)
{
    if(Test-Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\PortalServicos.zip)
    {   
        # PORTALSERVICOS - PORTAL #
        $PS_Portal_Origem = "D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\PortalServicos.zip"
        $PS_Portal_Destino = "D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\PortalServicos"
        Remove-Item D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\PortalServicos\PortalServicos -Recurse
        Expand-Archive -Path $PS_Portal_Origem -DestinationPath $PS_Portal_Destino -Force
    }

    if(Test-Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\ServicesPortalServicos.zip)
    {
        # PORTALSERVICOS - SERVICES #
        $PS_Services_Origem = "D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\ServicesPortalServicos.zip"
        $PS_Services_Destino = "D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\PortalServicos"
        Remove-Item D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\PortalServicos\ServicesPortalServicos -Recurse
        Expand-Archive -Path $PS_Services_Origem -DestinationPath $PS_Services_Destino -Force
    }        
     
    if(Test-Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\Schemas_PortalServicos.zip)
    {   
        # PORTALSERVICOS - SCHEMAS #
        $PS_Schemas_Origem = "D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\Schemas_PortalServicos.zip"
        $PS_Schemas_Destino = "D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\PortalServicos\Schemas_PortalServicos"
        Remove-Item D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\PortalServicos\Schemas_PortalServicos\* -Recurse
        Expand-Archive -Path $PS_Schemas_Origem -DestinationPath $PS_Schemas_Destino -Force
    }        
    
    if(Test-Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\WebAplicativo.zip)
    {    
        # PORTALWEB #
        $WebAplicativo_Origem = "D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\WebAplicativo.zip"
        $WebAplicativo_Destino = "D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\"
        Remove-Item  D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\PortalWEB\ -Recurse
        Add-Type -AssemblyName 'System.IO.Compression.Filesystem'
        [System.IO.Compression.ZipFile]::ExtractToDirectory($WebAplicativo_Origem, $WebAplicativo_Destino)
        Copy-Item -Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\WebAplicativo\ -Recurse -Destination D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\ -Force
        Rename-Item -Path D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\WebAplicativo -NewName D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\PortalWEB
    }

    if(Test-Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\ServicesTISS.zip)
    {
        # SERVICESTISS #
        $ServicesTISS_Origem = "D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\ServicesTISS.zip"
        $ServicesTISS_Destino = "D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release"
        Remove-Item D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\ServicesTISS -Recurse
        Expand-Archive -Path $ServicesTISS_Origem -DestinationPath $ServicesTISS_Destino -Force
    }        
     
    if(Test-Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\PTUOnlineWebServices.zip)
    {   
        # PTUONLINEWEBSERVICES #
        $PTUOnlineWebServices_Origem = "D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\PTUOnlineWebServices.zip"
        $PTUOnlineWebServices_Destino = "D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\PTUOnlineWebServices"
        Remove-Item D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\PTUOnlineWebServices -Recurse
        Expand-Archive -Path $PTUOnlineWebServices_Origem -DestinationPath $PTUOnlineWebServices_Destino -Force 
    }        
     
    if(Test-Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\AutorizadorWEB_Compilado.zip)
    {   
        # AUTORIZADORWEB #
        $AutorizadorWEB_Origem = "D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\AutorizadorWEB_Compilado.zip"
        $AutorizadorWEB_Destino = "D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\"
        Remove-Item D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\AutorizadorWEB -Recurse
        Add-Type -AssemblyName 'System.IO.Compression.Filesystem'
        [System.IO.Compression.ZipFile]::ExtractToDirectory($AutorizadorWEB_Origem, $AutorizadorWEB_Destino)
        Copy-Item -Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\AutorizadorWEB_Compilado\ -Recurse -Destination D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\ -Force
        Rename-Item -Path D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\AutorizadorWEB_Compilado -NewName D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\AutorizadorWEB
    }
    
    if(Test-Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\Benner.Saude.Biometria.Instalador.zip)
    {        
        # Benner.Saude.Biometria.Instalador #
        $InstaladorBio_Origem = "D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\Benner.Saude.Biometria.Instalador.zip"
        $InstaladorBio_Destino = "D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\AutorizadorWEB\Biometria"
        Expand-Archive -Path $InstaladorBio_Origem -DestinationPath $InstaladorBio_Destino -Force 
    }

    if(Test-Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\IntHosp.zip)
    {   
        # IntHosp #
        $IntHosp_Origem = "D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\IntHosp.zip"
        $IntHosp_Destino = "D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\"
        Remove-Item D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\IntHosp -Recurse
        Expand-Archive -Path $IntHosp_Origem -DestinationPath $IntHosp_Destino -Force
    } 

    if(Test-Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\ServicoIntegracaoDeploy.zip)
    {   
        # ServicoIntegracaoDeploy #
        $ServicoInt_Origem = "D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\ServicoIntegracaoDeploy.zip"
        $ServicoInt_Destino = "D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\"
        Remove-Item D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\ServicoIntegracaoDeploy -Recurse
        Expand-Archive -Path $ServicoInt_Origem -DestinationPath $ServicoInt_Destino -Force
    } 

    if(Test-Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\Benner.Saude.Web.Service.TISS.EnvioXML.Compiled.zip)
    {   
        # EnvioLoteXML #
        $EnvioXML_Origem = "D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\Benner.Saude.Web.Service.TISS.EnvioXML.Compiled.zip"
        $EnvioXML_Destino = "D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\EnvioLoteXML"
        Remove-Item D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\EnvioLoteXML\* -Recurse
        Expand-Archive -Path $EnvioXML_Origem -DestinationPath $EnvioXML_Destino -Force
    }
    if(Test-Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\PTUOnlineWebServices6_0.zip)
    {   
        # PTUOnlineWebServices6_0 #
        $PTUOnlineWebServices60_Origem = "D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\PTUOnlineWebServices6_0.zip"
        $PTUOnlineWebServices60_Destino = "D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\PTUOnlineWebServices6_0"
        Remove-Item D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\PTUOnlineWebServices6_0 -Recurse
        Add-Type -AssemblyName 'System.IO.Compression.Filesystem'
        [System.IO.Compression.ZipFile]::ExtractToDirectory($PTUOnlineWebServices60_Origem, $PTUOnlineWebServices60_Destino)
        Copy-Item -Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\PTUOnlineWebServices6_0\ -Recurse -Destination D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\ -Force
    }     
    if(Test-Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\PTUOnlineWebServices7_0.zip)
    {   
        # PTUOnlineWebServices7_0 #
        $PTUOnlineWebServices70_Origem = "D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\PTUOnlineWebServices7_0.zip"
        $PTUOnlineWebServices70_Destino = "D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\PTUOnlineWebServices7_0"
        Remove-Item D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\PTUOnlineWebServices7_0 -Recurse      
        Add-Type -AssemblyName 'System.IO.Compression.Filesystem'
        [System.IO.Compression.ZipFile]::ExtractToDirectory($PTUOnlineWebServices70_Origem, $PTUOnlineWebServices70_Destino)
        Copy-Item -Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\PTUOnlineWebServices7_0\ -Recurse -Destination D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\ -Force
    }
    if(Test-Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\Benner.Saude.InstaladorServicoBiometrico.exe)
    {
        Copy-Item D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\Benner.Saude.InstaladorServicoBiometrico.exe -Recurse -Destination D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\AutorizadorWEB\biometriaSDK2009 -Force
    }

    if(Test-Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\Services.Atendimento.zip)
    {   
        # Services.Atendimento #
        $ServicesAtend_Origem = "D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#PORTAISWEB\Services.Atendimento.zip"
        $ServicesAtend_Destino = "D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\"
        Remove-Item D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\Services.Atendimento -Recurse
        Expand-Archive -Path $ServicesAtend_Origem -DestinationPath $ServicesAtend_Destino -Force
    } 
  
  $WEB = 1 
}

## VERIFICAÇÃO ARQUIVOS PASTA #WEBAPP ## 
if(Test-Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#WEBAPP)
{
    Copy-Item -Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\#WEBAPP\* -Recurse -Destination D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\WEBAPP -Force
    $WEB = 1
}

if(Test-Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\BSPTUConfig.exe)
{
    Copy-Item -Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\BSPTUConfig.exe -Recurse -Destination D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\ -Force
    $WEB = 1
}

if(Test-Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\BSPTUService.exe)
{
    Copy-Item -Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\BSPTUService.exe -Recurse -Destination D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\ -Force
    $WEB = 1
}

if(Test-Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\BSURAServer.exe)
{
    Copy-Item -Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\BSURAServer.exe -Recurse -Destination D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\ -Force
    $WEB = 1
}

## COMPACTAÇÃO ATUALIZACAO_WEB.ZIP ## 
if ($WEB -eq 1)
{
    Remove-Item ATUALIZACAO_WEB.zip -Recurse
    $path = "D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\"
    $destination = Join-Path $path "ATUALIZACAO_WEB.zip"
    $exclude = @("artefatos")
    $files = Get-ChildItem -Path $path -Exclude $exclude
    Compress-Archive -Path $files -DestinationPath $destination -CompressionLevel Fastest
    Copy-Item -Path D:\Fingolo\BennerSaude\PACOTES\MG\$Versao\$Release\ATUALIZACAO_WEB.zip -Recurse -Destination D:\Fingolo\BennerSaude\PACOTES\ATUALIZACOES\MG\$Versao\ -Force
    
    ## DELETA PASTAS ##
    cd  D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\
    Remove-Item DLLS_WEB -Recurse
    Remove-Item SERVERFILES -Recurse
    Remove-Item '#PORTAISWEB' -Recurse
    Remove-Item '#WEBAPP' -Recurse
}

## ARQUIVOS SQL ##
if(Test-Path D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO\*.SQL)
{
    [void](Read-Host 'HÁ ARQUIVOS .SQL NA PASTA D:\Fingolo\DirTMPAtualizador\MG\$Versao\APLICAÇÃO - PARA ANEXAR AO E-MAIL (Press any key to continue...)' )
}


#Remove-PSDrive Y