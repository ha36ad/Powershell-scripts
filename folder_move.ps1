$SourcePath = Read-Host -Prompt 'Input a Source Path'
$DestinationPath = Read-Host -Prompt 'Input a destination Path'


If ((Test-Path $SourcePath) -and (Test-Path $DestinationPath)) {
   Move-Item -Path $SourcePath -Destination $DestinationPath
   Write-Host "Move Successful."
}
elseif (-not (Test-Path $SourcePath)) {
    Write-Host "Invalid Source Path."
}
else {
    Write-Host "Invalid Destination Path."
}