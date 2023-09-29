# wsl sudo apt install -y --no-install-recommends $Args[0]

$SourceFileLocation = "$env:SystemRoot/System32/wscript.exe"
$ShortcutLocation = "$pwd/" + $Args[0] + ".lnk"

$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutLocation)
$Shortcut.TargetPath = $SourceFileLocation

$Shortcut.IconLocation = "$env:SystemRoot/System32/wsl.exe"
# $Shortcut.IconLocation = "C:\myicon.ico"
# $Shortcut.IconLocation = "$env:SystemRoot/System32/shell32.dll,3"

# If a second argument is provided, use that as the command to run instead.
# The first argument is then only used for the shortcut name.
If ($Args.Count -lt 2) {
  $Shortcut.Arguments = "$pwd\wsl.vbs " + $Args[0]
}
Else {
  $Shortcut.Arguments = "$pwd\wsl.vbs " + $Args[1]
}

# $Shortcut.Hotkey = "ALT+CTRL+F"
# $Shortcut.WorkingDirectory = "c:\"

# these need fixed
# $Shortcut.SpecialFolders("Desktop")
# $Shortcut.WindowStyle = 3  &&Maximized 7=Minimized  4=Normal

$Shortcut.Save()
