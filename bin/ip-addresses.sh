#!/bin/bash

ip addr | grep dynamic | awk '{print " " $8 ": " $2}' | sed 's/\/.*//' | sed 'h;s/.*//;N;G;s/\n//g' | sed 's/^.//'
