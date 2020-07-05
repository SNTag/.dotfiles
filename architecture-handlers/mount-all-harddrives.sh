### for mounting all harddrives to ~/MyDiskX
## THIS IS NOT AN AUTOMATIC SCRIPT!!! MANUAL INTERVENTION IN THE CODE REQUIRED
## will mount each partition under a drive to ~/MyDiskX
## replace sdX* in the first line of code below with the drive number of interested.
## For example, I want to mount all partitions under sda. replace sdX* with sda*
## 
## Script will modify both /etf/fstab and /etc/environment, and will create links
## using the UUID (stable connections). 

# improvements to make:
# - detect if drive already added in /etc/enviroment and /etc/fstab

drivenum=sdb
username=sntag
finalpath=MyDisk

i=1
sudo blkid -s UUID -o value /dev/$drivenum* > ~/UUID-list.txt
sudo blkid -s TYPE -o value /dev/$drivenum* > ~/TYPE-list.txt

eval $(awk '{print "uuid"NR"="$1}' ~/UUID-list.txt)
eval $(awk '{print "type"NR"="$1}' ~/TYPE-list.txt)

while IFS= read -r line
do
    tmpuuid=uuid$i
    tmptype=type$i
    devdrivepath="UUID=${!tmpuuid}"
    finaldrivepath="/home/${username}/${finalpath}${i}/"
    sudo echo "$devdrivepath    $finaldrivepath    ${!tmptype}    defaults    0    0" >> /etc/fstab
    sudo echo "MYDISK$i='$finaldrivepath'">> /etc/environment

    i=$((i+1))
done < ~/UUID-list.txt

rm ~/UUID-list.txt ~/TYPE-list.txt
