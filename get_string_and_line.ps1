If ($args.Count -lt 2) {
    Write-Host "Please supply a file path and a match."
    Exit
}
$SourcePath = $args[0]
$MatchPat = $args[1]
# Check if the path is valid
If (-not(Test-Path $SourcePath -PathType Leaf)) {
    Write-Host "Please enter a valid file Path."
    Exit
}
$FileContent = Get-Content -Path $SourcePath | select-string $MatchPat
If ($null -eq $FileContent) {
    Write-Host "$MatchPat instances do not exist"
}
else {
    Write-Host $FileContent.LineNumber
}
