Function Get-Addition
{
    Param ([Parameter (Mandatory = $True, HelpMessage = "Enter Number1 as an Integer")] [int] $Number1, 
           [Parameter (Mandatory = $True, HelpMessage = "Enter Number2 as an Integer") ] [int] $Number2)
    Write-Host "Addition program using Functions" -BackgroundColor DarkCyan
    $Result = $Number1 + $Number2
    Write-Host "The Addition of $Number1 and $Number2 is $Result" -BackgroundColor DarkCyan
}

Function Execute-Service
{
<#
.Synopsis
Working with Windows Services

.Description
This Function takes input about the Status and Displayname and performs the operation

.Parameter Status
This Parameter accepts either Running or Stopped as an input

.Parameter Displayname
This parameter accepts String and Wildcard search to search on the Displayname

.Example
Execute-Service -Status Running -Displayname Windows*

.Example
Execute-Service
This will prompt for the Status and Displayname Parameters from the User

.Inputs
Execute-Service -Status <Running/Stopped> -Displayname <String with Wildcard Character>

.Notes
This help structure was designed during the PowerShell training

.Link
https://docs.microsoft.com
#>
     Param ([Parameter(ParameterSetName = "Set1")][ValidateSet ("Running", "Stopped")][Alias ("State","condition")] $Status, 
            [Parameter(ParameterSetName = "Set2")]$Displayname,
            $computername)
     Write-Host "Working with Windows Service" -BackgroundColor Black -ForegroundColor Yellow
     $Result = Get-Service | ? {$_.Status -eq $Status -and $_.Displayname -like $Displayname}
     $Result | Sort Displayname | ft Status, Displayname, StartType, MachineName
     Write-Host $Result.Count -BackgroundColor DarkCyan
}
Function Execute-Process
{
    Param ([ValidateRange(1,2000)] $Lower, 
           [ValidateRange(1,2000)] $Upper)
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

