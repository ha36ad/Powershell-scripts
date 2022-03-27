If ($args.Count -lt 2) {
    Write-Host "Enter a valid table and delimiter."
    Exit
}

ConvertTo-Csv -InputObject $args[0] -Delimiter $args[1]