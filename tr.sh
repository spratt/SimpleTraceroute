#!/bin/bash
for i in {1..10}; do
    response=`ping -n -c 1 -t $i google.com | grep From --`
    response=${response:5}
    response=${response%% icmp_seq=1 Time to live exceeded}
    echo $i: $response
done