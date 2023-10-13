#path to file to read
$data = Get-Content -Path "C:\Users\evan\Desktop\sample.txt"

#Filter by Alpha
$alphaValues = @()
$data | ForEach-Object {
    $values = $_.Split(',')
    ForEach ($value in $values) {
        if ($value -match '^[a-zA-Z]+$') {
            $alphaValues += $value
        }
    }
}


#Print Alpha
$alphaValues | ForEach-Object {Write-Output $_} 

