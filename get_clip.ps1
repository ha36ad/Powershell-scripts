# Check number of args
If ($args.Count -lt 1) {
    Write-Host "Enter a pattern."
    Exit
}
$MatchPat = $args[0]
Get-Clipboard | Where-Object {$_ -match $MatchPat}