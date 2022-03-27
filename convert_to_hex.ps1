# Check number of args
If ($args.Count -lt 1) {
    Write-Host "Please supply a string to convert to  hex."
    Exit
}

If ($args[1]) {
    $Count = $args[1]
    $Hex = $args[0] | Format-Hex -Count $Count
}
else {
    $Hex = $args[0] | Format-Hex
}


Write-Host $Hex 