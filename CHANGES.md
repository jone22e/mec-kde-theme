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
- Applies to the layout of all global themes (WhiteSur, WhiteSur-alt, WhiteSur-dark, WhiteSurLiquid, WhiteSurLiquid-dark); existing panels are not changed, re-apply the global theme with "Desktop and window layout" enabled.

## Notes
- The blur effect for windows requires the KWin Blur effect to be enabled in system settings.
- Further adjustments may be needed for specific widgets or window states.
