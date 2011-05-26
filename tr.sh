#!/bin/bash
################################################################################
# Simple Traceroute
#
# For project information, see file: README
# For license information, see file: LICENSE
################################################################################
for ((i=1; i <= $2; i++)); do
    # Not sure, but I guess if ping doesn't go through
    # grep will ignore any error lines
    response=`ping -n -c 1 -t $i $1 | grep From --`
    
    # A successful response looks like:
    #  From a.b.c.d icmp_seq=1 Time to live exceeded
    
    # Strip the "From "
    response=${response:5}
    # Strip the " icmp_seq=1 Time to live exceeded"
    response=${response%% icmp_seq=1 Time to live exceeded}
    # print the hop number and address
    echo $i: $response
done