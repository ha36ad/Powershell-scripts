# Check number of arguments
If ($args.Count -ne 1) {
    Write-Host "Please enter a valid folder path."
    Exit
}

$SourcePath = $args[0]

# Check if the folder path is valid
if (-not (Test-Path $SourcePath -PathType Container)) {
    Write-Host "Invalid folder Path."
}


# Get Folder contents
$folderlist = @()
$folderlist += Get-ChildItem -Path $SourcePath

# Go through folder and find files that have exceeded a certain time span
function Get-FileWriteTime() {      
    Param (
        [parameter (Mandatory=$true, HelpMessage="Requires array input", ParameterSetName ="list")]
        [System.Array]$list,
        [parameter (Mandatory=$true, HelpMessage="Supported operators: gt,lt,eq")]
        [string]$comparison,
        [parameter (HelpMessage="Enter a time in hours")]
        [int]$time
    )
    # Initialize an empty list
    $filelist = New-Object System.Collections.Generic.List[PSObject]  
    # Default time (hours)
    $interval = 6;

    if ($time -is [int]) {
        $interval = $time
    }

    foreach ($file in $list) {

        # If the content is a folder, skip
      #  if (Test-Path $file.Fullname -PathType Container) {
       #     continue
       # }
       
        # Get current date
        $CurrentDate = Get-Date
        # Calculate difference
        $TimeDifference = New-TimeSpan -start $file.LastWriteTime -end $CurrentDate
        # Comparing based on hours
        if ($comparison -eq "gt") {
            if ($TimeDifference.TotalHours -gt $interval) {
                $filelist.Add($file.Name)
            }
        }
        elseif ($comparison -eq "lt") {
            if ($TimeDifference.TotalHours -lt $interval) {
                $filelist.Add($file.Name)
            }
        }
        elseif ($comparison -eq "eq") {
            if ($TimeDifference.TotalHours -eq $interval) {
                $filelist.Add($file.Name)
            }
        }
    }

    return $filelist

}

# Call function
Get-FileWriteTime -list $folderlist -comparison "gt"