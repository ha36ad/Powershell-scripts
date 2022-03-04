# Check number of args
If ($args.Count -lt 1) {
    Write-Host "Please supply a file path."
    Exit
}

$SourcePath = $args[0]
$Type = $args[1]

#Check if the path is valid
If (-not(Test-Path $SourcePath)) {
    Write-Host "Please enter a valid Path."
    Exit
}

#Get Current Access Level 
$Acl = "Get-Acl $SourcePath  | fl Path,Owner,Group,Access"
Write-Host "Displaying current access level..."
Invoke-Expression $Acl

#If folder, display file permissions
if (Test-Path -Path $SourcePath -PathType Container) {
    $GetContent = Get-ChildItem $SourcePath -Recurse

    if ($Type -eq "subfolders") {
    #Display only subfolders
    $GetContent | where-object {($_.PsIsContainer)} | Get-Acl | Format-List -Property Path,Owner,Group,Access
    }
    elseif ($Type -eq "files" ) {
    #Display only files
        $GetContent | where-object { $_.PsIsContainer -eq $false } | Get-Acl | Format-List -Property Path,Owner,Group,Access
    }
    else {
        $GetContent | Get-Acl | Format-List -Property Path,Owner,Group,Access
    }
}


