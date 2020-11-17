#retrieve dynamic content from a website
$webResults = Invoke-WebRequest -Uri 'https://reddit.com/r/powershell.json'
$rawJSON = $webResults.Content
$objData = $rawJSON | ConvertFrom-Json
$posts = $objData.data.children.data
$posts | Select-Object Title,Score | Sort-Object Score -Descending


[int]$numPosts = Read-Host -Prompt "Enter the number of posts to read"
$posts | Select-Object Title,url | Sort-Object Score -Descending | Select-Object -First $numPosts

[int]$numFacts = Read-Host -Prompt "Enter the number of cat facts you would like"
$webResults = Invoke-RestMethod -Uri "https://catfact.ninja/facts?limit=$numFacts&max_length=140"
$webResults.data

$processes = Get-Process
$processes | Out-File C:\Test\processInfo.txt
$processes | ConvertTo-Csv -NoTypeInformation | Out-File c:\test\processes.csv
$processes | Export-Csv -Path c:\test\processes2.csv

$processes = Get-Process
$xml = ConvertTo-Xml -As "Document" -Depth 3 -InputObject $processes