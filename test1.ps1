# Specify the path to the background image
$backgroundImagePath = "https://raw.githubusercontent.com/avalon-lake-tech/mrbeast-scripts/main/avalonlake-desktop.png"

# Set the background for the current user
SystemParametersInfo 0x0014, 0, $backgroundImagePath, 0
# Force an immediate update
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

# Set the background for the default user profile (new users)
$defaultUserProfilePath = Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders' -Name 'Common Desktop' | Select-Object -ExpandProperty 'Common Desktop'
$defaultUserBackgroundPath = Join-Path $defaultUserProfilePath "background.jpg"
Copy-Item -Path $backgroundImagePath -Destination $defaultUserBackgroundPath
