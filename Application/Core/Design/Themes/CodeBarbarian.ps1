<#
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    .SYNOPSIS
        Powershell Layout - Version 1.0 
        Designed and Developed by Morten Haugstad
    .DESCRIPTION
        This is a theme structure. Theme Configuration must have the 
        following options:
            - Author, Version, and Contact information
            - Colors for the Theme
            - Other options

        It is important to remember that all functions which are included
        in the theme will be loaded into the current powershell session!

        So you can in fact override already existing functions in 
        powershell by simply creating a function in your theme and using it 
        in powershell and the powershell pipeline.

        This structure is created so that all powershell themes in this
        framework are created equal. A common ground upon which we create
        success....

        Just make sure to organize everything and put them into their correct
        place.

        .NOTES
            Another note about functions! Remember to use a prefix related
            to the theme name on your functions on your theme. That way
            we know what these functions are and why they are loaded into the 
            environment of powershell.

            Standard Functions which will be in all themes are
                Get-ThemeHeader
                Get-ThemePrompt (This simply gets the Global Prompt)
                Get-ThemeBootstrap
                
            Other functions in the theme should have a prefix like
                Verb-PrefixFunctionNam
            Example:
                Get-CBBStackTrace  <- This function would get my stacktrace
                Get-CBBGithubRepo  <- Gets my repo
                Get-CBBSomething   <- Gets something

            This is because everything in the theme files are loaded into the
            powershell environment.

            With great power comes great responsibility, or privilieged access.
            Whatever comes first.
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#>

<#
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    Theme Configuration Goes here
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#>
$Global:ThemeAuthor  = "Morten Haugstad"
$Global:ThemeVersion = "1.0"
$Global:ThemeContact = "morten.haugstad@gmail.com"
$Global:ThemeLink    = "https://github.com/codebarbarian/"

$Global:VerbosePreference = "SilentlyContinue"
$Global:ErrorActionPreference = "SilentlyContinue"
$Global:WarningPreference = "SilentlyContinue"

<#
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    Ascii Art Functions for the theme
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#>
function Get-CBBThemeHeaderCube {
    [cmdletbinding()]
    [OutputType([string])] 
    param (
        [string] $Color = "Blue"
    )
    
    Write-Host("
                                         ___        ______
                                        /__/\   ___/_____/\
                                        \  \ \ /         /\\
                                         \  \ \____     /  \
                                       ___\  \ \  /\___/___ \               
                                      /  / \__\/ /  \     /\ \          
                                 ____/  /_______/    \   / _\/_____     
                                /   /   \       \    /  / /       /\    
                             __/   /     \       \  /  / /       / _\__
                            / /   /       \_______\/  / /       / /   /\   
                           /_/___/___________________/ /_______/ /___/  \
                         https://github.com/codebarbarian/fuzzy-barnacle
                            \_\   \  /          /\    \ \       \ \___\/
                               \   \/          /  \    \ \       \  /
                                \__/          /    \    \ \_______\/    
                                  /__________/      \    \  /
                                  \   _____  \      /_____\/
                                   \ /    /\  \    /   \  \ \
                                    /____/  \  \  /     \  \ \
                                    \    \  /___\/       \  \ \
                                     \____\/              \__\/
    ") -ForegroundColor $Color
}

function Get-CBBThemeHeaderText {
    [cmdletbinding()]
    [OutputType([string])]
    param (
        [string] $Color = "White"
    )

    Write-Host("
    ██████╗ ██████╗ ██████╗ ███████╗██████╗  █████╗ ██████╗ ██████╗  █████╗ ██████╗ ██╗ █████╗ ███╗   ██╗
   ██╔════╝██╔═══██╗██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║██╔══██╗████╗  ██║
   ██║     ██║   ██║██║  ██║█████╗  ██████╔╝███████║██████╔╝██████╔╝███████║██████╔╝██║███████║██╔██╗ ██║
   ██║     ██║   ██║██║  ██║██╔══╝  ██╔══██╗██╔══██║██╔══██╗██╔══██╗██╔══██║██╔══██╗██║██╔══██║██║╚██╗██║
   ╚██████╗╚██████╔╝██████╔╝███████╗██████╔╝██║  ██║██║  ██║██████╔╝██║  ██║██║  ██║██║██║  ██║██║ ╚████║
    ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝
   ") -ForegroundColor $Color
}

function Get-CBBThemeExtraOptions {
    [cmdletbinding()]
    [OutputType([string])]
    param (
        [string] $Color1 = "White",
        [string] $Color2 = "White",
        [string] $Color3 = "White"
    )

    Write-Host("          ") -NoNewline

    Write-Host("Author: ") -ForegroundColor White -NoNewline
    Write-Host("[$Global:ThemeAuthor] - ") -ForegroundColor Blue -NoNewline
    
    Write-host("Version: ") -ForegroundColor White -NoNewline
    Write-Host(" [v$Global:ThemeVersion] - ") -ForegroundColor Blue -NoNewline

    Write-Host("Contact: ") -ForegroundColor White -NoNewline
    Write-Host("[$Global:ThemeContact]") -ForegroundColor Blue
}

function Get-CBBThemeSeparationLine {
    [cmdletbinding()]
    [OutputType([string])]
    param (
        [string] $Color = "Blue"
    )
    Write-Host("")
    Write-Host("================================================================================================================") -ForegroundColor $Color
    Write-Host("")
}

<#
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    Required Theme Functions - Loader, structure, setter, getter so on
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#>

function Get-ThemeHeader {
    [cmdletbinding()]
    [OutputType([void])]
    param ()
    # Load the Header Separatation Line
    Get-CBBThemeSeparationLine

    # Load the Cube
    Get-CBBThemeHeaderCube -Color Blue

    # Load the Text
    Get-CBBThemeHeaderText -Color White

    # Load the Extra Options
    Get-CBBThemeExtraOptions

    # Load the Header Separation Line
    Get-CBBThemeSeparationLine
}

function Get-ThemeBootstrap {
    [cmdletbinding()]
    [OutputType([void])]
    param ()

    # Clear Host
    Clear-Host
    
    # Get Theme Header
    Get-ThemeHeader
}

<#
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    Custom Functions used in the theme goes under here
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#>
function Get-ThemeRequirements {
    [cmdletbinding()]
    [OutputType([void])]
    param ()

    Write-Host("")
    Write-Host("Theme Requirements") -ForegroundColor Red
    Write-Host("")

    Write-Host("
        [ - ] In Windows 10, the language/region beta function: Use Unicode UTF-8 for Worldwide Langauge Support must be enabled
    
        [ - ] Theme needs to be run in the ConsoleHost Powershell Environment

        [ - ] Minimum Powershell Version is 5.1
        ")
}

<#
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    Functions which are run before the theme are displayed
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#>

<#
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    Set the powershell window title
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#>

# Set the Windows powershell Title
$Host.UI.RawUI.WindowTitle = "$($ProtectedObjects.Nickname) | " + "Powershell Build - " + $PSVersionTable.PSversion

<#
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    Load the theme with header and everything
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#>
Get-ThemeBootstrap

<#
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    Prompt
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#>
function global:prompt {
    # Time
    $Time = Get-Date -Format ("HH\:mm\:ss")

    # Output Time
    Write-Host("[$($Time)]") -ForegroundColor White -BackgroundColor Red -NoNewline

    # Name
    Write-Host("[$(whoami)]") -ForegroundColor White -BackgroundColor Blue -NoNewline

    # Location
    Write-Host("$(Get-CustomDirectory)") -ForegroundColor White -BackgroundColor Green -NoNewline

    # Namespace
    if (-not([string]::IsNullOrEmpty($Global:Namespace))) {
        # We are in namespace
        Write-Host("($(Get-Namespace))") -ForegroundColor Yellow
    }

    # Symbol
    Write-Host ("#") -nonewline -foregroundcolor White
    return " "
}

function Get-ThemePrompt {
    prompt
}

<#
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    Functions which are run after the theme are loaded
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#>