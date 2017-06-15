#!/bin/bash
kill -9 $(pgrep xflux)  # Killing all old processes
xflux -l 48.8         	# Launching xflux with Paris coordinates
