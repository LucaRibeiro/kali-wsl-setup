# Kali Setup
Setup main tools for pentest enviromment (tested in Kali WSL).

## Instalation
<table>
  <tr>
    <td>Guide</td>
    <td> Link </td>
  </tr>
  <tr>
    <td> Windows Subsystem for Linux Installation for Windows 10</td>
    <td> <a href="https://docs.microsoft.com/pt-br/windows/wsl/install-win10"> Microsoft Documentation </a></td>
  </tr>
  <tr>
    <td> Manually download Windows Subsystem for Linux distro packages </td>
    <td> <a href="https://docs.microsoft.com/pt-br/windows/wsl/install-manual"> Microsoft Documentation </a> </td>
  </tr>
  <tr>
    <td> Removing Windows paths from WSL path </td>
    <td> <a href="https://gist.github.com/ilbunilcho/4280bd55a10cefef75e74986b6bff936"> GitHub topic </a> </td>
  </tr>
</table>

## Setup
### :heavy_exclamation_mark::heavy_exclamation_mark:__Not necessary clone the project__:heavy_exclamation_mark::heavy_exclamation_mark:
Just run the command as root.
```bash
curl https://raw.githubusercontent.com/lucaregne/init-desktop-config/main/setup.sh | bash
```

## To-do
### Essential
- Install and configure winget
- Install scoop
- Install chocolatey
### Basics
- Install Code
- Install Spotify
- Install Git
- Install GH (GitHub CLI)
- Install Brave Browser, Firefox, Chrome, Opera, Tor
### WSL
- Configure and update WSL
- Install Kali
- Call bash to configure and customize Kali WSL
### Customize
- Customize PowerShell with
    -  nerd fonts    
    - oh-my-posh 
    - posh-git

## Requirements
- PowerShell 7.0 or later
- Script execution `Set-ExecutionPolicy Bypass -Scope Process -Force`
- Administrator privileges 