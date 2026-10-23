# Changes to make WhiteSurLiquid theme more like macOS Liquid Glass

## Kvantum Theme (Qt application style)
- Increased transparency of window backgrounds, input fields, buttons, etc.
- Increased blur radius for menus and tooltips.
- Reduced window opacity reduction for inactive windows (set to 0, relying on color alpha).

## Plasma Desktop Theme (Panels, widgets, etc.)
- Increased transparency of view backgrounds (e.g., in list views, tooltips, window backgrounds) by adding alpha channel.

## Aurorae Window Decoration
- Made the window title bar and background more translucent by adding alpha channel to fill colors.

## Top panel (menu bar) layout
- Launcher button now shows an Apple-style logo (`whitesur-start-here-symbolic`, installed into the hicolor icon theme) instead of the generic `start-here-kde-symbolic` icon. The old `desktoptheme/icons/start.svg` override is ignored by Plasma 6.
- Panel height reduced to 28 px, closer to the macOS menu bar.
- Clock shows date beside the time on one line (`ddd d MMM`), like macOS.
- Window buttons on the left in macOS order (close, minimize, maximize = `XIA`). Since Plasma 6.0 the Global Theme reads `ButtonsOnLeft`/`ButtonsOnRight` from `contents/layouts/defaults`, not from `contents/defaults`, so that file was added to every variant (also fixed the order from `XAI` to `XIA` in `defaults`, and the WhiteSurLiquid-dark decoration name, which pointed to the non-existent `WhiteSurLiquidDark` instead of `WhiteSurLiquid-dark`).
- Bottom dock: an applications button (`org.kde.plasma.kicker` with the theme's `whitesur-launchpad` icon) before the launchers and the trash (`org.kde.plasma.trash`) at the end, like the macOS Dock.
- Terminal with a macOS Terminal style icon (`whitesur-terminal`): `install.sh` copies the system `org.kde.konsole.desktop` into the user applications dir (`/usr/local/share/applications` as root) with only `Icon=` changed. The desktop entry id stays the same, so running Konsole windows keep grouping with the dock launcher on X11 and Wayland.
- Top panel attached to the screen edge (`floating = false`, Plasma 6 floats new panels by default) and the dock floating like the macOS Dock.
- Fixed the WhiteSurLiquid/WhiteSurLiquid-dark global themes pointing to non-existent names (Plasma theme `WhiteSurLiquidDark`, icon theme `WhiteSurLiquidDark`, cursors `WhiteSurLiquid*-cursors`), which made Plasma fall back to Breeze for panels and icons. They now use `WhiteSurLiquid-dark` / `WhiteSurLiquid` for the Plasma theme and the regular WhiteSur icon and cursor themes, like the other variants. Also fixed the ids in the Liquid desktop theme metadata.
- Trash icons are now the macOS style ones from the WhiteSur icon theme (GPL-3.0, unchanged), and `install.sh` downloads and installs the WhiteSur icon theme itself when it is missing (skip with `--no-icons`), so all app icons in the dock get the same rounded macOS size.
- macOS style trash icon: the trash applet always uses `user-trash`/`user-trash-full` from the icon theme, so the global themes now select `WhiteSurMac` / `WhiteSurMac-dark`, two tiny icon themes shipped here that only contain those icons and inherit WhiteSur (or Breeze when WhiteSur icons are not installed) for everything else.
- Launchpad and Terminal icons fill the icon box like other app icons; the Apple logo is plain white instead of following the panel text colour.
- Top-left launcher icon is the Brasiltec monogram (`whitesur-brasiltec`, from the favicon of brasiltec.ind.br); the Apple logo (`whitesur-start-here-symbolic`) stays installed and can be chosen in the Kickoff settings.
- Restored the WhiteSurLiquid (light) Kvantum theme: the Liquid commit had cut `WhiteSurLiquid.kvconfig` down to `[%General]` and `[GeneralColors]`, dropping every widget section, so Kvantum drew those widgets with its built-in defaults. It is now the WhiteSur light theme plus the Liquid translucency values.
- Menus closer to macOS: Kvantum menus (global menu drop-downs) are less translucent (`reduce_menu_opacity` 25 -> 10, blur radius 12) with taller rows and wider side padding; the WhiteSurLiquid-dark popup background (Kicker/Kickoff, tray popups) went from 65% to 88% opaque so text stays readable over the wallpaper. Blur behind popups still depends on the KWin Blur effect being enabled.
- Applies to the layout of all global themes (WhiteSur, WhiteSur-alt, WhiteSur-dark, WhiteSurLiquid, WhiteSurLiquid-dark); existing panels are not changed, re-apply the global theme with "Desktop and window layout" enabled.

## Notes
- The blur effect for windows requires the KWin Blur effect to be enabled in system settings.
- Further adjustments may be needed for specific widgets or window states.
