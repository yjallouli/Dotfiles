import subprocess
import os
from time import sleep

while True :
    battery_information = subprocess.check_output("acpi -b", shell=True)
    battery_status = str(battery_information).split(", ")[0].split(": ")[1]
    battery_percentage = int(str(battery_information).split(", ")[1].strip('%'))

    if battery_percentage <= 10 and battery_status == 'Discharging':
        os.system('notify-send "L O W   B A T T E R Y" "      Plug your cable" -t 10000')

    sleep(10)
