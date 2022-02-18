cls
Write-Host "Multiplication Table using WHILE" -BackgroundColor Black -ForegroundColor Yellow

[int]$tableNumber = Read-Host "Enter the table number"
[int]$start = Read-Host "Enter the start number"
[int]$end = Read-Host "Enter the ending number"

if ($start -gt $end)
{
    Write-Host "Start cannot be greater than end"
}
else
{
    $i = $start
    While ($i -le $end)
    {
        $Result = $i * $tableNumber
        Write-Host "$tableNumber x $i = $Result"
        $i++
    }
}
