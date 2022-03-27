# Check number of args
If ($args.Count -lt 2) {
    Write-Host "Enter a valid string and seperator."
    Exit
}

$SourceString = $args[0]
$SplitCond = $args[1]
# Function that splits the string based on the seperator
function Split-String ([String]$Str, [String]$Seperator){
    $temp = $Str -split $Seperator
    return $temp
}

Split-String $SourceString $SplitCond