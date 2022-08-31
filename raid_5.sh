#!/bin/bash

mdadm --create --verbose /dev/md0 --level=5 --raid-devices=3 /dev/sd[cde]1
mkfs.ext4 /dev/md0 
mount /dev/md0 /mnt/raid 

mdadm --detail /dev/md0
cat /proc/mdstat  
