cls
Write-Host "Restart Service on Many Machines" -BackgroundColor DarkGray
$Servers = Import-Csv C:\Users\Administrator.ADATUM\Documents\servers.csv

Foreach ($server in $servers)
{
    Write-Host "Connecting to the Server" $server.ServerName -BackgroundColor Black -ForegroundColor Yellow
    Invoke-Command -ComputerName $server.ServerName -ScriptBlock { Restart-Service -Name bits }
    if ($? -eq "True")
    {
        Write-Host "The service got restarted successfully" -BackgroundColor DarkGray
    }
    else
    {
        Write-Host "The Service restart failed" -BackgroundColor DarkRed
    }
}