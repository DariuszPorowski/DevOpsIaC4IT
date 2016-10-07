#
# Swap deployment slots in AppService
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
    [String]$SourceSlot,

    [Parameter(Mandatory = $true)]
    [ValidatePattern("^[a-zA-Z0-9]*$")]
    [String]$TargetSlot
)

Write-Output "Swaping slots in $WebAppName app in $ResourceGroupName resource group. From $SourceSlot to $TargetSlot."
$ParametersObject = @{targetSlot  = "$TargetSlot"}
$ResourceName = "$WebAppName/$SourceSlot"
Invoke-AzureRmResourceAction -ResourceGroupName $ResourceGroupName -ResourceType Microsoft.Web/sites/slots -ResourceName $ResourceName -Action slotsswap -Parameters $ParametersObject -ApiVersion 2015-07-01 -Confirm:$false -Force -Verbose