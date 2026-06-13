#!/bin/bash

# Rotate gyroscope sensor
echo $'ENV{ACCEL_MOUNT_MATRIX}="0, -1, 0; -1, 0, 0; 0, 0, 1"' | sudo tee \
    /etc/udev/rules.d/99-gole2pro-accel.rules

#Rotate touch input by 180 degrees, r
echo $'ENV{LIBINPUT_CALIBRATION_MATRIX}="-1 0 1 0 -1 1"' | sudo tee \
    /etc/udev/rules.d/99-gole2pro-touch.rules
sudo reboot
