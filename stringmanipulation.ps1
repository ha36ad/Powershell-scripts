# Check number of args
If ($args.Count -lt 2) {
    Write-Host "Please supply a file path and a string."
    Exit
}

$SourcePath = $args[0]
$NameStr = $args[1]

#Check if the path is valid
If (-not(Test-Path $SourcePath -PathType Leaf)) {
    Write-Host "Please enter a valid Path."
    Exit
}

# Find substrings of length greater or equal to 2, then return a list of them
function Find-Substring([String] $name) {
    $los = New-Object Collections.Generic.List[String]
    $strlen = $name.Length
   for ($i = 0; $i -lt $strlen; $i++) {
        $temp = $name.Substring($i, $strlen - $i)
        if (($temp.Length -le $strlen) -and ($temp.Length -gt 1)) {
            $los.add($temp)
        }
       }
    return $los
}

# Get file contents
$filecontent = Get-Content -Path $SourcePath
# Get a list of strings
$Substrings = Find-Substring $NameStr
# Create a list of suggestions
$suggestions = New-Object Collections.Generic.List[String]
foreach ($content in $filecontent) {
    # Loop through list of substrings and break when a match is found
    foreach ($string in $Substrings) {
        if ($content -match $string){
            $suggestions.Add($content)
            break
        }
    }
}

# Display Suggestions
foreach ($i in $suggestions) {
    Write-Host $i
}

