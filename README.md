# WSL2 shortcut generator

## Prerequisites

-   WSL2
-   Ubuntu or other distro installed
-   X410

## Setup

1.  Install whatever package is to have the shortcut created (using e.g. `apt`)
2.  Install a nice GTK theme, e.g. `Arc` (`sudo apt install arc-theme`)
3.  Add `DISPLAY` and `GDK_THEME` Windows environment variables and then export
    them using the magic `WSLENV` variable:
    ```
    GTK_THEME=Arc:dark
    DISPLAY=172.29.192.1:0.0
    WSLENV=DISPLAY/u:GTK_THEME/u
    ```
4.  Run the generator:
    ```powershell
    ./generator.ps1 gedit
    ```
    or
    ```
    ```powershell
     ./generator.ps1 pycharm '"nohup ~/pycharm-community-2020.2.1/bin/pycharm.sh >/dev/null 2>&1"'
     ```
5.  Right-click your shortcut and select `Pin to Start`
