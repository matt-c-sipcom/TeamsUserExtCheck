# Connect to Microsoft Teams
Connect-MicrosoftTeams

# Get the current date and format it
$date = Get-Date -Format yyyy-MM-dd

# Get the tenant display name, or set it to 'Unknown' if it cannot be retrieved
try {
    $tenant = (Get-CsTenant).DisplayName
}
catch {
    Write-Host "Error retrieving tenant display name: $_"
    $tenant = 'Unknown'
}

# Get the results of the search
$results1 = Get-CsOnlineUser | Where-Object { $_.LineURI -match 'x' -and ($_.TeamsUpgradeEffectiveMode -eq 'TeamsOnly' -or $_.TeamsUpgradeEffectiveMode -eq 'Islands') } | Select-Object UserPrincipalName, LineUri

# If there are results, print them; otherwise, display a message
if ($results1) {
    Write-Host "Microsoft Teams-enabled users with extensions in their direct routing number found and listed in the table below.`n`n"
    $results1 | Format-Table UserPrincipalName, LineUri
}
else {
    Write-Host "No Microsoft Teams-enabled users with extensions in their direct routing number found.`n`n"
}
