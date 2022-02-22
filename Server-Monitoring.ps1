cls
Write-Host "Server Monitoring on Many Machines" -BackgroundColor DarkGray
$Servers = Import-Csv C:\Users\Administrator.ADATUM\Documents\servers.csv
Clear-Content C:\Users\Administrator.ADATUM\Documents\Services.csv
$Success = 0
$Failure = 0
$Date = Get-Date -Format dd_MM_yyyy_HH_mm
$SuccessFilename = "Success_Machines_$date.txt"
$FailureFilename = "Failure_Machines_$date.txt"
Add-Content -Path C:\Users\Administrator.ADATUM\Documents\$SuccessFilename -Value (Get-Date)
Add-Content -Path C:\Users\Administrator.ADATUM\Documents\$FailureFilename -Value (Get-Date)

ForEach ($item in $servers)
{
    Try
    {
        Write-Host "Connecting to the Server" $item.ServerName -BackgroundColor Black -ForegroundColor Yellow
        $Result = Get-Service -ComputerName $item.Servername | ? {$_.DisplayName -like "Remote*"} 
        $Result | Ft Status, Name, Displayname, MachineName
        $Result | Select Status, Name, Displayname, MachineName | 
            Export-Csv C:\Users\Administrator.ADATUM\Documents\Services.csv -NoTypeInformation -Append
        Add-Content -Path C:\Users\Administrator.ADATUM\Documents\$SuccessFileName -Value $item.ServerName
        Clear-Variable Result
        $Result = $null
        $Success++
    }
    Catch
    {
        Write-Host "Unable to connect to the Server" $item.ServerName -BackgroundColor DarkRed
        Add-Content -Path C:\Users\Administrator.ADATUM\Documents\$FailureFileName -Value $item.ServerName
        $Failure++
    }
}
"`n"
Write-Host "Success = $Success" -BackgroundColor DarkGreen
Write-Host "Failure = $Failure" -BackgroundColor DarkRed

