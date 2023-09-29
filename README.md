# `wsl-launchers` README

This repo contains tooling which permits a Windows system running [Windows
Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/about) (WSL)
and an X Server implementation for Windows such as [X410](https://x410.dev/) to
create Windows shortcuts (including on the Start menu) which will launch
graphical Linux applications which behave exactly like native Windows apps.

It is inspired by the relevant [X410 cookbook
documentation](https://x410.dev/cookbook/wsl/opening-linux-terminal-directly-from-file-explorer/)
but has some improvements:

1.  The solution uses the special `WSLENV` mechanism in new WSL2 builds to
    handle `DISPLAY` forwarding and other environment variables instead of
    having to repeatedly re-set them or story them in login shell scripts;
2.  All the launcher logic is containing in a single, three-line VBS script,
    instead of requiring an additional Windows batch file;
3.  A PowerShell script is provided which can generate Windows shortcuts which
    use the above tooling, instead of requiring this to be hand-written.

## Prerequisites

-   WSL2
-   Ubuntu or other distro installed inside WSL
-   An X Server for Windows (X410 has been tested)

## Setup

1.  Ensure that the distro you've selected is set to the WSL default (using
    `wsl -s`).
2.  Install whatever package is to have the shortcut created (using e.g.
    `apt`).
3.  Install a nice GTK theme, e.g. `Arc` (`sudo apt install arc-theme`)
4.  Add `DISPLAY` and `GTK_THEME` Windows environment variables and then export
    them using the magic `WSLENV` variable:

    ```sh
    GTK_THEME=Arc:dark
    DISPLAY=172.29.192.1:0.0
    WSLENV=DISPLAY/u:GTK_THEME/u
    ```

    `DISPLAY` here needs to match the IP that your WSL distro uses; you can
    retrieve this from `/etc/resolv.conf` on the distro instance
5.  Run the generator:

    ```powershell
    ./generator.ps1 gedit
    ```

    The script takes a second argument if you are launching something more
    complicated than a binary on `$PATH`:

    ```powershell
    ./generator.ps1 pycharm '"nohup ~/pycharm-community-2020.2.1/bin/pycharm.sh >/dev/null 2>&1"'
    ```

6.  Right-click your shortcut and select `Pin to Start`

## TODO

-   Add icon support to the generator; at the moment it sets all shortcuts to
    use the default WSL icon (Tux)
-   Error handling and usage
