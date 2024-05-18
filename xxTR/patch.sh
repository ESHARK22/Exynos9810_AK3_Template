#!/sbin/sh
patch_date=$home/xxTR/patch_date
chmod +x $patch_date

umount /system_root;
umount /system;
mount /system_root;
mount /system;
mount -o remount,rw /system_root;
mount -o remount,rw /system;

if [ -f "/system_root/system/build.prop" ]; then
date="$(file_getprop /system_root/system/build.prop ro.build.version.security_patch | cut -c1-7)"
elif [ -f "/system/build.prop" ]; then
date="$(file_getprop /system/build.prop ro.build.version.security_patch | cut -c1-7)"
fi
if [[ ! -z $date ]]; then
ui_print " "
ui_print "Patching image date to: $date"
$patch_date $date $block
fi
