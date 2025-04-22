#!/usr/bin/env python
# SPDX-License-Identifier: CC0-1.0
# Copyright © 2021 mpan; <https://mpan.pl/>; CC0 1.0 (THIS SCRIPT!)
# Context: <https://bbs.archlinux.org/viewtopic.php?id=269453>
import dbus
from xml.dom.minidom import parseString
import json

bus = dbus.SystemBus()
upower = bus.get_object('org.freedesktop.UPower', '/org/freedesktop/UPower')

devPaths = dbus.Interface(upower, 'org.freedesktop.UPower').EnumerateDevices()
result = {}
for devPath in devPaths:
    dev = bus.get_object('org.freedesktop.UPower', devPath)
    devProps = dbus.Interface(dev, 'org.freedesktop.DBus.Properties') \
          .GetAll('org.freedesktop.UPower.Device')
    if 2 == devProps['Type']:
        result[devProps['NativePath']] = {
            'percentage': devProps['Percentage'],
            'rate': devProps['EnergyRate'],
            'hoursLeft': devProps['TimeToEmpty'] / 3600
        }

print(json.dumps(result))
