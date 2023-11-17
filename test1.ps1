# Specify the path to the background image
$backgroundImagePath = "C:\Path\To\Your\Image.jpg"

# Set the background for the current user
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name Wallpaper -Value $backgroundImagePath
# Force an immediate update
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

# Set the background for the default user profile (new users)
$defaultUserProfilePath = Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders' -Name 'Common Desktop' | Select-Object -ExpandProperty 'Common Desktop'
$defaultUserBackgroundPath = Join-Path $defaultUserProfilePath "background.jpg"
Copy-Item -Path $backgroundImagePath -Destination $defaultUserBackgroundPath
