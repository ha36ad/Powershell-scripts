If ($args.Count -lt 1) {
    Write-Host "Enter a path."
    Exit
}
$SourcePath = $args[0]
# Check if file paths are valid
if (-not (Test-Path $SourcePath -PathType Leaf)) {
    Write-Host "Invalid file Path."
    Exit
}

$FileContents = Get-Content $SourcePath
foreach($line in $FileContents) {
   try {
       Invoke-Command $line
   }
   catch {
       Write-Error $_
   }
}

