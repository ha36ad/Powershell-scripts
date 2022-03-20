# Check number of args
If ($args.Count -lt 1) {
    Write-Host "Please supply a file path."
    Exit
}

$SourcePath = $args[0]

#Check if the path is valid
If (-not(Test-Path $SourcePath -PathType Leaf)) {
    Write-Host "Please enter a valid file path."
    Exit
}

# Get file contents and return the number of characters and words
Get-Content $SourcePath | Measure-Object -Character -Word | Format-Table -Property Words,Characters