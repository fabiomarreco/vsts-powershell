
# Visual Studio Team Services Powershell Commands

Commands for Microsoft Team Services using Powershell

## Setup

run `Set-VSTSCredential.ps1` to setup repository

```Powershell
.\Set-VSTSCredential.ps1 -UserName "mylogin@email.com" -Token "myaccesstoken" -Instance "instanceID" -DefaultRepository "repositoryID"
```
