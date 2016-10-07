#
# Azure RG Unit Test
#

Param(
    [Parameter(Mandatory = $true)]
    [ValidatePattern("^[a-zA-Z0-9-_]*$")]
    [String]$ResourceGroupName,

    [Parameter(Mandatory = $true)]
    [ValidatePattern("^[0-9]*$")]
    [String]$NumberOfResources
)

Write-Output $ResourceGroupName
Write-Output --------
Find-AzureRmResource -ResourceGroupNameContains $ResourceGroupName | Measure-Object

#Testing number of Resources
$NumberOfObjects = Find-AzureRmResource -ResourceGroupNameContains $ResourceGroupName | Measure-Object
Write-Output "Number Of Resources:" $NumberOfObjects.Count
$NumberOfObjectsCount = $NumberOfObjects.Count -eq $NumberOfResources
Write-Output "Test pass:" $NumberOfObjectsCount
if ($NumberOfObjectsCount -like "false") {
    Throw "Ooops!!! Something is wrong with the number of Resources in the Resource Group."
}

#Testing number of Web Apps
$NumberOfObjects = Find-AzureRmResource -ResourceGroupNameContains $ResourceGroupName -ResourceType "microsoft.web/sites" | Measure-Object
Write-Output "Number Of  Web Apps:" $NumberOfObjects.Count
$NumberOfObjectsCount = $NumberOfObjects.Count -eq 1
Write-Output "Test pass:" $NumberOfObjectsCount
if ($NumberOfObjectsCount -like "false") 
{
	Throw "Ooops!!! Something is wrong with the number of Web Apps."
}

#Testing number of Hosting Plans
$NumberOfObjects = Find-AzureRmResource -ResourceGroupNameContains $ResourceGroupName -ResourceType "microsoft.web/serverfarms" | Measure-Object
Write-Output "Number Of  Hosting Plans:" $NumberOfObjects.Count
$NumberOfObjectsCount = $NumberOfObjects.Count -eq 1
Write-Output "Test pass:" $NumberOfObjectsCount
if ($NumberOfObjectsCount -like "false") 
{
	Throw "Ooops!!! Something is wrong with the number of Hosting Plans."
}