If ($args.Count -lt 2) {
    Write-Host "Enter a valid path and a destination path."
    Exit
}
$SourcePath = $args[0]
$DestinationPath = $args[1]
# Check if file paths are valid
if (-not (Test-Path $SourcePath -PathType Leaf)) {
     Write-Host "Invalid file Path."
     Exit
}
$file = [io.file]::ReadAllBytes($SourcePath)
[io.file]::WriteAllBytes($DestinationPath,$file)