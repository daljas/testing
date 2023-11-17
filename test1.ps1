# Set the desktop background for the current user
$currentUserBackgroundPath = "https://raw.githubusercontent.com/avalon-lake-tech/mrbeast-scripts/main/avalonlake-desktop.png"
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name Wallpaper -Value $currentUserBackgroundPath
# Refresh the desktop to apply changes
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters, 1, True

# Set the default desktop background for new users
$newUserBackgroundPath = "https://raw.githubusercontent.com/avalon-lake-tech/mrbeast-scripts/main/avalonlake-desktop.png"
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI"
Set-ItemProperty -Path $registryPath -Name 'Background' -Value $newUserBackgroundPath

# Function to refresh the desktop
function Refresh-Desktop {
    param([Parameter(Position=0, Mandatory=$true)] [string]$Path)

    $explorer = New-Object -ComObject shell.application
    $explorer.NameSpace($Path).ParseName('desktop.ini').InvokeVerb('install')
}

# Refresh the desktop for new users
Refresh-Desktop -Path "$env:SystemRoot\system32\config\systemprofile\Desktop"
