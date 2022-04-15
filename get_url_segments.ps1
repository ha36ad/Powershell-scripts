If ($args.Count -lt 1) {
    Write-Host "Please supply a url."
    Exit
}
$SourceUrl = [uri] $args[0]
Write-Host $SourceUrl.Segments