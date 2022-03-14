
$SourcePath = "C:\Logs"
$SourceFile = "$SourcePath\log_session.txt"

function Add-Log(){
    Param (
        [parameter(Mandatory, ParameterSetName='path')]
        [string] $path
    )
    BEGIN
    {
        # Create a logging file if it does not exist
        If (-not (Test-Path -Path $SourcePath)) {
            Write-Host "no log folder found, creating one named $SourcePath"
            New-Item -ItemType Directory -Path $SourcePath -ErrorAction Stop
            New-Item -ItemType File -Path $SourceFile -ErrorAction Stop      
        }
    }
    PROCESS {
        Get-History | Add-Content -Path $SourceFile
    }

    END {
        Write-Host "Logging is done"
    }
}

Add-log -path $SourcePath
