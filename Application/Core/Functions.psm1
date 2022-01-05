<#
    .SYNOPSIS
        Basic Stack Trace for the profile

    .DESCRIPTION
        Stack trace tackes into account the variables, functions and garbage that is used in the profile

    .PARAMETER PARAMETER1
        No Parameter

    .INPUTS
        No. Get-StackTrace takes no input from Pipeline.

    .OUTPUTS
        Return Void. 

    .EXAMPLE
        Get-StackTrace

    .LINK
        https://github.com/codebarbarian/
#>
function Get-StackTrace {
    [cmdletbinding()]
    [OutputType([void])]
    param ()
    
    # Business logic for Get-StackTrace goes here!


}


