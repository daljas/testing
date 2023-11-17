# Define the URL of the background image
$backgroundUrl = "https://raw.githubusercontent.com/avalon-lake-tech/mrbeast-scripts/main/avalonlake-desktop.png"

# Set the registry key for the desktop background
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name Wallpaper -Value $backgroundUrl

# Force an update to the desktop settings
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters

Write-Host "Desktop background changed to $backgroundUrl"
