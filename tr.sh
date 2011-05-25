#!/bin/bash
for ((i=1; i <= $2; i++)); do
    response=`ping -n -c 1 -t $i $1 | grep From --`
    response=${response:5}
    response=${response%% icmp_seq=1 Time to live exceeded}
    echo $i: $response
done