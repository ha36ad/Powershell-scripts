function Test-Folder() {
    [CmdletBinding()]
    param (
        [parameter(Mandatory, ParameterSetName='path')]
        [string] $path,
        [parameter(Mandatory)]
        [string] $name
    )
    $testpath = $path + "\" + $name
    if (-not (Test-Path $testpath -PathType Container)) {
        $temp = "New-Item -Path $testpath -Name $name -ItemType directory"
    }
    return $temp
}

$returnval = Test-Folder -path $args[1] -name $args[2]
Invoke-Expression $returnval