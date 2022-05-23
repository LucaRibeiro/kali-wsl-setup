#Requires -RunAsAdministrator

<#
.SYNOPSIS
Install packages managers/command-line installers
.DESCRIPTION
The Install-PackagesManagers function install chocolatey, scoop and winget.
.EXAMPLE
Install-PackagesManagers
    This command install all tools(chocolatey, scoop and winget.).
.EXAMPLE
Install-PackagesManagers -Ignore scoop
    This command install only chocolatey and winget.
.EXAMPLE
Install-PackagesManagers -Only scoop
    This command install only scoop.
.INPUTS
    System.String
        You can pipe the name of tools to ignore on  that contains a path to Get-FolderSize.
.OUTPUTS
    System.String
.NOTES
Version History
v1.0 – Luca Regne – Initial release
#>
function Install-PackagesManagers {
    [CmdletBinding()]
    Param ()
    Begin {
        function Install-Scoop {
            try {
                Get-Command scoop -ErrorAction Stop | Out-Null
                Write-Host "Scoop already is installed"  -ForegroundColor Green
                scoop update
                try {
                    Get-Command sudo -ErrorAction Stop | Out-Null
                    scoop update sudo
                }
                catch {
                    scoopt install sudo
                }
            }
            catch {
                Write-Host "Installing Scoop" -ForegroundColor Green
                Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
            }
        }
        
        function Install-Choco {
            try {
                Get-Command choco -ErrorAction Stop | Out-Null
                Write-Host "Chocolatey already is installed" -ForegroundColor Green
            }
            catch {
                Write-Host "Installing Chocolatey"  -ForegroundColor Green
                Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')
            }
        }
        
        function Install-winget {
            try {
                Get-Command winget -ErrorAction Stop | Out-Null
                Write-Host "Winget already is installed"  -ForegroundColor Green
            }
            catch {
                Write-Host "Installing WinGet" -ForegroundColor Green
                $ResponseRest = Invoke-WebRequest https://api.github.com/repos/microsoft/winget-cli/releases/latest
                $LatestTag = (ConvertFrom-Json ($ResponseRest).Content).tag_name
                $UrlDownload = "https://github.com/microsoft/winget-cli/releases/download/$LatestTag/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
                Add-AppPackage -ExternalLocation $UrlDownload
            }
        }
        
    }

    Process {
        Install-winget
        Install-Choco
        Install-Scoop
    }

    End {}
}