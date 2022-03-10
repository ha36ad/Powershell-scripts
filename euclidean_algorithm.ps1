
function find_gcd {
    param (
        [parameter (Mandatory, HelpMessage="Please supply two integers")]
        [int32]$a,
        [parameter (Mandatory, HelpMessage="Please supply two integers")]
        [int32]$b
    )
    $Absa = [Math]::Abs($a)
    $Absb = [Math]::Abs($b)
   
    if ($Absa -eq 0) {
        return $Absb
    }
    else {
        return find_gcd($Absb % $Absa) $Absa
    }
}

$gcd = find_gcd
Write-Host $gcd