#!/bin/bash

sgdisk --backup=table /dev/sdc
for i in c d e f
do 
   echo $i    
   sgdisk --load-backup=table /dev/sd${i}
   mkfs.ext4 /dev/sd${i}1
   mkdir /mnt/hdd_${i}
   mount /dev/sd${i}1 /mnt/hdd_${i}/
done
