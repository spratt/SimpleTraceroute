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
    response=`ping -n -w 2 -c 1 -t $i $1 | grep From --`
    # arguments:
    #   -n:    numerical output only (don't resolve ips)
    #   -w 2:  wait a maximum of 2 seconds for the ping to return
    #   -c 1:  send one packet
    #   -t $i: TTL=$i
    #   $1:    some host to ping
    
    # A successful response looks like:
    #  From a.b.c.d icmp_seq=1 Time to live exceeded
    
    # Strip the "From "
    response=${response:5}
    # Strip the " icmp_seq=1 Time to live exceeded"
    response=${response%% icmp_seq=1 Time to live exceeded}
    # print the hop number and address
    echo $i: $response
done