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

Write-Host "Sorting based on Name and date modified..."
# Sort the objects
$Sorted = "Get-ChildItem -Recurse $SourcePath | Sort-Object -Property Length, Name"

# Displaying new order in the folder
Write-Host "Displaying new order of the folder..."
Invoke-Expression $Sorted | Format-Table -Property Length, Name