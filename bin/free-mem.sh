#!/bin/bash


free -b | grep '^Mem:' | awk '{printf "%.1f", ($3/$2)*100}'
