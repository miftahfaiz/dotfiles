#!/bin/bash

# Define notify levels and other parameters
notify_levels=(3 5 10 20)  # Notification thresholds
BAT=$(ls /sys/class/power_supply | grep BAT | head -n 1)  # Detect battery
LOGFILE="$HOME/battery_notifications.log"  # Log file location
last_notify=100  # Track the last notification level

# Check if battery was detected
if [ -z "$BAT" ]; then
    echo "No battery found in /sys/class/power_supply. Exiting." >&2
    exit 1
fi

# Function to log and send notifications
send_notification() {
    local level="$1"
    local message="Low Battery: $level% battery remaining."
    notify-send -u critical "Low Battery" "$message"
    echo "$(date): $message" >> "$LOGFILE"
}

# Infinite loop to monitor battery level
while true; do
    # Read current battery level
    bat_lvl=$(cat /sys/class/power_supply/${BAT}/capacity)

    # Check if battery is charging
    charging_status=$(cat /sys/class/power_supply/${BAT}/status)
    if [ "$charging_status" == "Charging" ]; then
        sleep 60
        continue
    fi

    # Update last_notify if battery level increases
    if [ $bat_lvl -gt $last_notify ]; then
        last_notify=$bat_lvl
    fi

    # Check against notify levels
    for notify_level in "${notify_levels[@]}"; do
        if [ $bat_lvl -le $notify_level ] && [ $notify_level -lt $last_notify ]; then
            send_notification "$bat_lvl"
            last_notify=$bat_lvl
        fi
    done

    sleep 60
done
