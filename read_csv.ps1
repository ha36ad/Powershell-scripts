# Reads the contents of a csv file
function Read-Csv (){
    param (
        [parameter (Mandatory, HelpMessage="Please supply a path to a csv file")]
        [String]$Path
    )

    # Read CSV contents
    $CsvContent = "Import-Csv $Path | Format-Table -Property Name, Path"

    Invoke-Expression $CsvContent
}


# Check number of args
If ($args.Count -lt 1) {
    Write-Host "Please supply a folder path."
    Exit
}

$SourcePath = $args[0]

#Check if the path is valid
If (-not(Test-Path $SourcePath)) {
    Write-Host "Please enter a valid Path."
    Exit
}

# Creating a destination path for testing purposes
$DestinationPath = $SourcePath + "\" + "test.csv"
# Exporting a test csv containing the current system processes
#Get-Process| Export-Csv -Path $DestinationPath 

# Testing function
Read-Csv $DestinationPath 

