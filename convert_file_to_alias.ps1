
$LogPath = "C:\Logs"
$LogFile = "$LogPath\log_session.txt"

# Check number of arguments
If ($args.Count -ne 1) {
    Write-Host "Please enter a valid file path."
    Exit
}

$SourcePath = $args[0]

# Check if file paths are valid
if (-not (Test-Path $SourcePath)) {
    Write-Host "Invalid file Path."
}

# Create a logging file if it does not exist
If (-not (Test-Path -Path $LogPath)) {
    try {
        Write-Host "no log folder found, creating one named $LogFile"
        New-Item -ItemType Directory -Path $LogPath -ErrorAction Stop
        New-Item -ItemType File -Path $LogFile -ErrorAction Stop      
    }
    catch {
        throw $_.Exception.Message
    }
}


# Get the file's contents
try  { 
    $FileContent = Get-Content -Path $SourcePath -ErrorAction Stop
}
catch {
   throw $_.Exception.Message
}


# Iterate through file
ForEach ($file in $FileContent) {
    try {
        $temp = $file | ConvertFrom-Json -ErrorAction Stop
        #Create Alias
        New-Alias -Name $temp.Name -Value $temp.Command -ErrorAction Stop
    }
    catch {
        Write-Host "Logging error..."
        $exceptionstring = ($_.Exception.Message).toString()
        $logstring = (Get-Date -DisplayHint Time).toString() + " " + $exceptionstring
        Add-Content -Path $LogFile -Value $logstring
        continue
    }
}
