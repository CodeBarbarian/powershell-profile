function Get-Theme {
    [cmdletbinding()]
    param ()
    return $Global:ThemeName
} 

function Set-Theme {
    [cmdletbinding()]
    param ()
    DynamicParam {
        $Attributes = New-Object System.Management.Automation.ParameterAttribute
        $Attributes.Mandatory = $false

        $AttributeCollection = New-Object -Type System.Collections.ObjectModel.Collection[System.Attribute]
        $AttributeCollection.Add($Attributes)

        $FileSet = Get-ChildItem -Path $ProtectedObjects.PSThemeDirectory -File | Select-Object -ExpandProperty Basename
        #$Fileset.replace(".ps1", "")
        #foreach ($File in $Filset) { $File.Replace(".ps1", "") }

        $ValidateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute($FileSet)
        $AttributeCollection.Add($ValidateSetAttribute)

        $DynamicParameter1 = New-Object -Type System.Management.Automation.RuntimeDefinedParameter("ThemeName", [string], $AttributeCollection)
        $ParameterDictionary = New-Object -Type System.Management.Automation.RuntimeDefinedParameterDictionary
        $ParameterDictionary.Add("ThemeName", $DynamicParameter1)

        return $ParameterDictionary
    } End {
        $ThemeName =  $PSBoundParameters['ThemeName']
        
        # Test if theme exist
        if (Test-Path -Path "$($ProtectedObjects.PSThemeDirectory)\$($ThemeName).ps1") {
            # Business Logic in here if theme exist
            $File = "$($ProtectedObjects.PSThemeDirectory)\$($ThemeName).ps1"
            Invoke-Expression -Command $File
        } else {
            # Continue the shell session, but display the Error to the user that something bad happened!
            Write-Error -Message "Could not load theme $($ThemeName).ps1" -ErrorAction Continue
        }
    }

}

function Use-Theme {
    [cmdletbinding()]
    param (

    )
    # Load the current theme
    Set-Theme -ThemeName $Global:ThemeName
}

function Get-Themes {
    $Files = Get-ChildItem -Path $ProtectedObjects.PSThemeDirectory
    
    $CurrentTheme = Get-Theme
    foreach ($File in $Files) {
        $Filename = $File.Name.replace(".ps1", "")
        if ($CurrentTheme -match $Filename) {
            Write-Host ("[$($Filename)]") -ForegroundColor Green
        } else {
            $Filename
        }
    }
}