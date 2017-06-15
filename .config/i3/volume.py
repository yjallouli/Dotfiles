#!/usr/bin/env python3
# coding: utf-8

from sys import argv
import alsaaudio

operation = argv[1]
m = alsaaudio.Mixer()
oldVolume = m.getvolume()[0]
alsaaudio
if operation == '+' :
    newVolume = oldVolume + 10
    if newVolume > 100 : newVolume = 100
elif operation == '-':
    newVolume = oldVolume - 10
    if newVolume < 0 : newVolume = 0
elif operation == 'mute':
    newVolume=0

m.setvolume(newVolume)
print(newVolume)

