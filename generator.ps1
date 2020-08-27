# $SourceFileLocation = "$env:SystemRoot/System32/notepad.exe"
$SourceFileLocation = "$env:SystemRoot/System32/wscript.exe"
$ShortcutLocation = "$pwd/generated.lnk"

$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutLocation)

$Shortcut.TargetPath = $SourceFileLocation

# these need fixed
# $Shortcut.SpecialFolders("Desktop")
# $Shortcut.WindowStyle = 3  &&Maximized 7=Minimized  4=Normal

# $Shortcut.IconLocation = "C:\myicon.ico"
$Shortcut.IconLocation = "C:\\windows\\system32\\shell32.dll,3"
# $Shortcut.Arguments = 'D:\Development\wsl\wsl.vbs gedit'
$Shortcut.Arguments = "$pwd\wsl.vbs" + ' "nohup ~/pycharm-community-2020.2.1/bin/pycharm.sh >/dev/null 2>&1"'

# $Shortcut.Hotkey = "ALT+CTRL+F"
# $Shortcut.WorkingDirectory = "c:\"

#Save the Shortcut to the TargetPath
$Shortcut.Save()
