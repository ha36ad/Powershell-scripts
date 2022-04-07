If ($args.Count -ne 1) {
    Write-Host "Please supply a file path."
    Exit
}
$SourcePath = $args[0]
# Check if the path is valid
If (-not (Test-Path $SourcePath -PathType Leaf)) {
    Write-Host "Please enter a valid file path."
    Exit
}

try
{
    $stream = [System.IO.StreamWriter]::new( $SourcePath)
    ForEach-Object{ $stream.WriteLine( $_ ) }
}
finally
{
    $stream.close()
}