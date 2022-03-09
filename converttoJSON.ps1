# Check number of args
If ($args.Count -ne 1) {
    Write-Host "Please supply a file path that contains JSON."
    Exit
}

$SourcePath = $args[0]

# Check if the path is valid
If (-not(Test-Path $SourcePath)) {
    Write-Host "Please enter a valid Path."
    Exit
}


# Saving Contents of a file to a variable
$FileContent = Get-Content -Path $SourcePath

# Convert to JSON
$JSONString = "$FileContent | ConvertTo-Json"

# Print new contents of the File
$NewFileContent = "Get-Content -Path $SourcePath"
Write-Host "New Content: "
Invoke-Expression $NewFileContent

# Ask User if they want a copy of the original content
$CreateCopy = Read-Host "Would you like a copy of the old content?: Yes(Y) No(N)"

If (($CreateCopy-eq "Y") -or ($CreateCopy -eq "y")) {
    # Convert back to normal from JSON
    $OldString = Get-Content -Path $SourcePath | ConvertTo-Json | ConvertFrom-Json

    # Grab the home path and basename
    $TempPath = (Get-Item $SourcePath).DirectoryName
    $TempName = (Get-Item $SourcePath).BaseName + "original" + (Get-Item $SourcePath).Extension
    $BackupPath = $TempPath + "\" + $TempName
    New-Item -Path $TempPath -Name $TempName
    # Add content
    Add-Content -Path $BackupPath -value $OldString
    
}