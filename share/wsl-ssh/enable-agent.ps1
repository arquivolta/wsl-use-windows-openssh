param([switch]$Elevated)

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false)  {
    if ($elevated) {
        # tried to elevate, did not work, aborting
    } else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
    }
    exit
}

try {
	Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
	Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
	Set-Service -Name ssh-agent -StartupType Automatic
	Start-Service -Name ssh-agent
} catch {
  Write-Output $_
}

exit
