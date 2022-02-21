cls
Write-Host "Server Monitoring on Many Machines" -BackgroundColor DarkGray
$Servers = Import-Csv C:\Users\Administrator.ADATUM\Documents\servers.csv
Clear-Content C:\Users\Administrator.ADATUM\Documents\Services.csv

ForEach ($item in $servers)
{
    Try
    {
        Write-Host "Connecting to the Server" $item.ServerName -BackgroundColor Black -ForegroundColor Yellow
        $Result = Get-Service -ComputerName $item.Servername | ? {$_.DisplayName -like "Remote*"} 
        $Result | Ft Status, Name, Displayname, MachineName
        $Result | Select Status, Name, Displayname, MachineName | 
            Export-Csv C:\Users\Administrator.ADATUM\Documents\Services.csv -NoTypeInformation -Append
        Clear-Variable Result
    }
    Catch
    {
        Write-Host "Unable to connect to the Server" $item.ServerName -BackgroundColor DarkRed
    }
}

