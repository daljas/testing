# URL of the image
$imageUrl = "https://raw.githubusercontent.com/avalon-lake-tech/mrbeast-scripts/main/avalonlake-desktop.png"

# Path to save the image
$imagePath = "$env:TEMP\avalonlake-desktop.png"

# Download the image
Invoke-WebRequest -Uri $imageUrl -OutFile $imagePath

# Set the image as the desktop background for all users
Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;
    public class Wallpaper {
        [DllImport('user32.dll', CharSet = CharSet.Auto)]
        public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
    }
    [Wallpaper]::SystemParametersInfo(20, 0, '$imagePath', 3)
