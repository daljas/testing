# Define URLs for Slack, Zoom, and AnyDesk
$slackUrl = "https://codefellows.slack.com/archives/C065724314Y/p1700183701218439"
$zoomUrl = "https://zoom.us/client/5.16.6.24712/ZoomInstallerFull.exe?archType=x64"
$anyDeskUrl = "https://anydesk.com/en/downloads/thank-you?dv=win_exe"

# Define download paths
$slackPath = "$env:USERPROFILE\Downloads\SlackSetup.exe"
$zoomPath = "$env:USERPROFILE\Downloads\ZoomInstaller.exe"
$anyDeskPath = "$env:USERPROFILE\Downloads\AnyDesk.exe"

# Function to download and install an application
function DownloadAndInstall {
    param (
        [string]$Url,
        [string]$Path
    )

    # Download the application
    Invoke-WebRequest -Uri $Url -OutFile $Path -UseBasicParsing

    # Install the application
    Start-Process -Wait -FilePath $Path
}

# Start jobs for downloading and installing each application
Start-Job -ScriptBlock { DownloadAndInstall -Url $slackUrl -Path $slackPath }
Start-Job -ScriptBlock { DownloadAndInstall -Url $zoomUrl -Path $zoomPath }
Start-Job -ScriptBlock { DownloadAndInstall -Url $anyDeskUrl -Path $anyDeskPath }

# Wait for all jobs to complete
Get-Job | Wait-Job

# Receive the job results (optional)
Receive-Job -AutoRemoveJob

Write-Host "Installations completed."
