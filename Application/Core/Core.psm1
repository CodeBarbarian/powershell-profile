<#
.SYNOPSIS
    Get Custom Directory Path - Shows predefined paths instead of a long pathname
.DESCRIPTION
    This function is modifed from one of my favorite Powershell developers
        - Prateek Singh
        - https://geekeefy.wordpress.com/2016/10/19/powershell-customize-directory-path-in-ps-prompt/
.NOTES
        This function is modified by @codebarbarian - https://github.com/codebarbarian
#>
function Get-CustomDirectory {
    [CmdletBinding()]
    [OutputType([String])]
    Param (
        [Parameter(ValueFromPipeline=$true,Position=0)]
        $Path = $PWD.Path
    )

    foreach ($Item in $Path) {
        $Match = ($CustomDirectories.GetEnumerator().name | Where-Object{$Item -eq "$_" -or $Item -like "$_*"} |`
        Select-Object @{n='Directory';e={$_}},@{n='Length';e={$_.length}} |Sort-Object Length -Descending | Select-Object -First 1).directory
        if ($Match) {
            [String]($Item -Replace [regex]::Escape($Match),$CustomDirectories[$Match])            
        } elseif ($pwd.Path -ne $Item) {
            $Item
        } else {
            $pwd.Path
        }
    }
}

<#
    .SYNOPSIS
        New-Function creates a new function statement
    
    .DESCRIPTION
        If you like to make functions and want to make sure to use a standard of some kind,
        why not just use the New-Function function! This creates a template funtion so all you need
        to do is to write the businees logic, change some values and voila! 

    .PARAMETER Name
        [string] has the default value of Get-FunctionName, but please by all means add whatever name 
        you'd like as long as the function name uses an approvev verb first and camalcase rest.
    
    .PARAMETER Import
        [switch] If you add this parameter it will import the function to this file. The
        Functions.psm1.

    .INPUTS
        NO. The New Function does not support piping objects to it (Yet)
    
    .OUTPUTS
        Mixed. [String] without .PARAMETER Import, [void] with .PARAMETER Import.
    
    .EXAMPLE
        PS> New-Function -Name "Get-FunctionName"
    
    .EXAMPLE
        PS> New-Function -Name "FunctionName" -Import
    
    .EXAMPLE
        PS> New-Functiopn -Import
    
    .LINK
        https://github.com/codebarbarian
#>
function New-Function {
    [cmdletbinding()]
    [OutputType([void])]
    param (
        [string] $Name = "Get-FunctionName",
        [switch] $Import
    )

    $FunctionOutput = '

<#
    .SYNOPSIS
        Short description of '+"$($Name)"+'

    .DESCRIPTION
        Long detailed description of '+"$($Name)"+'

    .PARAMETER PARAMETER1
        If function '+"$($Name)"+' has a parameter add it here, or remove this section

    .INPUTS
        Is it possible to pipe objects to '+"$($Name)"+' function?

    .OUTPUTS
        What does '+"$($Name)"+' Output? String, Integer, Nothing (Void)?

    .EXAMPLE
        '+"$($Name)"+'

    .LINK
        '+"$($Global:ThemeLink)"+'
#>
function '+"$($Name)"+' {
    [cmdletbinding()]
    [OutputType([void])]
    param (
        
    )
    
    # Business logic for '+"$($Name)"+' goes here!
}

'    
    if ($Import) {
        $Path = (Join-Path $ProtectedObjects.PSCoreDirectory "/functions.psm1")
        Add-Content -Path $Path -Value $FunctionOutput | Out-Null
    } else {
        return $FunctionOutput
    }
}

function Resolve-DebugTask {
    [cmdletbinding()]
    param (
        [string] $DebugFileName = $Global:DebugFileName
    )

    if ([string]::IsNullOrEmpty($Global:DebugFileName)) {
        return "Debug can not be run. Use Register-DebugTask"
    } else {
        Remove-Module $DebugFileName
        Import-Module ("$($DebugFileName).psm1")
    }
}

function Register-DebugTask {
    [cmdletbinding()]
    param (
        [string] $ModuleName
    )

    $Global:DebugFileName = $ModuleName
}