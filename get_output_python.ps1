# Check number of args
If ($args.Count -lt 2) {
    Write-Host "Please supply a valid python executable and a method of splitting the python executable's output."
    Exit
}
$SourcePath = $args[0]
#Check if the path is valid
If (-not(Test-Path $SourcePath -PathType Container)) {
    Write-Host "Please enter a valid Path to the python executable."
    Exit
}
# Store the Python's script contents
$PyOutput = $(python $SourcePath)
# Parse the contents
$ScriptContents = $PyOutput -split $args[1]
Write-host $ScriptContents