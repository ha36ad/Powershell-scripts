Add-Type -AssemblyName Microsoft.VisualBasic

# Check number of args
If ($args.Count -ne 1) {
    Write-Host "Please supply a folder path."
    Exit
}

$SourcePath = $args[0]

#Check if the path is valid
If (-not(Test-Path $SourcePath)) {
    Write-Host "Please enter a valid Path."
    Exit
}

#Get the contents of the folder and look for zip files
$Files = Get-ChildItem -Recurse -Path $SourcePath -filter *.zip | Where-Object {
    $_.Name -match '.zip$'
}

# Unzip Contents
ForEach ($file in $Files) {
    $TempPath = $SourcePath + '\' + "$file unzipped"
    # Check if a folder already exists, if it doesn't create and extract like normal
    if (-not(Test-Path -Path $TempPath -PathType Container)) {
        Write-Host " Unzipping " $file.Fullname "..."
        #Create a folder to store the unzipped contents
        New-Item -Path $SourcePath -Name "$file unzipped" -ItemType "directory"
        #Unzip the zip file
        Expand-Archive $file.Fullname -DestinationPath $TempPath
    }
    # Otherwise, overwrite its contents
    else {
        Write-Host "A folder with that name already exists..., ovewritting its contents..."
        New-Item -Path $SourcePath -Name "$file temp" -ItemType "directory"
        $TempPath2 = $SourcePath + '\' + "$file temp"
        Expand-Archive $file.Fullname -DestinationPath $TempPath2
        Copy-Item -Path $TempPath2 -Destination $TempPath -Recurse -Force
        #Delete TempPath2
        Remove-Item -Path $TempPath2
    }

}

#Ask user if they would like to delete the zip files
$Response = Read-Host "Would  you like to delete the zip files?: Yes(Y), No(N)"

If ($Response -eq "Y") {
    ForEach ($file in $Files) {
        Write-Host "Moving file" $f.Fullname "to Recycling Bin"
        [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile($file.Fullname,'OnlyErrorDialogs','SendToRecycleBin')
    }
}