Import-Module Microsoft.PowerShell.Utility

# Check number of args
If ($args.Count -ne 1) {
    Write-Host "Please supply a file path."
    Exit
}

$SourcePath = $args[0]

#Check if the path is valid
If (-not(Test-Path $SourcePath)) {
    Write-Host "Please enter a valid Path."
    Exit
}

#Displaying order before sort
Write-Host "Sorting based on Name and date modified..."
$GetContent = Get-ChildItem -Recurse $SourcePath
$GetContent| Format-Table -Property Length, Name

# Sort the objects
$Sorted = "Get-ChildItem -Recurse $SourcePath | Sort-Object -Property Length, Name"

# Displaying new order in the folder
Write-Host "Displaying order of the folder..."
Invoke-Expression $Sorted | Format-Table -Property Length, Name