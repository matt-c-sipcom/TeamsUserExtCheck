# TeamsUserExtCheck


This script will provide visibility to a Administrator of which users within their Microsoft Teams tenant have an extension assigned as part of their number.
It retrieves the UPN and LineUri parameters for matching users. The information is presented in a table format to the user running the script locally in their console only.

The script connects to your AzureAD tenant using the Teams PowerShell Module and requires "Teams Administrator" permissions to run.
