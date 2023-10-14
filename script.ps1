#Ask for file path
$filePath = Read-Host -Prompt "Enter file path"

if (-not (Test-Path $filePath)) {
    Write-Output "Not a valid file path"
    exit
}

$data = Get-Content -Path $filePath

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
$userInput = Read-Host -Prompt "Enter 'numeric' to see numbers or 'alphabet' to see letters, or 'both' to see numebers and letters"
$sortOrder = Read-Host - Prompt "Enter 'ascending' to sort ascending order or enter 'descending' to sort descending order"

#Print output
#Print both
if ($userInput -eq "both") {
    if ($sortOrder -eq "ascending") {
        $value | Sort-Object | ForEach-Object {Write-Output $_ }
    } elseif ($sortOrder -eq "descending") {
        $value | Sort-Object -Descending | ForEach-Object {Write-Output $_ }
    } else {
        Write-Output "Please enter 'ascending' or descending'"
}
}
#Numeric
if ($userInput -eq "numeric") {
    if ($sortOrder -eq "ascending") {
        $numericValues | Sort-Object | ForEach-Object {Write-Output $_ }
    } elseif ($sortOrder -eq "descending") {
        $numericValues | Sort-Object -Descending | ForEach-Object {Write-Output $_ }
    } else {
        Write-Output "Please enter 'ascending' or descending'"
    } #Alphabet
} elseif ($userInput -eq "alphabet") {
    if ($sortOrder -eq "ascending") {
        $alphaValues | Sort-Object | ForEach-Object {Write-Output $_ }
    } elseif ($sortOrder -eq "descending") {
        $alphaValues | Sort-Object -Descending | ForEach-Object {Write-Output $_ }
    } else {
        Write-Output "Invalid sort order. Please enter 'ascending' or 'descending'."
    }
} else {
    Write-Output "Invalid input. Please enter 'numeric' or 'alphabetic'."
}

