cls
Write-Host "`t`t`tWorking with Windows Operations`t`t`t`n" -BackgroundColor Black -ForegroundColor Green
Write-Host "1. Services"
Write-Host "2. Processes"
Write-Host "3. Hotfixes"
Write-Host "4. Event Logs"
[int]$choice = Read-Host "Please select an operation"

if ($choice -lt 1 -or $choice -gt 4)
{
    Write-Host "Selection out of range"
}
else 
{
    if ($choice -eq 1)
    {
        Write-Host "Working with Windows Service" -BackgroundColor Black -ForegroundColor Yellow
        $status = Read-Host "Enter the Status (Running/Stopped) : "
        $Displayname = Read-Host "Enter the Displayname (use * for Wildcard search) : "
        $Result = Get-Service | ? {$_.Status -eq "Running" -and $_.Displayname -like "Windows*"}
        $Result | Sort Displayname | ft Status, Displayname, StartType, MachineName
        Write-Host $Result.Count -BackgroundColor DarkCyan
    }
    elseif ($choice -eq 2)
    {
        Write-Host "Working with Windows Process" -BackgroundCOlor Black -ForegroundColor Yellow
        $lower = Read-Host "Enter the lower limit for Handles?"
        $upper = Read-Host "Enter the upper limit for Handles?"
        $Result = Get-Process | ? {$_.Handles -gt $lower -and $_.handles -lt $upper} 
        $Result | Sort Handles | ft Handles, Processname, StartTime
        Write-Host $Result.Count -BackgroundColor DarkCyan
    }
    elseif ($choice -eq 3)
    {
        Write-Host "Working with Windows Hotfix" -BackgroundColor Black -ForegroundColor Yellow
        $description = Read-Host "Enter the Description (Update/Security Update) ?"
        $dateLimit =  Read-Host "Enter the Date Limit mm/dd/yyyy"
        $Result = Get-Hotfix | where-object {$_.Description -eq $description -and $_.InstalledOn -gt $dateLimit}
        $Result | sort Installedon | ft Pscomputername, Description, HotfixID, InstalledOn, Caption
        Write-Host $Result.Count -BackgroundColor DarkCyan
    }
    elseif ($choice -eq 4)
    {
        Write-Host "Working with Windows EventLogs" -BackgroundColor Black -ForegroundColor Yellow
        $container = Read-Host "Enter the Container Name"
        $lower = Read-Host "Enter the Start Date and Time"
        $upper = Read-Host "Enter the End Date and Time"
        $type = Read-Host "Enter the Event Type"
        $Result = Get-Eventlog -logname $container | Where {$_.Timegenerated -gt $lower -and $_.Timegenerated -lt $upper -and $_.EntryType -eq $type}
        $Result | ft time*, EntryType, Source
        Write-Host $Result.Count -BackgroundColor DarkCyan
    }
    else
    {
        Write-Host "Something went horribly wrong"
    }
}

Write-Host "END OF SCRIPT" -BackgroundColor DarkMagenta
