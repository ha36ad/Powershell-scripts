# Check number of args
If ($args.Count -lt 2) {
    Write-Host "Please supply a file path and a user."
    Exit
}

$SourcePath = $args[0]
$User = $args[1]
$Type = $args[2]

#Check if the path is valid
If (-not(Test-Path $SourcePath)) {
    Write-Host "Please enter a valid Path."
    Exit
}

#Get Current Access Level 
$Acl = "Get-Acl $SourcePath  | fl Path,Owner,Group,Access"
Write-Host "Displaying current access level..."
$ACL = Invoke-Expression $Acl

#Changing Access Level
#If folder, display file permissions
if (Test-Path -Path $SourcePath -PathType Container) {
    $GetContent = Get-ChildItem $SourcePath -Recurse

    # Setting access rule
    $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule ('$User', 'ListDirectory', 'ContainerInherit, ObjectInherit', 'InheritOnly',
        'Allow')
    $ACL.AddAccessRule($AccessRule)

    if ($Type -eq "subfolders") {
    #Display only subfolders
    $GetContent | where-object {($_.PsIsContainer)} | Set-Acl $GetContent | Format-List -Property Path,Owner,Group,Access
    }
    elseif ($Type -eq "files" ) {
    #Display only files
        $GetContent | where-object { $_.PsIsContainer -eq $false } | Set-Acl $GetContent | Format-List -Property Path,Owner,Group,Access
    }
    else {
        $GetContent | Set-Acl $GetContent | Format-List -Property Path,Owner,Group,Access
    }
}