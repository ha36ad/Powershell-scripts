If ($args.Count -lt 1) {
    Write-Host "Please supply enter a positive integer for your password length."
    Exit
}
$Length = $args[0]
If ($Length -le 0) {
    Write-Host "Please enter a positive integer length greater than 0."
    Exit
}
$ArrChar = (33..126)         
$String = -join ($ArrChar | 
Get-Random -Count $Length | ForEach-Object {[char]$_})
$String | clip