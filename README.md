# plank_multi-dock_on_multi-display_solution
Just a solution for Linux Based systems which are using Plank dock, to enable/disable docks when connect/disconnect external display.

Tested version= 0.11.1 (plank) on Ubuntu Gnome (16.04)  

Before Using the script first follow these steps to create copy of dock for external display (Ignore if you know how to create multiple docks)

1. COPY `~/.config/plank/dock1` using command `cp -Rv ~/.config/plank/dock1 ~/.config/plank/dock2`
2. Use `dconf-editor` to change the setting for dock2 (Alternatively if you familiar with `gsettings` from terminal play with it.).
    1. keys will be under net->launchpad->plank->docks->dock2 
    2. Change value of `monitor` to whatever your external port has name (eg. mine is HDMI1, others can be VGA, VGA1,VGA2.. VGAX or HDMI,HDMI1...HDMIX, if dont know follow step 3)
    3. Hold `Ctrl` key and right click on plank dock and then in preferences under Appearance Tab check the values in drop-down list next to On Primary Display Radio Button. Alternatively check under display settings or in `/usr/sys/class/drm/` folder what card number is associated to which port id (this will be useful in script too).
    4. You can also play with other values like `position` key which accepts values `top`,`bottom`,`left` and `right`.


How to use script:

1. Save the script into `/usr/bin/` and give execution permissions to it. (May require superuser or sudo permissions)
2. Add the script to `Startup Applications`. (Remove plank from startup if already there, however this script will kill any other instances of plank, but why to start and kill unnecassarily so remove `plank` if its already in startup).
3. Enjoy !!! 


(I am still waiting for application menu in Plank)
