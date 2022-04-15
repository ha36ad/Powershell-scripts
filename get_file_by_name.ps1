If ($args.Count -lt 2) {
    Write-Host "Please supply a folder path and a name."
    Exit
}
$SourcePath = $args[0]
$MatchPat = $args[1]
# Check if the path is valid
If (-not(Test-Path $SourcePath -PathType Container)) {
    Write-Host "Please enter a valid folder path."
    Exit
}
$Result = Get-ChildItem -Path $SourcePath -Recurse |  Where-Object {$_.name -match $MatchPat} | Select Fullname, Extension
If ($null -eq $Result) {
    Write-Host "no matches found."
}
else {
    $Result | Format-Table -AutoSize -Property FullName,Extension
}