## Disable Nouveau Driver
--- 
1. Add `rd.driver.blacklist=nouveau modprobe.blacklist=nouveau` to the GRUB_CMDLINE_LINUX entry in `/etc/default/grub`
2. Export grub config: `grub2-mkconfig -o /boot/grub2/grub.cfg`

3. Reboot and verify that the new grub config was used

4.  Verify that the nouveau drivers were not loaded (this should find no matches):
  `lsmod | egrep -i 'nouveau|nvidia'`
