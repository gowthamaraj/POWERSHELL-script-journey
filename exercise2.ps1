# IF

$path = 'C:\Documents and Settings'
$eval = Test-Path $path
if ($eval -eq $true) {
    Write-Host 'Exist'
}
else {
    Write-Host 'Not exist'
}


# Switch

$user_input = Read-Host "Provide a number"
switch ($user_input) {
    1 { 
        Write-Host 'It is a One'
     }
    Default {Write-Host 'Not a One'}
}

# For

for ($i = 0; $i -lt 5; $i++) {
    Write-Host $i
}

$string = "hi there"
for ($i = 0; $i -lt $string.Length; $i++) {
    Write-Host $string[$i]
}


# For-each
$path = 'e:'
foreach ($item in Get-ChildItem $path -Recurse) {
    Write-Host "$($item.Length/1MB)"
}


# ---------------------------------------------
# declare a few variables for counting
[int]$fileCount = 0
[int]$folderCount = 0
[int]$totalSize = 0

# declare our path we want to evaluate
$path = 'C:\Test'

# get the file information
$rawFileInfo = Get-ChildItem $path -Recurse

# loop through that file information
foreach ($item in $rawFileInfo) {
    if ($item.PSIsContainer) {
        # this is a folder/directory
        $folderCount++
    }
    else {
        # this is a file, because it is not a PSIsContainer
        $fileCount++
        $totalSize += $item.Length
    }
}

# generate output
Write-Host "Breakdown of $path"
Write-Host "Total Directories: $folderCount"
Write-Host "Total Files: $fileCount"
Write-Host "Total Size of files: $($totalSize / 1MB) MB"