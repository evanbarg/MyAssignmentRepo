#Ask for file path
$filePath = Read-Host -Prompt "Enter file path"

if (-not (Test-Path $filePath)) {
    Write-Output "Not a valid file path"
    exit
}
$filterType = Read-Host "Enter the filter type: 'Numeric', 'Alphabet', or 'Both'"
$sortOrder = Read-Host "Enter sort order: 'Ascending' or 'Descending'"

$fileContent = Get-Content $filePath
#filter the contnet
switch ($filterType) {
    'numeric' {
        $filteredContent = $fileContent | Where-Object { $_ -match '^\d+' }
    }
    'alphabet' {
        $filteredContent = $fileContent | Where-Object { $_ -match '^[a-zA-Z]+' }
    }
    'both' {
        $filteredContent = $fileContent | Where-Object { $_ -match '^[a-zA-Z0-9]+' }
    }
}

#Sort based on sort input
if ($sortOrder -eq 'descending') {
    $filteredContent = $filteredContent | Sort-Object -Descending
} else {
    $filteredContent = $filteredContent | Sort-Object
}

#outputs comma seperated
$filteredContentComma = $filteredContent -join ","
Write-Output $filteredContentComma