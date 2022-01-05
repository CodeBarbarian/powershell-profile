<#
    PSTodo is the simplest command tool to track your todo task. 
    Stored in Json for easy use
#>
function Get-Todo {
    [cmdletbinding()]
    param (
        [switch] $All
    )
    $Logo = "

    ████████╗ ██████╗ ██████╗  ██████╗     ██╗     ██╗███████╗████████╗
    ╚══██╔══╝██╔═══██╗██╔══██╗██╔═══██╗    ██║     ██║██╔════╝╚══██╔══╝
       ██║   ██║   ██║██║  ██║██║   ██║    ██║     ██║███████╗   ██║   
       ██║   ██║   ██║██║  ██║██║   ██║    ██║     ██║╚════██║   ██║   
       ██║   ╚██████╔╝██████╔╝╚██████╔╝    ███████╗██║███████║   ██║   
       ╚═╝    ╚═════╝ ╚═════╝  ╚═════╝     ╚══════╝╚═╝╚══════╝   ╚═╝   
                                                                           
    "

    $FullPath = ("$($ProtectedObjects.PSUserdataDirectory)/todo.json")

    if (Test-Path $FullPath) {
        $Logo

        $Content = Get-Content -Path $FullPath
        $Content = $Content | ConvertFrom-Json
         
        $Output = $Content
        $Output | Select-Object Title, Description, Status, Priority | Sort-Object priority
    }
}