# Check number of args
If ($args.Count -lt 2) {
    Write-Host "Please supply a folder path and a file extension."
    Exit
}
$SourcePath = $args[0]
$Extension = "*" + $args[1]
#Check if the path is valid
If (-not(Test-Path $SourcePath -PathType Container)) {
    Write-Host "Please enter a valid Path."
    Exit
}

Get-ChildItem -Path $SourcePath -Filter $Extension -Recurse
