#path to file to read
$data = Get-Content -Path "C:\Users\evan\Desktop\sample.txt"

#Filter by Alpha or Numeric
$alphaValues = @()
$data | ForEach-Object {
    $values = $_.Split(',')
    ForEach ($value in $values) {
        if ($value -match '^[a-zA-Z]+$') {
            $alphaValues += $value
        }
        elseif ($value -match '^\d+$') {
            $numericValues += $value
        }
    }
}


#Print Alpha
$alphaValues | ForEach-Object {Write-Output $_} 

#Print Numeric
$numericValues | ForEach-Object {Write-Output $_}

