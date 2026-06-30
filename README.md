# HIGOLE - Linux
[HIGOLE GOLE 2 Pro](https://goleminipc.com/de/products/higole-gole-2-pro-mini-pc-windows-11-pro-intel-celeron-n5095-16gb-lpddr4-256gb-rom) Linux Setup.

Guide to fix the issues with the very cool handheld device when running modern Linux, this is an updated guide based on [JohnJayMcKaye's guide](https://github.com/JohnJayMcKaye/HIGOLA)

This guide is a work in progress, feel free to contribute!

**OS Specific notes:**
This guide was tested on [CachyOS](https://cachyos.org/), [Fedora KDE](https://fedoraproject.org/kde/) and [Linux Mint](https://www.linuxmint.com/)

## Wayland Setup

### Fix for the inverted Touchscreen input (Currently broken on KDE, see [Bug 521464](https://bugs.kde.org/show_bug.cgi?id=521464))
Creates a udev rule ``/etc/udev/rules.d/99-gole2pro-touch.rules``
```
echo $'ENV{LIBINPUT_CALIBRATION_MATRIX}="-1 0 1 0 -1 1"' | sudo tee \
    /etc/udev/rules.d/99-gole2pro-touch.rules
```

### Fix for the inverted accelerometer (inverted screen rotation)
Creates a udev rule ``/etc/udev/rules.d/99-gole2pro-accel.rules``
```
echo $'ENV{ACCEL_MOUNT_MATRIX}="0, -1, 0; -1, 0, 0; 0, 0, 1"' | sudo tee \
    /etc/udev/rules.d/99-gole2pro-accel.rules
```

### Fix to get the internal speaker working
Edit the file ``/usr/share/alsa-card-profile/mixer/paths/analog-output-speaker.conf`` and change this lines: 
```
[Element Headphone]
switch = mute
volume = merge
```
If you are on an immutable distribution such as Fedora Silverblue or Bazzite, you can copy analog-output-speaker.conf to ~/.config/alsa-card-profile/mixer/paths/analog-output-speaker.conf and edit it there.


## X11 Setup (Currently working)

### Fix to get the auto screen rotation working
*Not needed for Linux Mint's x11 session, you will however need to Disable automatic screen rotation in the display settings, somehow that makes it work*

- Install ``iio-sensors-proxy`` with your package manager
- Install ``screenrotator-git`` (available in the AUR, package is deprecated, and PKGBUILD might need manual editing)
- Add Screen Rotator to startup programs, and reboot.

### Fix for the inverted accelerometer (inverted screen rotation)
Creates a udev rule ``/etc/udev/rules.d/99-gole2pro-accel.rules``
```
echo $'ENV{ACCEL_MOUNT_MATRIX}="0, -1, 0; -1, 0, 0; 0, 0, 1"' | sudo tee \
    /etc/udev/rules.d/99-gole2pro-accel.rules
```

### Fix for the inverted Touchscreen input
Creates a udev rule ``/etc/udev/rules.d/99-gole2pro-touch.rules``
```
echo $'ENV{LIBINPUT_CALIBRATION_MATRIX}="-1 0 1 0 -1 1"' | sudo tee \
    /etc/udev/rules.d/99-gole2pro-touch.rules
```

### Fix to get the internal speaker working
Edit the file ``/usr/share/alsa-card-profile/mixer/paths/analog-output-speaker.conf`` and change this lines: 
```
[Element Headphone]
switch = mute
volume = merge
```
If you are on an immutable distribution such as Fedora Silverblue or Bazzite, you can copy analog-output-speaker.conf to ~/.config/alsa-card-profile/mixer/paths/analog-output-speaker.conf and edit it there.
