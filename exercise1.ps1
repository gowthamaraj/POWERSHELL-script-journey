$process = Get-Process

$more_cpu = $process | Where-Object {$_.CPU -gt 1000}
# $more_cpu

$more_memory = $process | Sort-Object WorkingSet -Descending
# $more_memory

$number = 2
# $number | Get-Member

# ------------------------------

[int]$num1 = '2'
[int]$num2 = '2'
$total = $num1 + $num2
# $total
# ------------------------------

$output = "total is $total"
# Write-Host $output


# --------------------------------
$path = Read-Host -Prompt 'Please enter the file path you wish to scan for large files...'
$rawFileData = Get-ChildItem -Path $path -Recurse
$largeFiles = $rawFileData | Where-Object {$_.Length -gt 1MB}
$largeFilesCount = $largeFiles | Measure-Object | Select-Object -ExpandProperty Count
Write-Host "You have $largeFilesCount large file(s) in $path"