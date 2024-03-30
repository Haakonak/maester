<#
.SYNOPSIS
    Checks if Default Settings - Consent Policy Settings - Group owner consent for apps accessing data is set to 'False'

.DESCRIPTION

    Group and team owners can authorize applications, such as applications published by third-party vendors, to access your organization's data associated with a group. For example, a team owner in Microsoft Teams can allow an app to read all Teams messages in the team, or list the basic profile of a group's members.

    Queries settings
    and returns the result of
     graph/settings.values | where-object name -eq 'EnableGroupSpecificConsent' | select-object -expand value -eq 'False'

.EXAMPLE
    Test-EidscaCP01

    Returns the result of graph.microsoft.com/beta/settings.values | where-object name -eq 'EnableGroupSpecificConsent' | select-object -expand value -eq 'False'
#>

Function Test-EidscaCP01 {
    [CmdletBinding()]
    param()

    $result = Invoke-MtGraphRequest -RelativeUri "settings" -ApiVersion beta

    $testResult = $result.values | where-object name -eq 'EnableGroupSpecificConsent' | select-object -expand value -eq 'False'

    Add-MtTestResultDetail -Result $testResult
}
