WScript.CreateObject("Shell.Application").ShellExecute "x410.exe", "/wm", "", "open", 0
WScript.CreateObject("Shell.Application").ShellExecute "C:\Windows\System32\wsl.exe", "sh -ic 'if [ -z $(pidof dbus-launch) ]; then dbus-launch --exit-with-x11; fi'", "", "open", 0
WScript.CreateObject("Shell.Application").ShellExecute "C:\Windows\System32\wsl.exe", WScript.Arguments(0), "", "open", 0
