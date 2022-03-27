If ($args.Count -lt 1) {
    Write-Host "Please supply valid hex text file"
    Exit
}
$SourcePath = $args[0]
#Check if the path is valid
If (-not(Test-Path $SourcePath -PathType Leaf)) {
    Write-Host "Please enter a valid text file."
    Exit
}

Get-Content $SourcePath | ForEach-Object {[Convert]::ToInt64($_)}