# Check number of args
If ($args.Count -ne 1) {
    Write-Host "Please supply a file path."
    Exit
}

$SourcePath = $args[0]

# Check if the path is valid
If (-not (Test-Path $SourcePath -PathType leaf)) {
    Write-Host "Please enter a valid file path."
    Exit
}

# Get a list of urls
$files = Get-Content -Path $SourcePath

$tempdir = "C:\TestDownloads"

# Create a directory to store the downloaded files, if it doesn't exist
if (-not(Test-Path -Path $tempdir)) {
    New-Item -ItemType Directory -Path $tempdir
}

# Send a download request to each of the contents in the file
foreach ($file in $files) {
    try {
        $tempname = $file.name
        $tempfile = "$tempdir\$tempname.csv"
        New-Item -ItemType Directory -Path $tempfile
        Invoke-WebRequest $file -OutFile $tempfile -ErrorAction Stop
    }
    catch {
        # Create a log path if it doesnt exist
        $LogPath = "C:\Logs"
        $LogFile = "$LogPath\log_session.txt"
        If (-not (Test-Path -Path $LogPath)) {
            Write-Host "no log folder found, creating one named $SourcePath"
            New-Item -ItemType Directory -Path $LogPath -ErrorAction Stop
            New-Item -ItemType File -Path $LogFile -ErrorAction Stop      
        }
        # Append date and time
        $LogDate = Get-Date
        $logstring = $LogDate.ToString() + "  $_.Exception"
        $logstring | Out-File $LogFile -Append
        continue
    }
}