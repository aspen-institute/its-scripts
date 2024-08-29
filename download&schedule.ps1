$myDownloadUrl1="https://raw.githubusercontent.com/aspen-institute/its-scripts/Win-11-Toast-Notification/New-ToastNotification.ps1"
$myDownloadUrl2="https://raw.githubusercontent.com/aspen-institute/its-scripts/Win-11-Toast-Notification/RunToastHidden.cmd"
$myDownloadUrl3="https://raw.githubusercontent.com/aspen-institute/its-scripts/Win-11-Toast-Notification/Hidden.vbs"
Invoke-WebRequest $myDownloadUrl1 -OutFile C:\Users\Public\Documents\New-ToastNotification.ps1
Invoke-WebRequest $myDownloadUrl2 -OutFile C:\Users\Public\Documents\RunToastHidden.cmd
Invoke-WebRequest $myDownloadUrl3 -OutFile C:\Users\Public\Documents\Hidden.vbs
$User = $env:USERNAME
$Argument= "C:\Users\Public\Documents\Hidden.vbs C:\Users\Public\Documents\RunToastHidden.cmd"
$Trigger = New-ScheduledTaskTrigger –Daily -At 8:16pm
$TriggerRepeat = New-ScheduledTaskTrigger -Once -RepetitionInterval (New-TimeSpan -Minutes 5) -At 8:16pm
$Trigger.Repetition = $TriggerRepeat.Repetition
$Action = New-ScheduledTaskAction -Execute "wscript.exe" -Argument $Argument
Register-ScheduledTask -TaskName "Reboot Check" -Trigger $Trigger -User $User -Action $Action –Force