param (
    [string]$Repo,

    [ValidateSet('Active', 'Abandoned', 'Completed', 'All')]
    [string]$Status = 'Active'
)
#Import-Module $(get-item src\utils.ps1).FullName -Force
$(Join-Path -path $PSScriptRoot -ChildPath utils.ps1 | get-item).FullName | Import-Module -Force
$settings = Get-VSTSSettings

$defaultEncoding = [System.Text.Encoding]::GetEncoding('ISO-8859-1')
$utf8 = [System.Text.Encoding]::GetEncoding('UTF-8')

$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $settings.username,$settings.token)))

$url = "https://$($settings.instance)/defaultcollection/_apis/git/repositories/$(Get-Repo $Repo)/pullRequests?api-version=3.0-preview"

if ($Status -ne "All") {
    $url = $url + "&status=$Status"
}

[string]$str = Invoke-RestMethod -Uri $url -Method Get -ContentType 'application/json' -Headers @{Authorization=("Basic {0}" -f $base64AuthInfo) } | ConvertTo-Json
$resp=$utf8.GetString($defaultEncoding.GetBytes($str)) | ConvertFrom-Json

return $resp.value


#[&status={string}&creatorId={GUID}&reviewerId={GUID}&sourceRefName={string}&targetRefName={string}&$top={integer}&$skip={integer}]"


