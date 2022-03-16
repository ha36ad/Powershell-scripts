# Check number of arguments
If ($args.Count -ne 2) {
    Write-Host "Please enter a valid file path and a destination folder."
    Exit
}
$SourcePath = $args[0]
$DestinationPath = $args[1]

# Check if file paths are valid
if (-not (Test-Path $SourcePath -PathType Leaf)) {
     Write-Host "Invalid file Path."
 }
 elseif (-not (Test-Path $DestinationPath)) {
     Write-Host "Invalid Destination Path."
 }

 # Check if the file exists in the destination folder
 $FileName = Split-Path -Path $SourcePath -Leaf
 $DesFilePath = $DestinationPath + "\" + $FileName
 if (-not (Test-Path $DesFilePath -PathType Leaf)) {
    try {
        $null = New-Item -ItemType File -Path $DesFilePath -Force -ErrorAction Stop
        Copy-Item $SourcePath $DesFilePath  -Force -ErrorAction Stop
    }
    catch {
        throw $_.Exception.Message
    }
}
 else {
     $null = Read-Host -Prompt "The file already exists, would you like to overwrite its contents? Yes(Y) No(N)"
     if ($null -eq 'Y') {
        try {
            $null = Copy-Item $SourcePath $DesFilePath -Force -ErrorAction Stop
       }
       catch {
           throw $_.Exception.Message
       }
     }
 }
 

