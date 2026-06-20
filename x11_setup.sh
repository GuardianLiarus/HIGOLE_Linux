#!/bin/bash

# Rotate touch input by 180 degrees, rotate gyroscope sensor
echo $'ENV{LIBINPUT_CALIBRATION_MATRIX}="-1 0 1 0 -1 1"\nENV{ACCEL_MOUNT_MATRIX}="0, -1, 0; -1, 0, 0; 0, 0, 1"\nACTION!="remove",KERNEL=="event[0-9]*",ATTRS{name}=="Intel HID 5 button array",ENV{LIBINPUT_IGNORE_DEVICE}="1"\nACTION!="remove",KERNELS=="input2",ATTRS{name}=="Power Button",ENV{LIBINPUT_IGNORE_DEVICE}="1"' | sudo tee \
        /etc/udev/rules.d/99-gole2pro.rules


# Set up screen rotation
echo $'#!/sbin/openrc-run\ncommand=/usr/lib/iio-sensor-proxy\ncommand_background=yes\npidfile=/run/iio-sensor-proxy.pid\ndepend() {\n\tneed dbus localmount\n}' | sudo tee /etc/init.d/iio-sensor-proxy
sudo reboot
