@{
# Version number of this module.
ModuleVersion = '1.0'

# ID used to uniquely identify this module
GUID = '4302cc2b-3d6c-4440-8350-a7112d0b0d23'

# Author of this module
Author = 'Morten Haugstad'

# Company or vendor of this module
CompanyName = 'n/a'

# Copyright statement for this module
Copyright = '(c) 2021 Morten Haugstad. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Entrypoint for Application Powershell Profile'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '5.1'

# Name of the Windows PowerShell host required by this module
PowerShellHostName = 'ConsoleHost'

# Processor architecture (None, X86, Amd64) required by this module
ProcessorArchitecture = 'Amd64'

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @(
    # [Application\Core]
    "$PSScriptRoot\Core\Core.psd1",
    "$PSScriptRoot\Core\Functions.psd1",
    "$PSScriptRoot\Core\Profiles.psd1",
    
    # [Application\Design]
    "$PSScriptRoot\Core\Design\Themes.psd1"

    # External Modules

)

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
ScriptsToProcess = @(
    "$PSScriptRoot\Config\Config.ps1",
    "$PSScriptRoot\Config\Alias.ps1"
)

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @()

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()
}

