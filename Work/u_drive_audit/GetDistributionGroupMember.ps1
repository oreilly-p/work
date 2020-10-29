# To install the tools required
# Open Powershell as administrator

# To install necessary modules execution policy should be set to unrestricted
Set-ExecutionPolicy Unrestricted

# Install the following two modules. The first one may already be installed
Install-Module PowerShellGet
Install-Module -Name ExchangeOnlineManagement -RequiredVersion 2.0.3

#*******************************************************************************

# To run this script once the necessary tools have been installed
# You should only have to perform the following two steps. Enter your email in place of the <prompt> below. 
Connect-ExchangeOnline -UserPrincipalName <enter_your_email>@manorfarm.ie -ShowProgress $true

Get-DistributionGroupMember -Identity "SafeTraceEvros" | format-table 'name'

