# Custom Health Report
# ComputerName, OSName, OSVersion, ProcessorModel, C Drive, Freespace%, 
# LastRebooted, Running Services count, Hotfix count

cls
Write-Host "Custom Health Report" -BackgroundColor DarkBlue

$OS = Get-WmiObject -Class Win32_OperatingSystem
# $OS.PSComputerName $OS.Caption $OS.Version

$Processor = Get-WmiObject -Class Win32_Processor
# $Processor.Name

$Disk = Get-WmiObject -Class Win32_LogicalDisk | Where { $_.DeviceID -eq "C:" }
[int] $percent = ($Disk.Freespace/$Disk.Size) * 100

$Reboot = Get-CIMInstance -ClassName Win32_OperatingSystem
# $Reboot.LastBootuptime

$RunningserviceCount = Get-Service | ? { $_.Status -eq "Running"}.Count
$HFCount = (Get-Hotfix).Count

$Value = New-Object PSObject
$Value | Add-Member -MemberType NoteProperty ComputerName -Value $OS.PSComputerName
$Value | Add-Member -MemberType NoteProperty OSName -Value $OS.Caption
$Value | Add-Member -MemberType NoteProperty OSVersion -Value $OS.Version
$Value | Add-Member -MemberType NoteProperty ProcessorModel -Value $Processor.Name
$Value | Add-Member -MemberType NoteProperty Freespace -Value $percent
$Value | Add-Member -MemberType NoteProperty LastRebooted -Value $Reboot.LastBootUpTime
$Value | Add-Member -MemberType NoteProperty RunningServices -Value $RunningserviceCount
$Value | Add-Member -MemberType NoteProperty HotfixesCount -Value $HFCount

$Value | Gm
