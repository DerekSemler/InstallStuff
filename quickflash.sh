genfstab -U -p /mnt >> /mnt/etc/fstab
arch-chroot /mnt
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8 > /etc/locale.conf"
export LANG=en_US.UTF-8
ln -s /usr/share/zoneinfo/America/Chicago > /etc/localtime
hwclock --systohc --utc
nano /etc/pacman.conf
pacman -Sy
echo Dragon_USB > /etc/hostname