cls
Write-Host "`tAD Operations Script`t`n" -ForegroundColor Green -BackgroundColor Black
Write-Host "AD User Creation" -ForegroundColor Yellow

$firstName = Read-Host "Enter the First Name"
$lastName = Read-Host "Enter the Last Name"
$userName = Read-Host "Enter the UserName"
$password = Read-Host "Enter the password" -AsSecureString
$title = Read-Host "Enter the title"
$city = Read-Host "Enter the city"
$OU = Read-Host "Enter the OU (Employees/Engineering/IT/Sales)"
$OU = "OU=$OU,DC=Adatum,DC=com"

Write-Host "Creating the User" -ForegroundColor Yellow
New-ADUser `
    -GivenName $firstName `
    -Surname $lastName `
    -SamAccountName $userName `
    -AccountPassword $password `
    -Title $title `
    -City $city `
    -Enabled $True `
    -Path $OU

Write-Host "User Account has been created" -ForegroundColor Yellow

##########################################################################
Write-Host "------------------------"
Write-Host "AD Group creation" -BackgroundColor DarkGreen
Write-Host "------------------------"
$GName = Read-host "Enter the Group Name ?"
$GScope = Read-host "Enter the Scope of Group (DomainLocal/Global/Universal)?"
New-ADGroup -Name $GName -GroupScope $GScope
Write-host "Group $Gname has been created" -BackgroundColor DarkGreen
##########################################################################

write-host "------------------------"
write-host "Adding Member to a Group" -BackgroundColor DarkGreen
write-host "------------------------"
$Gname = Read-host "Enter the group Name ?"
$MemName = Read-host "Enter the Member Name ?"
Add-ADGroupMember $GName -Members $MemName
Write-host "User $MemName has been added to the group $GName" -BackgroundColor DarkGreen
##########################################################################
write-host "------------------------"
write-host "Removing Member to a Group" -BackgroundColor DarkGreen
write-host "------------------------"
$Gname = Read-host "Enter the group Name ?"
$MemName = Read-host "Enter the Member Name ?"
Remove-ADGroupMember -identity $GName -Members $MemName -Confirm:$false
Write-host "User $MemName has been removed to the group $GName" -BackgroundColor DarkGreen
############################################################################
