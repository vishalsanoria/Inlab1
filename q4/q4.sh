#!/bin/bash

readarray -d ' ' -t array < q4_in.txt
readarray -td '' sorted < <(printf '%s\0' "${array[@]}" | sort -z) 

for i in "${sorted[@]}"
do
	sum=$((sum+i))
	count=$((count+1))
done

echo "scale=2; ($sum/$count)" | bc -l

if [[ $((count%2)) -eq 0 ]]; then
	mid=$((count/2))
	midval=${sorted[$count/2 -1]}
	midval2=${sorted[$count/2]}
	midval3=$((midval+midval2))
	echo "scale=2; ($midval3/2)" |bc -l
	
else
	echo ${sorted[$count/2]}
fi


