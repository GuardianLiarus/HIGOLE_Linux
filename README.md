# HIGOLA - Linux
[HIGOLA Gole2Pro](https://goleminipc.com/de/products/higole-gole-2-pro-mini-pc-windows-11-pro-intel-celeron-n5095-16gb-lpddr4-256gb-rom) Linux Setup, also called HIGOLE Gole 2 Pro Mini.

Fix all issues of the very cool handheld Linux device, that came original with Windows. 


## Fix for inverted Touchscreen

```
echo $'ENV{LIBINPUT_CALIBRATION_MATRIX}="-1 0 1 0 -1 1"' | sudo tee \
    /etc/udev/rules.d/99-gole2pro-touch.rules
```

## Fix for inverted accelerometer

```
echo $'ENV{ACCEL_MOUNT_MATRIX}="0, -1, 0; -1, 0, 0; 0, 0, 1"' | sudo tee \
    /etc/udev/rules.d/99-gole2pro-accel.rules
```

## Fix for no audio from Internal Speaker

edit the file     /usr/share/alsa-card-profile/mixer/paths/analog-output-speaker.conf and change this lines: 

```
[Element Headphone]
switch = mute
volume = merge
```
If you on Immutable Distro like Fedora Silverblue, you can copy analog-output-speaker.conf to ~/.config/alsa-card-profile/mixer/paths/analog-output-speaker.conf and edit. 

=Tested with Fedora Silverblue 41=
