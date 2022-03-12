# Return the CPU use of a particular level
function Get-CPU (){
    [CmdletBinding(DefaultParameterSetName='StringValue')]
    param (
        # If a pid is supplied
        [parameter(Mandatory, ParameterSetName='id')]
        [int32] $id,

        # If a percentage is supplied
        [parameter(Mandatory, ParameterSetName ='percent')]
        [int32] $percent

    )

    if ($id -is [int]) {
        $tempid = (Get-Process -Id $id).Name
        Get-Counter -Counter "\Process($tempid)\% Processor Time" | fl
    }
    if ($percent -is [int]) {
        $Samples = (Get-Counter '\Processor(*)\% Processor Time').CounterSamples | Where-Object {$_.CookedValue -ge $percent}
    }
    # Default is 50%
    $Samples = (Get-Counter '\Processor(*)\% Processor Time').CounterSamples | Where-Object {$_.CookedValue -ge 20}
}
Get-CPU