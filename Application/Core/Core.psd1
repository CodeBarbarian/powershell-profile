@{

# Script module or binary module file associated with this manifest.
RootModule = 'Core.psm1'

# Version number of this module.
ModuleVersion = '1.0'

# ID used to uniquely identify this module
GUID = 'c03bb805-6399-4e41-8b18-86465bbb22df'

# Author of this module
Author = 'Morten Haugstad'

# Company or vendor of this module
CompanyName = 'n/a'

# Copyright statement for this module
Copyright = '(c) 2021 Morten Haugstad. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Core functions used in this powershell profile '

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
FunctionsToExport = @('*')

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()
}