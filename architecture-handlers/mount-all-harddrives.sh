### for mounting all harddrives to ~/MyDiskX
## WORK IN PROGRESS!!! DO NOT USE, HAS NOT BEEN TESTED WELL
## THIS IS NOT AN AUTOMATIC SCRIPT!!! MANUAL INTERVENTION IN THE CODE REQUIRED
## will mount each partition under a drive to ~/MyDiskX
## replace sdX* in the first line of code below with the drive number of interested.
## For example, I want to mount all partitions under sda. replace sdX* with sda*

# improvements to make:
# - detect if drive already added in /etc/enviroment and /etc/fstab
# - make first partition i="" instead of i="0" or i="1"
# - detect partition file type for $filetype

drivenum=sda
username=sntag
finalpath=MyDisk

sudo blkid -s UUID -o value /dev/$drivenum* >> ~/UUID-list.txt # used only to count the number of drives to add
i=1

while IFS= read -r line
do
    devdrivepath="/dev/$drivenum$i"
    finaldrivepath="/home/$username/$finalpath$i/"
    filetype="ext4"
    sudo echo "$devdrivepath    $drivepath    $filetype    defaults    0    0" >> /etc/fstab
    sudo echo "MYDISK$i='$drivepath'">> /etc/enviroment

    i=$((i+1))
done < ~/UUID-list.txt

rm ~/UUID-list.txt
