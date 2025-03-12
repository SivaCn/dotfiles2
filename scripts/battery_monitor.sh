#!/bin/bash

#
# chmod +x scripts/battery_monitor.sh
#
# crontab -e
# */5 * * * * ~/scripts/battery_monitor.sh
#

# Function to check battery status and alert
check_battery() {
    # Get battery percentage
    BATTERY_LEVEL=$(upower -i $(upower -e | grep 'BAT') | grep "percentage" | awk '{print $2}' | tr -d '%')

    # Get battery state (charging/discharging)
    BATTERY_STATE=$(upower -i $(upower -e | grep 'BAT') | grep "state" | awk '{print $2}')

    # Alert for low battery (below 10%)
    if [ "$BATTERY_LEVEL" -lt 10 ] && [ "$BATTERY_STATE" == "discharging" ]; then
        espeak "Battery low" -s 150
        notify-send "Low Battery Warning" "Battery is at ${BATTERY_LEVEL}%. Plug in the charger!" -u critical
    fi

    # Alert for full charge (above 90% and charging)
    if [ "$BATTERY_LEVEL" -gt 95 ] && [ "$BATTERY_STATE" == "charging" ]; then
        espeak "Battery full" -s 150
        notify-send "Battery Full Alert" "Battery is at ${BATTERY_LEVEL}%. Unplug the charger!" -u normal
    fi
}

# Run the function
check_battery

