### Finish Setup

# begin kernel changes
device_name=$(file_getprop /default.prop ro.product.device);
ROM_NAME="Kernel"
DTB_NAME="Dtb"
mv -f $home/$ROM_NAME/$device_name/zImage $home/Image;
mv -f $home/$DTB_NAME/$device_name/dtb.img $split_img/extra;
rm -rf $home/$ROM_NAME $home/$DTB_NAME
# end kernel changes