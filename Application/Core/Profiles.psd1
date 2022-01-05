@{
# Script module or binary module file associated with this manifest.
RootModule = 'Profiles.psm1'

# Version number of this module.
ModuleVersion = '0.0.1'

# ID used to uniquely identify this module
GUID = '40631413-c274-4e36-90e4-1dc115369e10'

# Author of this module
Author = 'Morten Haugstad'

# Company or vendor of this module
CompanyName = 'n/a'

# Copyright statement for this module
Copyright = '(c) 2021 Morten Haugstad. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Profile dependency, setter/getter.'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '5.1'

# Name of the Windows PowerShell host required by this module
PowerShellHostName = 'ConsoleHost'

# Minimum version of the Windows PowerShell host required by this module
PowerShellHostVersion = '5.1'

# Processor architecture (None, X86, Amd64) required by this module
ProcessorArchitecture = 'Amd64'

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
ScriptsToProcess = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @('Get-ProfileBootstrap')

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()
}