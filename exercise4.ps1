# this example will error and go directly to the catch
# try {
#     Get-Item -Path c:\nope\nope.txt -ErrorAction Stop; Write-Host 'Hello, will I run after an error?'
# }
# catch {
#     Write-Host 'You are now in the catch'
# }

# $processNames = @(
#     'NotAProcess',
#     'Notepad'

# )
# foreach ($item in $processNames) {
#     try {
#         Get-Process -Nam $item -ErrorAction Stop
#     }
#     catch {
#         Write-Host $item
#     }
# }

$uri = Read-Host 'Enter the URL'
try {
    $webResults = Invoke-WebRequest -Uri $uri -ErrorAction Stop
}
catch {
    $statusCodeValue = $_.Exception.Response.StatusCode.value__
    switch ($statusCodeValue) {
        400 {
            Write-Warning -Message "HTTP Status Code 400 Bad Request. Check the URL and try again."
        }
        401 {
            Write-Warning -Message "HTTP Status Code 401 Unauthorized."
        }
        403 {
            Write-Warning -Message "HTTP Status Code 403 Forbidden. Server may be having issues. Check the URL and try again."
        }
        404 {
            Write-Warning -Message "HTTP Status Code 404 Not found. Check the URL and try again."
        }
        500 {
            Write-Warning -Message "HTTP Status Code 500 Internal Server Error."
        }
        Default {
            throw
        }
    }
}