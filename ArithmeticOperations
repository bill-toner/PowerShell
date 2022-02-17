cls
Write-Host "`tArithmetic Operation`t`n" -ForegroundColor Green -BackgroundColor Black
Write-Host "1. Addition"
Write-Host "2. Subtraction"
Write-Host "3. Multiplication"
Write-Host "4. Division"

[int]$choice = Read-Host "Please select an operation"
if ($choice -lt 1 -or $choice -gt 4)
{
    Write-Host "Selection out of range"
}
else 
{
    [decimal] $number1 = Read-Host "Please enter the first operand"
    [decimal] $number2 = Read-Host "Please enter the second operand"


    if ($choice -eq 1)
    {
        Write-Host ($number1 + $number2)
    } 
    elseif ($choice -eq 2)
    {
        Write-Host ($number1 - $number2)
    }
    elseif ($choice -eq 3)
    {
        Write-Host ($number1 * $number2)
    }
    elseif ($choice -eq 4)
    {
        Write-Host ($number1 / $number2)

    }
    else
    {
        Write-Host "You are doing it wrong"
    }
}
