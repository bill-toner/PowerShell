cls
Write-Host "Multiplication Table using FOR" -BackgroundColor Black -ForegroundColor Yellow
[int]$tableNumber = Read-Host "Please enter the table number"
[int]$start = Read-Host "Please enter the start number"
[int]$end = Read-Host "Please enter the end number"

if ($start -gt $end)
{
    Write-Host "The start number cannot be greater than the end number"
}
else
{
    For ($i = $start; $i -le $end; $i++)
    {
        $Result = $i * $tableNumber
        Write-Host "$tableNumber x $i = $Result"
    }
}

