#!/bin/bash
#
# sudo apt install espeak upower
# chmod +x battery_warning.sh
# */1 * * * * /path/to/battery_warning.sh

# Set the battery thresholds (in percentage)
LOW_THRESHOLD=15
HIGH_THRESHOLD=95

# Get the battery level and status
BATTERY_INFO=$(upower -i $(upower -e | grep 'BAT'))
BATTERY_LEVEL=$(echo "$BATTERY_INFO" | grep -E "percentage" | awk '{print $2}' | tr -d '%')
BATTERY_STATUS=$(echo "$BATTERY_INFO" | grep -E "state" | awk '{print $2}')

# Check if the battery is discharging and below the low threshold
if [[ "$BATTERY_STATUS" == "discharging" && "$BATTERY_LEVEL" -le "$LOW_THRESHOLD" ]]; then
    espeak "Warning! Battery level is critical at $BATTERY_LEVEL percent. Please connect the charger immediately."

# Check if the battery is charging and above the high threshold
elif [[ "$BATTERY_STATUS" == "charging" && "$BATTERY_LEVEL" -ge "$HIGH_THRESHOLD" ]]; then
    espeak "Warning! Battery level is at $BATTERY_LEVEL percent. Please disconnect the charger to preserve battery health."
fi
