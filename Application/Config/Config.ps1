<#
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    Cmdletbinding allows this file to exist in the pipeline
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#>
[cmdletbinding()]
param()

<#
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    ProtectedObjects
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#>

$ProtectedObjects = New-Object PSObject -Property @{
    # Important ojects
    UserProfile             = $ENV:USERPROFILE
    Username                = $ENV:USERNAME

    # PS Directories
    PSProfileDirectory      = ("$(Join-Path $ENV:USERPROFILE Documents\WindowsPowerShell)")
    PSCoreDirectory         = ("$(Join-Path $ENV:USERPROFILE Documents\WindowsPowerShell)\Application\Core")
    PSModuleDirectory       = ("$(Join-Path $ENV:USERPROFILE Documents\WindowsPowerShell)\Application\Modules")

    PSDesignDirectory       = ("$(Join-Path $ENV:USERPROFILE Documents\WindowsPowerShell)\Application\Core\Design")
    PSThemeDirectory        = ("$(Join-Path $ENV:USERPROFILE Documents\WindowsPowerShell)\Application\Core\Design\Themes")

    PSDataDirectory         = ("$(Join-Path $ENV:USERPROFILE Documents\WindowsPowerShell)\Application\Data")
    PSUserdataDirectory     = ("$(Join-Path $ENV:USERPROFILE Documents\WindowsPowerShell)\Application\Userdata")
    PSRuntimeDirectory      = ("$(Join-Path $ENV:USERPROFILE Documents\WindowsPowerShell)\Application\Runtime")
}

<#
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    Custom Directories
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#>
$Global:CustomDirectories = @{
    <#
        Non Environment specific 
    #>
    $env:Temp       = '[Temp]'
    $env:AppData    = '[AppData]'
    
    <#
        Powershell Framework/Profile Specific
    #>
    ("$($ProtectedObjects.PSProfileDirectory)")     = '[PS-Profile]'
    ("$($ProtectedObjects.PSModuleDirectory)")      = '[PS-Modules]'
    ("$($ProtectedObjects.PSConfigDirectory)")      = '[PS-Config]'
    ("$($ProtectedObjects.PSDataDirectory)")        = '[PS-Data]'
    ("$($ProtectedObjects.PSThemeDirectory)")       = '[PS-Theme]'
    ("$($ProtectedObjects.PSUserdataDirectory)")    = '[PS-Userdata]'


    <#
        Custom Directories for Windows
    #>
    ("$($ENV:USERPROFILE)")                             = '[User Profile]'
    ("$(Join-Path $ENV:USERPROFILE Desktop)")           = '[Desktop]'
    ("$(Join-Path $ENV:USERPROFILE Documents)")         = '[Documents]'
}

<#
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    Other Configuration Options
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#>
