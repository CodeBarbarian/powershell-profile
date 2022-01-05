# When we start the profile, make sure to give the user the choice to load the powershell session without the profile.
Clear-Host

# Display text
Write-Host("
██████╗ ███████╗      ██╗      ██████╗  █████╗ ██████╗ ███████╗██████╗ 
██╔══██╗██╔════╝      ██║     ██╔═══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗
██████╔╝███████╗█████╗██║     ██║   ██║███████║██║  ██║█████╗  ██████╔╝
██╔═══╝ ╚════██║╚════╝██║     ██║   ██║██╔══██║██║  ██║██╔══╝  ██╔══██╗
██║     ███████║      ███████╗╚██████╔╝██║  ██║██████╔╝███████╗██║  ██║
╚═╝     ╚══════╝      ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝                                 
            -- Bootstrap function for powershell --


        [1] - Continue with powershell profile
        [2] - Continue without powershell profile
")

$Decision = $false
$PSLoader = $false

while ($Decision -ne $true) {

    $Selection = Read-Host("Please Select an option")

    switch ($Selection) {
        '1' {
            $PSLoader = "Profile"
        }
        '2' {
            $PSLoader = "NoProfile"
        }
    }

    if ($PSLoader -ne $false) {
        $Decision = $true
    }
}

if ($PSLoader -eq "Profile") {
    "Loading with profile"
    # Code for launching with profile

    # Let us first fix the module path, so we don't include system default modules in powershell
    # We only want the standard module path in C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules
    # And ours in Application\Ext-Modules and Application\Int-Modules
    $Env:PSModulePath = ""
    $Env:PSModulePath += "C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules;"
    $Env:PSModulePath += "$(Join-Path $ENV:USERPROFILE Documents)\WindowsPowershell\Application\Ext-Modules;"
    $Env:PSModulePath += "$(Join-Path $ENV:USERPROFILE Documents)\WindowsPowershell\Application\Int-Modules;"

    # Application Directory
    $PSApplicationDirectory = "$(Join-Path $ENV:USERPROFILE Documents)\WindowsPowershell\Application"
    
    # Import the powershell profile
    Import-Module ("$($PSApplicationDirectory)\Application.psd1")

    # Quality of life, starting in the powershell profile
    Set-Location -Path "$(Join-Path $ENV:USERPROFILE Documents)\WindowsPowershell"

    # Load the profile bootstrap for individal preferences
    Get-ProfileBootstrap

    # Use the theme if loaded
    Use-Theme
}

if ($PSLoader -eq "NoProfile") {
    "Loading without profile"
    # Code for launching wihtout profile
    Clear-Host
}


