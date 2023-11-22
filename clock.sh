#!/bin/bash

loop_count=30
#set the power limit

rm clkfreq.txt

# Start the loop
while [ $loop_count -ge 0 ]
#while [ $power_limit -ge 0 ]
do



	# this will grep the core frequencof the first 'n' cores, and do an average it. 
	clkfreq_allcore=$(grep "^[c]pu MHz" /proc/cpuinfo)

	echo "wait for 10s"
	sleep 10

	# Use awk to parse the frequencies and calculate their average
	average_clkfreq=$(echo "$clkfreq_allcore" | awk -F: '{ total += $2; count++ } END { print total/count }')		

	echo "average clock frequency of all cores = $average_clkfreq"  >> clkfreq.txt
	loop_count=$((loop_count - 1))

done

