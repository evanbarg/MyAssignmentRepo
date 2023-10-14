#path to file to read
$data = Get-Content -Path "C:\Users\evan\Desktop\sample.txt"

#Filter by Alpha or Numeric
$alphaValues = @()
$numericValues = @()
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

#Ask for User Input
$userInput = Read-Host -Prompt "Enter numeric to see numbers or alphabet to see letters"

#Print Alpha
if ($userInput -eq "alphabet"){
    $alphaValues | ForEach-Object {Write-Output $_} 
} elseif ($userInput -eq "numeric") {
    $numericValues | ForEach-Object {Write-Output $_}
} else{
    Write-Output "Please enter a valid input: numeric, alphabet or both"
}


