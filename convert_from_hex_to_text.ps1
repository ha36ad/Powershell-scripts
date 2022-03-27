If ($args.Count -lt 1) {
    Write-Host "Please supply valid hex"
    Exit
}

$HexStr = $args[0]
$SplitStr = $HexStr.Split(" ") | forEach {[char]([convert]::toint16($_,16))}
Write-Host $SplitStr