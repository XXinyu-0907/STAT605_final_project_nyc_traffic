#!/bin/bash

cat linkid4329472.csv |
tail -n +2 |
cut -d, -f 2 |
{   sum=0;
    exceed=0;
    while read n; do
	if [[ $(echo "$n >= 25.00" | bc -l) -eq 1 ]] ;then 
	    exceed=$(( $exceed+1 ))
	fi 
	sum=$(( $sum+1 )) ;
    done ; 
    echo exceed_rate=$(echo "scale=4;$exceed/$sum"| bc); }
