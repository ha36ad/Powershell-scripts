If ($args.Count -lt 2) {
    Write-Host "Please supply a file path and a name."
    Exit
}
$SourcePath = $args[0]
$Name = $args[1]
# Check if the path is valid
If (-not(Test-Path $SourcePath -PathType Leaf)) {
    Write-Host "File path does not exist creating..."
    try {
         New-Item -Path $SourcePath -Name $Name
    }
    catch {
        Write-Error $_
    }
}
else {
    Write-Host "File already exists at the desired path."
}
