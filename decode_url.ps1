# Check number of args
If ($args.Count -lt 1) {
    Write-Host "Enter an url."
    Exit
}
$SourceStr = $args[1]
try {
    [System.Web.HTTPUtility]::UrlDecode($SourceStr)
}
catch {
    Write-Error $_
}