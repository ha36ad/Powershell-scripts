# Check number of arguments
If ($args.Count -ne 1) {
    Write-Host "Please enter a valid destination path."
    Exit
}
$DestinationPath = $args[0]

# Check if file paths are valid
if (-not (Test-Path $DestinationPath -PathType Leaf)) {
     Write-Host "Invalid file Path."
 }
 
# Create a HTML table that stores aliases
 try {
    $null = Get-Alias | Where-Object DisplayName,Defintion, Options | ConvertTo-Html  | Out-File $DestinationPath -ErrorAction Stop

}
catch {
    throw $_.Exception.Message
}
 