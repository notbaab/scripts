#!/bin/bash

if [ "$#" -ne 1 ] 
then
	echo 'Pass in the name to locate'
	exit 1
fi

locate "${1}" | grep "${1}$" 
