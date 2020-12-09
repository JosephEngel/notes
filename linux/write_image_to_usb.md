# Write image to usb/sd card

1. Download the Image & insert the external device

2. Find out where the external device is mounted:
   
   1. `df -h`
   
   2. `dmesg` may contain helpful info as well

3. Write image to the device:
   
   1. `xzcat Fedora-Server-armfp-30-1.2-sda.raw.xz | sudo dd status=progress bs=4M of=/dev/mntlocation`
   
   2. 
