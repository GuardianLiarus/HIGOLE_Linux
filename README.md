# HIGOLA / HIGOLE - Linux
[HIGOLA Gole2Pro / HIGOLE GOLE 2 Pro](https://goleminipc.com/de/products/higole-gole-2-pro-mini-pc-windows-11-pro-intel-celeron-n5095-16gb-lpddr4-256gb-rom) Linux Setup.

Guide to fix the issues with the very cool handheld device when running modern Linux, this is an updated guide based on [JohnJayMcKaye 's guide](https://github.com/JohnJayMcKaye/HIGOLA)

This guide is a work in progress, feel free to contribute!

## X11 Setup (Currently working)
⚠️ The screen rotation part will work only with OpenRC init systems

### Fix to get the auto screen rotation working
```
echo $'#!/sbin/openrc-run\ncommand=/usr/lib/iio-sensor-proxy\ncommand_background=yes\npidfile=/run/iio-sensor-proxy.pid\ndepend() {\n\tneed dbus localmount\n}' | sudo tee /etc/init.d/iio-sensor-proxy
```

### Fix for the inverted accelerometer (inverted screen rotation)
```
echo $'ENV{ACCEL_MOUNT_MATRIX}="0, -1, 0; -1, 0, 0; 0, 0, 1"' | sudo tee \
    /etc/udev/rules.d/99-gole2pro-accel.rules
```

### Fix for the inverted Touchscreen input
```
echo $'ENV{LIBINPUT_CALIBRATION_MATRIX}="-1 0 1 0 -1 1"' | sudo tee \
    /etc/udev/rules.d/99-gole2pro-touch.rules
```

### Fix to get the internal speaker working
Edit the file     /usr/share/alsa-card-profile/mixer/paths/analog-output-speaker.conf and change this lines: 
```
[Element Headphone]
switch = mute
volume = merge
```
If you are on an immutable distribution such as Fedora Silverblue or Bazzite, you can copy analog-output-speaker.conf to ~/.config/alsa-card-profile/mixer/paths/analog-output-speaker.conf and edit it there.


## Wayland Setup (Broken at the moment)

### Fix for the inverted Touchscreen input (Currently broken, see [libinput#1298](https://gitlab.freedesktop.org/libinput/libinput/-/work_items/1298))
```
echo $'ENV{LIBINPUT_CALIBRATION_MATRIX}="-1 0 1 0 -1 1"' | sudo tee \
    /etc/udev/rules.d/99-gole2pro-touch.rules
```

### Fix for the inverted accelerometer (inverted screen rotation)
```
echo $'ENV{ACCEL_MOUNT_MATRIX}="0, -1, 0; -1, 0, 0; 0, 0, 1"' | sudo tee \
    /etc/udev/rules.d/99-gole2pro-accel.rules
```

### Fix to get the internal speaker working
Edit the file     /usr/share/alsa-card-profile/mixer/paths/analog-output-speaker.conf and change this lines: 
```
[Element Headphone]
switch = mute
volume = merge
```
If you on Immutable Distro like Fedora Silverblue, you can copy analog-output-speaker.conf to ~/.config/alsa-card-profile/mixer/paths/analog-output-speaker.conf and edit.
