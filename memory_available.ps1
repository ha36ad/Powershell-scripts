# Get memory from a particular drive

# Check number of args
If ($args.Count -eq 1) {
    $SourcePath = $args[0]
    $DriverExist = Get-PSDrive | Where-Object {$_.Name -match $SourcePath}
    # Check if Driver exists
    If ($DriverExist -eq $null) {
        Write-Host "Driver does not exist. Use Get-PSDrive for a list of drivers in the session."
        Exit
    }
}



function Get-Space (){
    [CmdletBinding(DefaultParameterSetName='StringValue')]
    param (
        # If a drivepath is supplied
        [parameter(Mandatory, ParameterSetName='path')]
        [String] $path
    )
    if ($path) {
        $Memory = Get-Volume -Driveletter $path | Select-Object -Property FriendlyName,DriveLetter,SizeRemaining, Size | fl
    } 
    else {
        $Memory = Get-Volume  | Select-Object -Property FriendlyName, DriveLetter,SizeRemaining,Size | fl
    } 
    return $Memory
}

If ($SourcePath) {
    Get-Space -path $SourcePath    
}
 else {
     Get-Space
 }


