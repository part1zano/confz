status() {
	battd=$(sysctl hw.acpi.battery.state | awk '{print $2}')
	battp=$(sysctl hw.acpi.battery.life | awk '{print $2}')
	if [ "$battd" -eq "2" ] ; then
		battstate='c' # charging
	elif [ "$battd" -eq "1" ] ; then
		battstate='d' # discharging
	elif [ "$battd" -eq "0" ] ; then
		battstate='n' # not charging
	else
		battstate='u' # unknown
	fi

	temp=$(sysctl hw.acpi.thermal.tz0.temperature | awk '{print $2}')
	
	kbd=$(xset -q | awk '/LED/ { print $10 }')
	if [ $kbd -lt 9 ] ; then
		keyboard='EN' 
	else # XXX :: see the actual value
		keyboard='RU'
	fi

	echo -n $keyboard' | '
	echo -n 'tz0: '$temp' | '
	echo -n 'Batt:' $battp'%; '$battstate' | '
	echo -n $keyboard' | tz0:' $temp '| batt:' $battp'%; '$battstate '| LA:' $(uptime | sed 's/.*://; ') '|' $(date +"%a %F %T %Z")
}

while [ /bin/true ] ; do
	status
	echo
	sleep 5
done
