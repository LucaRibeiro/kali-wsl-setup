function Install-ScoopPackages {
    try {
        Get-Command scoop -ErrorAction Stop | Out-Null
        Write-Prompt "Scoop already is installed"  -ForegroundColor Green
        scoop update
        scoop install sudo
    }
    catch {
        Write-Prompt "Installing Scoop" -ForegroundColor Green
        Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh') -ErrorAction SilentlyContinue
    }
}

function Install-ChocoPackages {
    try {
        Get-Command choco -ErrorAction Stop | Out-Null
        Write-Prompt "Chocolatey already is installed"  -ForegroundColor Green
        sudo choco upgrade chocolatey --confirm
    }
    catch {
        Write-Prompt "Installing Chocolatey"  -ForegroundColor Green
        Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')
    }
}

function Check-IsElevated {
    $CurrenIdentity = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $CurrentPrincipal = New-Object System.Security.Principal.WindowsPrincipal($CurrenIdentity)
    
    $AdminRights = [System.Security.Principal.WindowsBuiltInRole]::Administrator

    return $CurrentPrincipal.IsInRole($AdminRights)
}


function Start-ProgrammingConfig {
    $ScoopPackages = @("git", "nodejs", "python", "code")
    $ChocoPackages = @("vscode")
}


function Start-DesktopConfig {
    $IsElevated = Check-IsElevated

    If ($IsElevated) {
        Write-Debug "Already running as adminsitrator"
    }
    Else {
        Write-Error "Detect script running as non-administrator user"
    }
    
    Install-ScoopPackages
    Install-ChocoPackages
    
    Start-ProgrammingConfig
    Update-WSL
}