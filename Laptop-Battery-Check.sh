#!/bin/bash

maxcapacity=$(ioreg -rn AppleSmartBattery | grep '"MaxCapacity" =' | grep -v 'AppleRawMaxCapacity' | awk '{print $3}')
designcapacity=$(ioreg -rn AppleSmartBattery | grep '"DesignCapacity" =' | awk '{print $3}')
applerawmax=$(ioreg -rn AppleSmartBattery | grep '"AppleRawMaxCapacity" =' | awk '{print $3}')
cyclecount=$(ioreg -rn AppleSmartBattery | grep '"CycleCount" =' | awk '{print $3}')

## Calculate Temperature

temp_raw=$(ioreg -rn AppleSmartBattery | grep '"Temperature" =' | awk '{print $3}')
if [[ -n "$temp_raw" ]]; then
  # Convert 0.1K to Celsius: (temp_raw / 10) - 273.15
  temp_celsius=$(echo "scale=1; ($temp_raw / 10) - 273.15" | bc)
else
  temp_celsius="Unknown"
fi

## Calculate Charging

amperage=$(ioreg -rn AppleSmartBattery | grep '"Amperage" =' | awk '{print $3}')
voltage=$(ioreg -rn AppleSmartBattery | grep '"Voltage" =' | awk '{print $3}')

if [[ -n "$amperage" && -n "$voltage" ]]; then
  # Amperage might be negative when discharging, so take absolute value
  amperage=${amperage#-}
  power_mw=$(( amperage * voltage ))
else
  power_mw="Unknown"
fi

## Calculate Battery Health
health=$(echo "scale=2; $applerawmax / $designcapacity * 100" | bc)

## Print Results
echo "Battery Charge: $maxcapacity %"
echo "Design Capacity: $designcapacity mAh"
echo "AppleRawMaxCapacity: $applerawmax mAh"
echo "Battery Health: $health%"
echo "Load Cycles: $cyclecount"
echo "Battery Temperature: $temp_celsius °C"

# Send notification to the end user
# Kandji Self Service item
sudo /usr/local/bin/kandji display-alert --title "Battery Health" --message "
Battery Charge: $maxcapacity %
Design Capacity: $designcapacity mAh
Full Charge Capacity: $applerawmax mAh
Battery Health: $health %
Load Cycles: $cyclecount
Battery Temperature: $temp_celsius °C "