If ($args.Count -lt 2) {
    Write-Host "Please supply a description and a restore type."
    Exit
}
Checkpoint-Computer -Description $args[0] -RestorePointType $args[1]