#!/bin/bash

MHZ=$(lscpu | grep "^CPU MHz:" | awk '{print $3}' | sed 's/\..*$//')
echo "$MHZ MHz"
