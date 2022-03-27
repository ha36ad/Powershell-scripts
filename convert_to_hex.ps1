# Check number of args
If ($args.Count -lt 1) {
    Write-Host "Please supply a string to convert to  hex."
    Exit
}

$Hex = $args[0] | Format-Hex
Write-Host $Hex