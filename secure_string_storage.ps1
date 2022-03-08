# Check number of args
If ($args.Count -lt 1) {
    Write-Host "Please supply a file path to store your encrypted string."
    Exit
}

$SourcePath = $args[0]

#Check if the path is valid
If (-not(Test-Path $SourcePath)) {
    Write-Host "Please enter a valid Path."
    Exit
}

#Prompt User to enter a string for encryption then convert to a standard encrypted string
$SecureString = Read-Host "Enter a password" -AsSecureString | ConvertFrom-SecureString
$FileName = Read-host "Enter a file name: "

$SourcePath = $SourcePath + '\'+ $FileName + ".txt"

#Create an output file as a .txt at the specified path
$Securestring | Out-file $SourcePath
