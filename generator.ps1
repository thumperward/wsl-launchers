# $SourceFileLocation = "$env:SystemRoot/System32/notepad.exe"
$SourceFileLocation = "$env:SystemRoot/System32/wscript.exe"
$ShortcutLocation = "$pwd/" + $Args[0] + ".lnk"

$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutLocation)
$Shortcut.TargetPath = $SourceFileLocation

$Shortcut.IconLocation = "$env:SystemRoot/System32/wsl.exe"
# $Shortcut.IconLocation = "C:\myicon.ico"
# $Shortcut.IconLocation = "$env:SystemRoot/System32/shell32.dll,3"
If ($Args.Count > 2) {
  $Shortcut.Arguments = "$pwd\wsl.vbs " + $Args[0]
}
Else {
  # $Shortcut.Arguments = "$pwd\wsl.vbs" + ' "nohup ~/pycharm-community-2020.2.1/bin/pycharm.sh >/dev/null 2>&1"'
  $Shortcut.Arguments = "$pwd\wsl.vbs" + ' ' + $Args[1]
}

# $Shortcut.Hotkey = "ALT+CTRL+F"
# $Shortcut.WorkingDirectory = "c:\"
# these need fixed
# $Shortcut.SpecialFolders("Desktop")
# $Shortcut.WindowStyle = 3  &&Maximized 7=Minimized  4=Normal

$Shortcut.Save()
