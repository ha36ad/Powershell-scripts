# Check number of args
If ($args.Count -lt 2) {
    Write-Host "Please supply a text file path you want to parse and a proper regex."
    Exit
}

$SourcePath = $args[0]
$RegexPattern = $args[1]

#Check if the path is valid
If (-not(Test-Path $SourcePath -PathType Leaf)) {
    Write-Host "Please enter a valid Path."
    Exit
}

function Search-File ([String]$PathStr, [String]$RegPattern){
    Select-String -Path $SourcePath -Pattern $RegexPattern
}

# Call function
Search-File $SourcePath $RegexPattern

