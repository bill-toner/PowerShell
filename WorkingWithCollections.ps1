cls
Write-Host "Search Users from India using Foreach" -BackgroundColor DarkGray
$Collection = Import-Csv C:\users\wtoner\Documents\KPMG_PowerShell_Training\Feb18\Book1.csv

Foreach ($item in $collection)
{
    If ($item.country -eq "India")
        {
                # First Method: Remove the Quotes
                Write-Host $Item.Sno $Item.Lname $Item.State $Item.Country $item.phone

                # Second Method: 
                Write-Host "$($item.sno) $($item.Lname) $($item.State) $($item.Country) $($item.phone)"
    
                #Third Method
                $Sno = $item.Sno
                $Lname = $item.Lname
                $State = $item.State
                $Country = $item.Country
                $Phone = $item.phone        
                
                Write-Host "$Sno $LName $State $Country $Phone"
                $item | Select Sno, Lname, State, Country, Phone
    }
}