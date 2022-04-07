
# Check number of args
If ($args.Count -lt 1) {
    Write-Host "Enter a valid path."
    Exit
}
$SourcePath = $args[0]
# Check if file paths are valid
if (-not (Test-Path $SourcePath -PathType Leaf)) {
     Write-Host "Invalid file Path."
     Exit
 }
 Get-Content -Path $SourcePath -Encoding Byte