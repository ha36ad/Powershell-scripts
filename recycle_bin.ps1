Add-Type -AssemblyName Microsoft.VisualBasic

    If ($args.Count -ne 3) {
        Write-Host "Please supply one path that you would like to check and a cutoff size and unit (KB,MB,GB)."
        Exit
    }
    $SourcePath = $args[0]
    $Size = $args[1]
    $Unit = $args[2]

    If (-not(Test-Path $SourcePath)) {
        Write-Host "Please enter a valid Path."
        Exit
    }

    elseif ( -not ($Size -as [int] | findstr $Size)) {
        Write-Host "Please enter a number greater than -1."
        Exit
    }
    elseif ([int]$Size -lt -1) {
        Write-Host "Please enter a valid size (greater than -1)."
        Exit
    }
    elseif (($Unit -ne "KB") -and ($Unit -ne "GB") -and ($Unit -ne "MB")) {
        Write-Host "Please enter a valid unit (KB,MB,GB)."
        Exit
    }
    
    $Unit = "1" + $Unit
    $files = Get-ChildItem $SourcePath -Recurse

    foreach ($f in $files) {
        If (($f).length/$Unit -gt $Size) {
            if (Test-Path -Path $f.Fullname -PathType Container) {
                continue
            }
            else {
                Write-Host "Moving file" $f.Fullname "to Recycling Bin"
                [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile($f.Fullname,'OnlyErrorDialogs','SendToRecycleBin')
            }
        }
    } 
