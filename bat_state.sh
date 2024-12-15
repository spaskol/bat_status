#!/bin/bash
# Show log on end
#trap 'echo "stopped"'
#SIGTSTP
# Log file path
LOG_FILE="$HOME/power_events.log"
# Function to log messages
log_event() { echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE";}
# Get initial state
PREVIOUS_STATE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "state:" | awk '{print $2}')
# Log initial state
log_event "Script started. Initial state: $PREVIOUS_STATE"
# Monitor for changes
while true; do
# Get current state
CURRENT_STATE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "state:" | awk '{print $2}')
# Check if state has changed
if [[ "$CURRENT_STATE" != "$PREVIOUS_STATE" ]]
then
if { [ "$CURRENT_STATE" == "fully-charged" ] || [ "$CURRENT_STATE" == "charging" ]; } && [ "$PREVIOUS_STATE" == "discharging" ]
then
log_event "Switched to AC Power"
PREVIOUS_STATE="$CURRENT_STATE"
elif [ "$CURRENT_STATE" == "discharging" ] && { [ "$PREVIOUS_STATE" == "fully-charged" ] || [ "$PREVIOUS_STATE" == "charging" ]; }
then
log_event "Switched to Battery Power"
PREVIOUS_STATE="$CURRENT_STATE"
fi
else
# Update previous state
PREVIOUS_STATE="$CURRENT_STATE"
fi
sleep 10
done
log_event "Script stopped."
