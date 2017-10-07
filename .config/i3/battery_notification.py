import subprocess
import os
from time import sleep

processesList = str(subprocess.check_output("ps aux | grep battery_notification", shell=True))

if processesList.count('battery_notification.py')<=1 :  # Launch only if the process is not already running
	while True :
	    battery_information = subprocess.check_output("acpi -b", shell=True)
	    battery_status = str(battery_information).split(", ")[0].split(": ")[1]
	    battery_percentage = int(str(battery_information).split(", ")[1].strip('%'))

	    if battery_percentage <= 10 and battery_status == 'Discharging':
	        os.system('notify-send --icon=gtk-info "L O W   B A T T E R Y" "      Plug your cable" -t 10000')
	    
	    sleep(10)

else : 	print('Process already running')
