#
# Remove deployment slot from AppService
#

Param(
    [Parameter(Mandatory = $true)]
    [ValidatePattern("^[a-zA-Z0-9-_]*$")]
    [String]$ResourceGroupName,

    [Parameter(Mandatory = $true)]
    [ValidatePattern("^[a-zA-Z0-9-_]*$")]
    [String]$WebAppName,

    [Parameter(Mandatory = $true)]
	[ValidatePattern("^[a-zA-Z0-9]*$")]
    [String]$Slot
)

Write-Output "Removing $Slot slot from $WebAppName app in $ResourceGroupName resource group."
Remove-AzureRmWebAppSlot -Name $WebAppName -ResourceGroupName $ResourceGroupName -Slot $Slot -Force -Verbose