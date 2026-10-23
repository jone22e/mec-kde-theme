var panel = new Panel
var panelScreen = panel.screen

// No need to set panel.location as ShellCorona::addPanel will automatically pick one available edge

// Thin top bar, close to the height of the macOS menu bar
panel.height = 28
panel.location = "top"
panel.floating = false

// Restrict horizontal panel to a maximum size of a 21:9 monitor
const maximumAspectRatio = 21/9;
if (panel.formFactor === "horizontal") {
    const geo = screenGeometry(panelScreen);
    const maximumWidth = Math.ceil(geo.height * maximumAspectRatio);

    if (geo.width > maximumWidth) {
        panel.alignment = "center";
        panel.minimumLength = maximumWidth;
        panel.maximumLength = maximumWidth;
    }
}

var kickoff = panel.addWidget("org.kde.plasma.kickoff")
// Brasiltec monogram shipped by this theme in the hicolor icon theme (see install.sh);
// whitesur-start-here-symbolic (Apple logo) is still installed as an alternative
kickoff.currentConfigGroup = ["General"]
kickoff.writeConfig("icon", "whitesur-brasiltec")
kickoff.currentConfigGroup = ["Shortcuts"]
kickoff.writeConfig("global", "Alt+F1")

var bpanel = new Panel
bpanel.location = "bottom"
bpanel.lengthMode = "fit"
bpanel.hiding = "dodgewindows"
bpanel.height = 64
bpanel.floating = true

// Dock, left to right like macOS: applications button, app launchers, trash
var dockApps = bpanel.addWidget("org.kde.plasma.kicker")
dockApps.currentConfigGroup = ["General"]
dockApps.writeConfig("icon", "whitesur-launchpad")

let taskBar = bpanel.addWidget("org.kde.plasma.icontasks")
taskBar.currentConfigGroup = ["General"]
taskBar.writeConfig("launchers", [
    "preferred://filemanager",
    "preferred://browser",
    "applications:org.kde.konsole.desktop",
    "applications:systemsettings.desktop",
])

bpanel.addWidget("org.kde.plasma.trash")
panel.addWidget("org.kde.plasma.appmenu")
panel.addWidget("org.kde.plasma.panelspacer")
panel.addWidget("org.kde.plasma.marginsseparator")
panel.addWidget("org.kde.plasma.systemtray")
panel.addWidget("org.kde.plasma.marginsseparator")
// Clock like the macOS menu bar: "Wed 22 Oct  4:29 PM" on a single line
var clock = panel.addWidget("org.kde.plasma.digitalclock")
clock.currentConfigGroup = ["Appearance"]
clock.writeConfig("showDate", true)
clock.writeConfig("dateDisplayFormat", "BesideTime")
clock.writeConfig("dateFormat", "custom")
clock.writeConfig("customDateFormat", "ddd d MMM")
panel.addWidget("org.kde.plasma.showdesktop")

