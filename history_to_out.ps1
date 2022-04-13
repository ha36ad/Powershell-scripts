# Check number of args
If ($args.Count -lt 1) {
    Write-Host "Enter a path."
    Exit
}
$Path = $args[0]
try {
    history | out-file $Path
}
catch {
    Write-Error $_
}
