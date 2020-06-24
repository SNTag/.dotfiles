### for mounting all harddrives to ~/MyDiskX
## THIS IS NOT AN AUTOMATIC SCRIPT!!! MANUAL INTERVENTION IN THE CODE REQUIRED
## This will mount each partition under a drive to ~/MyDiskX
## Replace the 'drivenum' value (first line of code below) with the drive number of interested.
## For example, I want to mount all partitions under sda. replace sdX* with sda*

# improvements to make:
# - detect if drive already added in /etc/enviroment and /etc/fstab
# - detect partition file type for $filetype
# - add to fstab by UUID for each partition.

drivenum=sdb
username=sntag
finalpath=MyDisk

sudo blkid -s UUID -o value /dev/$drivenum* >> ~/UUID-list.txt # used only to count the number of drives to add
i=1

while IFS= read -r line
do
    devdrivepath="/dev/$drivenum$i"
    finaldrivepath="/home/$username/$finalpath$i/"
    filetype="ext4"
    echo "$devdrivepath    $finaldrivepath    $filetype    defaults    0    0" | sudo tee -a /etc/fstab
    echo "MYDISK$i='$finaldrivepath'" | sudo tee -a /etc/environment

    i=$((i+1))
done < ~/UUID-list.txt

rm ~/UUID-list.txt
