$EhServidor = Read-Host "É Servidor? (S / N)?"
$Caminho = Read-Host "Informe o caminho contendo a imagem do Windows para instalação do .NetFramework 3.5. (Ex: D:/Sources/SxS/)"

Set-ExecutionPolicy Bypass -Scope Process

Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServer
Enable-WindowsOptionalFeature -Online -FeatureName IIS-CommonHttpFeatures
Enable-WindowsOptionalFeature -Online -FeatureName     IIS-DefaultDocument
Enable-WindowsOptionalFeature -Online -FeatureName     IIS-DirectoryBrowsing
Enable-WindowsOptionalFeature -Online -FeatureName     IIS-HttpErrors
Enable-WindowsOptionalFeature -Online -FeatureName     IIS-StaticContent

Enable-WindowsOptionalFeature -Online -FeatureName IIS-HealthAndDiagnostics
Enable-WindowsOptionalFeature -Online -FeatureName     IIS-HttpLogging

Enable-WindowsOptionalFeature -Online -FeatureName IIS-Performance
Enable-WindowsOptionalFeature -Online -FeatureName     IIS-HttpCompressionStatic
Enable-WindowsOptionalFeature -Online -FeatureName     IIS-HttpCompressionDynamic

Enable-WindowsOptionalFeature -Online -FeatureName IIS-Security
Enable-WindowsOptionalFeature -Online -FeatureName     IIS-RequestFiltering
Enable-WindowsOptionalFeature -Online -FeatureName     IIS-BasicAuthentication
Enable-WindowsOptionalFeature -Online -FeatureName     IIS-WindowsAuthentication

Enable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationDevelopment

if ($EhServidor -eq 'S') 
{ 
## IF SERVER ##
Enable-WindowsOptionalFeature -Online -FeatureName     IIS-NetFxExtensibility
Enable-WindowsOptionalFeature -Online -FeatureName     IIS-NetFxExtensibility45
Enable-WindowsOptionalFeature -Online -FeatureName     IIS-ASP
Enable-WindowsOptionalFeature -Online -FeatureName     IIS-ASPNET
Enable-WindowsOptionalFeature -Online -FeatureName     IIS-ASPNET45
Enable-WindowsOptionalFeature -Online -FeatureName     WAS-NET-Environment
Install-WindowsFeature Net-Framework-Core -source $Caminho
Enable-WindowsOptionalFeature -Online -FeatureName     WCF-Services45 
Enable-WindowsOptionalFeature -Online -FeatureName         WCF-HTTP-Activation45 
Enable-WindowsOptionalFeature -Online -FeatureName         WCF-Pipe-Activation45 
Enable-WindowsOptionalFeature -Online -FeatureName         WCF-TCP-Activation45 
Enable-WindowsOptionalFeature -Online -FeatureName         WCF-TCP-PortSharing45
}
else
{
## IF LOCAL ##
dism /online /enable-feature /all /featurename:IIS-ASPNET45
dism /online /enable-feature /all /featurename:IIS-ASP
dism /online /enable-feature /all /featurename:IIS-NetFxExtensibility
dism /online /enable-feature /all /featurename:IIS-NetFxExtensibility45
dism /online /enable-feature /all /featurename:IIS-ASPNET
Dism /online /enable-feature /featurename:NetFx3 /All /Source:$Caminho /LimitAccess
dism /online /enable-feature /all /featurename:WCF-Services45
dism /online /enable-feature /all /featurename:WCF-HTTP-Activation45
dism /online /enable-feature /all /featurename:WCF-TCP-Activation45
dism /online /enable-feature /all /featurename:WCF-Pipe-Activation45
dism /online /enable-feature /all /featurename:WCF-MSMQ-Activation45
dism /online /enable-feature /all /featurename:WCF-TCP-PortSharing45
}

Enable-WindowsOptionalFeature -Online -FeatureName     IIS-ISAPIExtensions
Enable-WindowsOptionalFeature -Online -FeatureName     IIS-ISAPIFilter

Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerManagementTools
Enable-WindowsOptionalFeature -Online -FeatureName     IIS-ManagementConsole
