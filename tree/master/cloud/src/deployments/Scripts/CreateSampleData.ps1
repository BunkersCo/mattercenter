﻿# Accept user credentials
$SPCredential = Get-Credential -Message "Enter credentials to access SharePoint tenant."
If ($Null -eq $SPCredential) {
	# Display error message and exit
	Write-Host "Failed to get credentials" -ForegroundColor Red
	return
}
# Function to get the root path of the script

# Get the current directory of the script
Function ScriptRoot {Split-Path $MyInvocation.ScriptName}
$ScriptDirectory = (ScriptRoot)

# Set the helper files folder path
$HelperPath = "$ScriptDirectory\Helper Utilities"

cd $ScriptDirectory

#----------------------------------------------
# Add sample data to SharePoint
#----------------------------------------------
cd "Helper Utilities"
Write-host ""
Write-host "Adding sample data to the portal"    
& "$HelperPath\Microsoft.Legal.MatterCenter.CreateSampleData.exe" "true" $SPCredential.UserName $SPCredential.GetNetworkCredential().Password
cd..