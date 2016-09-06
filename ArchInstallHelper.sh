pacstrap /mnt base base-devel sudo reflector bash-completion zsh-completions zsh
reflector --verbose -l 5 --sort rate --save /etc/pacman.d/mirrorlist --country US
cp /etc/pacman.d/mirrorlist /mnt/etc/pacman.d/mirrorlist
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
passwd
useradd -m -g users -G wheel,storage,power -s /bin/bash impulse
passwd impulse
EDITOR=nano visudo
mkinitcpio -p linux
pacman -S grub
grub-install /dev/sdX
grub-mkconfig -o /boot/grub/grub.cfg
exit
umount -R /mnt
ehcho "Reboot the system now."