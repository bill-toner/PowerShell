Function Get-Addition
{
    Param ($Number1, $Number2)
    Write-Host "Addition program using Functions" -BackgroundColor DarkCyan
    $Result = $Number1 + $Number2
    Write-Host "The Addition of $Number1 and $Number2 is $Result" -BackgroundColor DarkCyan
}

Function Execute-Service
{
     Param ($Status, $Displayname)
     Write-Host "Working with Windows Service" -BackgroundColor Black -ForegroundColor Yellow
     $Result = Get-Service | ? {$_.Status -eq $Status -and $_.Displayname -like $Displayname}
     $Result | Sort Displayname | ft Status, Displayname, StartType, MachineName
     Write-Host $Result.Count -BackgroundColor DarkCyan
}
Function Execute-Process
{
    Param ($Lower, $Upper)
    Write-Host "Working with Windows Process" -BackgroundCOlor Black -ForegroundColor Yellow
    $Result = Get-Process | ? {$_.Handles -gt $lower -and $_.handles -lt $upper} 
    $Result | Sort Handles | ft Handles, Processname, StartTime
    Write-Host $Result.Count -BackgroundColor DarkCyan
}
Function Execute-Hotfix
{
     Param ($Description, $DateLimit)
     Write-Host "Working with Windows Hotfix" -BackgroundColor Black -ForegroundColor Yellow
     $Result = Get-Hotfix | where-object {$_.Description -eq $description -and $_.InstalledOn -gt $dateLimit}
     $Result | sort Installedon | ft Pscomputername, Description, HotfixID, InstalledOn, Caption
     Write-Host $Result.Count -BackgroundColor DarkCyan
}
Function Execute-EventLogs
{
    Param ($Container, $Lower, $Upper, $Type)
    Write-Host "Working with Windows EventLogs" -BackgroundColor Black -ForegroundColor Yellow
    $Result = Get-Eventlog -logname $container | Where {$_.Timegenerated -gt $lower -and $_.Timegenerated -lt $upper -and $_.EntryType -eq $type}
    $Result | ft time*, EntryType, Source
    Write-Host $Result.Count -BackgroundColor DarkCyan
}
