<#
    .SYNOPSIS
        Bootstrap function of profile
    .DESCRIPTION
        Responsible for creating the profile file if not present, and using the profile .json file to set the different options
        for the corresponding Powershell Profile.

        The Profile can hold many different attributes but some of the more common ones are: 
            - Username, powershell directory location, shortcuts, and data used for accessing SSH, public keys and stuff like that.
        
#>
function Get-ProfileBootstrap {
    [cmdletbinding()]
    param ()

    <#
        If the theme is loaded incorrectly, this is the backup switch operator
        Or if the profile is not yet created, load the default.

        Standard timing issue.
    #>
    $Global:ThemeName = "Default"

    # Let us assume the file does not exist
    if (-not(Test-Path -Path "$($ProtectedObjects.PSUserdataDirectory)/userdata.json")) {
        # If the file does not exist Create a new one
        Set-UserDataConstruct
    } else {
        # If the file exists get the data and use it
        Get-UserDataConstruct
    }
}

function Set-UserDataConstruct {
    [cmdletbinding(SupportsShouldProcess)]
    param (
        [parameter(Mandatory=$false)]
        [string] $Username = $env:USERNAME,

        [parameter(Mandatory=$false)]
        [string] $DefaultTheme = "Default"
    )

    <#
        Extra check in terms of Parameter handling
    #>
    if ([string]::IsNullOrEmpty($Username)) {
        Write-Error -Message "Username can not be null or empty!"
        return 1
    }

    if ([string]::IsNullOrEmpty($DefaultTheme)) {
        Write-Error -Message "DefaultTheme can not be null or empty"
        return 1
    }

    $UserDataFile = "$($ProtectedObjects.PSUserdataDirectory)\userdata.json"

    # Start by creating the directory in the correct location
    if (-not(Test-Path -Path $ProtectedObjects.PSUserdataDirectory))  {
        if($PSCmdlet.ShouldProcess("$($ProtectedObjects.PSUserdataDirectory)")) {
            New-Item -Path $ProtectedObjects.PSUserdataDirectory -ItemType Directory
        }
    }

    $Data = New-Object PSObject -Property @{
        Username = $Username
        DefaultTheme = $DefaultTheme
    }

    $Data = $Data | ConvertTo-Json

    

    if($PSCmdlet.ShouldProcess("$($UserDataFile)")) {
        New-Item -Path $UserDataFile -Value $Data -ItemType File
    }
}

function Get-UserDataConstruct {
    [cmdletbinding()]
    param ()

    # File is expected to be found at this point so let us assume the file exists
    # This function should be private as in only accessible from the module itself,
    # not in the terminal. (I Hope.) This can probably be a big problem if it is accessible from the outisde tho.
    # Let us check afterwards

    <#
        Load everything from the UserDataConstruct in the file
    #>
    $UserDataFile = "$($ProtectedObjects.PSUserdataDirectory)\userdata.json"

    $UserData = Get-Content -Path $UserDataFile | ConvertFrom-Json

    $Global:Username = $UserData.Username
    $Global:ThemeName = $UserData.DefaultTheme
}