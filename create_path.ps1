# Check number of args
If ($args.Count -lt 1) {
    Write-Host "Enter a valid string array that you would like to get converted into a path."
    Exit
}

function Convert-StrPath() {
    Param (
        [String[]] $str_list
    )
    for ($i = 1; $i -lt $str_list.Count; $i++) {
        if ($i -eq $str_list.Count - 1) {
            $temppath += $str_list[$i]
        }
        else {
            $temppath += $str_list[$i] + "\"
        }
    }
    return $temppath
}

$returnval = Convert-StrPath $args
Write-Host $returnval