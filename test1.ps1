# Set the desktop background for the current user
$currentUserBackgroundPath = "https://raw.githubusercontent.com/avalon-lake-tech/mrbeast-scripts/main/avalonlake-desktop.png"
SystemParametersInfo(20, 0, $currentUserBackgroundPath, 3)

# Function to call SystemParametersInfo
function SystemParametersInfo($uiAction, $uiParam, $pvParam, $fWinIni) {
    $signature = @"
    [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
    public static extern bool SystemParametersInfo(int uiAction, int uiParam, string pvParam, int fWinIni);
"@
    $type = Add-Type -MemberDefinition $signature -Name SystemParametersInfo -Namespace User32 -PassThru
    $type::SystemParametersInfo($uiAction, $uiParam, $pvParam, $fWinIni) | Out-Null
}
