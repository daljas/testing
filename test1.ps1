# Define URLs for Slack, Zoom, and AnyDesk
$slackUrl = "https://downloads.slack-edge.com/releases/windows/4.35.126/prod/x64/SlackSetup.exe"
$zoomUrl = "https://zoom.us/client/5.16.6.24712/ZoomInstallerFull.exe?archType=x64"
$anyDeskUrl = "https://anydesk.com/en/downloads/thank-you?dv=win_exe"

# Define download paths
$slackPath = "$env:USERPROFILE\Downloads\SlackSetup.exe"
$zoomPath = "$env:USERPROFILE\Downloads\ZoomInstaller.exe"
$anyDeskPath = "$env:USERPROFILE\Downloads\AnyDesk.exe"

# Download Slack in the background
Start-Process PowerShell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"Invoke-WebRequest -Uri '$slackUrl' -OutFile '$slackPath' -UseBasicParsing`"" -PassThru | Wait-Process

# Download Zoom in the background
Start-Process PowerShell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"Invoke-WebRequest -Uri '$zoomUrl' -OutFile '$zoomPath' -UseBasicParsing`"" -PassThru | Wait-Process

# Download AnyDesk in the background
Start-Process PowerShell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"Invoke-WebRequest -Uri '$anyDeskUrl' -OutFile '$anyDeskPath' -UseBasicParsing`"" -PassThru | Wait-Process

# Wait for all processes to finish
Wait-Process
Write-Host "Downloads completed. Now starting installations."

# Install Slack
Start-Process -Wait -FilePath $slackPath

# Install Zoom
Start-Process -Wait -FilePath $zoomPath

# Install AnyDesk
Start-Process -Wait -FilePath $anyDeskPath

Write-Host "Installations completed."
