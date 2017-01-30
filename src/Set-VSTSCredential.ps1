param(
    [Parameter(Mandatory=$true)] [string]$UserName,
    [Parameter(Mandatory=$true)] [string]$Token,
    [Parameter(Mandatory=$true)] [string]$Instance,
    [Parameter(Mandatory=$False)][string]$DefaultRepository
)


$appFolder =  join-path -Path $([Environment]::GetFolderPath("LocalApplicationData")) -ChildPath "vsts-powershell"
if (-Not(Test-Path $appFolder)) {
    mkdir $appFolder
}

$settings = @{
    username=$UserName;
    token=$Token;
    instance=$Instance;
    defaultrepo=$DefaultRepository
} | ConvertTo-Json | Out-File $(Join-Path $appFolder "settings.json" )

