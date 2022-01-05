<#
.SYNOPSIS
    Update Mac Address Vendor list with respective mac addresses, first three octets that is.
.DESCRIPTION    
    Updates the Vendor list with respective mac addresses from wireshark's gitweb.
.NOTES
    This function is written by @codebarbarian - https://github.com/codebarbarian
#>
function Update-MacAddressVendor {
    [cmdletbinding(SupportsShouldProcess=$true)]
    param()

    # Path to the wireshark repository
    $APIUrl = 'https://code.wireshark.org/review/gitweb?p=wireshark.git;a=blob_plain;f=manuf;hb=HEAD'

    if ($PSCmdlet.ShouldProcess("Downloading vendor_macaddresses.txt")) {
        Write-Verbose ("Started  downloading vendor_macaddresses.txt from wireshark repository at $(Get-Date)")
        $WebClient = New-Object System.Net.WebClient
        $WebClient.DownloadFile($APIUrl, "$($ProtectedObjects.PSDataDirectory)\vendor_macaddresses.txt")
        Write-Verbose ("Ended at $(Get-Date)")
    }
}

<#
.SYNOPSIS
    Searches through the vendor mac address list, trying to identify vendor of a given mac address,
    and returning the result
.DESCRIPTION
    Uses the vendor_macaddresses.txt located in the powershell/data directory, to lookup vendor of a given mac address
.NOTES
    This function is written by @codebarbarian - https://github.com/codebarbarian
#>
function Get-MacAddressVendor {
    [cmdletbinding()]
    param (
        [parameter(mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$MacAddress
    )

    # Check if the mac_addresses.txt exists, if not download it
    if (Test-Path ("$($ProtectedObjects.PSDataDirectory)\vendor_macaddresses.txt")) {
        Write-Verbose ("mac_addresses.txt exist.")
    } else {
        # Update Mac Address Vendors
        Update-MacAddressVendor
    }

    if ([string]::IsNullOrEmpty($MacAddress)) {
        Write-Host("[*] Input can not be empty or null") -ForegroundColor RED
    }

    # Remove everything we really do not need from the mac address
    $MacAddress = $MacAddress -replace "[-,.:]", ""
    
    # Prepare the placeholder for the search query
    $Placeholder = "HOLD1:HOLD2:HOLD3"
    $Placeholder = $Placeholder.Replace("HOLD1", $MacAddress.Substring(0,2))
    $Placeholder = $Placeholder.Replace("HOLD2", $MacAddress.Substring(2,2))
    $Placeholder = $Placeholder.Replace("HOLD3", $MacAddress.Substring(4,2))

    # Set the mac address to become the mac address in same format as wireshark uses
    $MacAddress = $Placeholder
    
    # Let us just make sure we did not fuck up somewhere
    $RegEx = '(?<macaddr>[0-9A-Fa-f][0-9A-Fa-f]:[0-9A-Fa-f][0-9A-Fa-f]:[0-9A-Fa-f][0-9A-Fa-f])'

    # Get contents from file
    $File = Get-Content ("$($ProtectedObjects.PSDataDirectory)\vendor_macaddresses.txt")

    # Iterate through the file
    foreach ($Line in $File) {
        # Only check on Mac Address first
        if ($Line -match $RegEx) {
            # Check if the mac address is in the list
            if ($Matches.values -Match $MacAddress) {
                # Give response viewing the entire line
                return $Line
            }
        }
    }
}