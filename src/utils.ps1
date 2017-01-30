function Get-VSTSSettings {
    return join-path -Path $([Environment]::GetFolderPath("LocalApplicationData")) -ChildPath "vsts-powershell\settings.json" | Get-Item | Get-Content | ConvertFrom-Json
}


function Get-Repo ($paramRepo) {
    if (-Not ([string]::IsNullOrWhiteSpace($paramRepo))) {
        return $paramRepo;
    }

    return $(Get-VSTSSettings).defaultrepo
}