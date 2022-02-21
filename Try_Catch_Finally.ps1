<#
    To find the error use $Error[0] | Select *
#>


cls
Write-Host "Try - Catch - Finally" -BackgroundColor DarkGreen
Try
{
    Get-Service bits | Select -First 5 | Ft # Terminating Error
    Get-Process | Select -First 5 | Ft
    Get-EventLog -LogName Application -Newest 5 | Ft
    Get-Hotfix | Select -First 5 | Ft
}
Catch [System.Management.Automation.CommandNotFoundException]
{
    Write-Host "Command Not Found" -BackgroundColor DarkRed
}
Catch [System.InvalidOperationException]
{
    Write-Host "Invalid Operation" -BackgroundColor DarkRed
}
Catch [System.Management.Automation.ParameterBindingException]
{
    Write-Host "Parameter Binding Exception"
}
Catch 
{
    Write-Host "Unknown Error occured" -BackgroundColor DarkRed
}
Finally
{
    Write-Host "Script Completed" -BackgroundColor DarkGray
}