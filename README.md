# Fedora i3 dotfiles

> [!CAUTION]
> Before running any script from this repository, make a backup of your `~/.config/` folder because this will directly overwrite it. 

A keyboard-driven Linux desktop built around i3, Rofi and Polybar, with wallpaper-based colors and matching terminal and application themes.

## What it installs

Configuration files and helper scripts for:

- **Desktop:** i3 window management, Polybar panels, Picom transparency and blur, Rofi menus, wallpaper selection and screen locking.
- **Terminal and development:** Kitty, Fish, Starship and Neovim/LazyVim, including research and notebook plugin configurations.
- **Everyday tools:** Ranger, Zathura, mpv, btop, cava and fastfetch.
- **Appearance and integration:** GTK, Qt, Kvantum, font settings, MIME associations and Git ignore rules.

The installer copies configuration into your chosen `.config` folder. Applications, fonts and Neovim plugin runtimes must be installed separately. Existing files are backed up inside `.config/.dotfiles-backups/`.

## Linux workflow

Designed for **Fedora with i3 on X11**, this setup combines tiling workspaces with a searchable launcher for applications, commands, folders and websites. Rofi also provides clipboard history, a shortcut reference and appearance controls. Polybar brings together system status and wallpaper selection; pywal synchronizes wallpaper colors with the desktop.

Common shortcuts use the Super/Windows key as `Mod`:

| Shortcut | Action |
| --- | --- |
| `Mod+Return` | Open Kitty |
| `Mod+D` | Search applications, commands, folders and websites |
| `Mod+W` | Switch windows |
| `Mod+C` | Open clipboard history |
| `Mod+F1` | Show shortcuts |
| `Mod+T` | Toggle the scratch terminal |
| `Mod+Shift+W` | Cycle wallpapers |
| `Mod+Ctrl+L` | Lock the session |

## Installation

1. Prepare an i3/X11 session with Bash and Python 3. Install the desktop tools: i3, Polybar, Picom, Rofi, Kitty, feh, xss-lock, i3lock, dex-autostart and NetworkManager's applet. Helpers use ImageMagick (`magick`), xdotool, xprop, xsel, xdpyinfo, xrandr, xrdb, scrot, brightnessctl, xdg-open, pactl, playerctl and pavucontrol. Wallpaper theming requires `wal` (pywal) and `pywalfox` on your PATH.
2. Install **SpaceMono Nerd Font** for the main interface. Optional themes also use Terminess Nerd Font, JetBrains Mono Nerd Font and Rubik. Install the configured applications you want to use; GTK/Qt icon themes can be changed to ones available on your system.
3. Clone or download this repository, then open a terminal in its directory. Edit `CONFIG_DIR` in `install.sh` if your configuration folder differs from `$HOME/.config`.
4. Preview the destination files, then install:

   ```sh
   ./install.sh --dry-run
   ./install.sh
   ```

   You can also choose the destination through an environment variable:

   ```sh
   CONFIG_DIR="$HOME/.config" ./install.sh
   ```

5. Review `polybar/config.ini` for your battery, power adapter, backlight and network hardware. Put wallpapers in `~/Pictures` and create `~/Pictures/screenshots` for the Print shortcut. Log into i3, or reload an existing session with `Mod+Shift+R`.

Use the installer rather than copying the repository's `.config` files directly: it fills in destination paths. Home and destination paths must contain only letters, digits, `/`, `.`, `_` and `-`. For a nonstandard configuration directory, set `XDG_CONFIG_HOME` when starting the session and point i3 to its config with `i3 -c /path/to/config/i3/config`.

Installation needs no root access and writes only inside the destination configuration folder. Package installation, login-manager selection and system keyboard settings remain separate setup steps. Neovim installs plugins on first launch; notebook and research integrations require their corresponding Python, Jupyter, Quarto, TeX or Lean environments.
