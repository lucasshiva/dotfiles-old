:'
NOTE: This script does not work. I have tried it once, but to no avail. 
I am not sure why is that, though I think it could be related to the lack of 
use of arch-chroot, or I am simply doing something wrong. Anyway, do not use it.
'
# User and hostname.
username="lucas"
hostname="arch"

# Change font to a bigger one.
setfont ter-132n

# Synchronize the Network Time Protocol.
timedatectl set-ntp true

# Update keyring to prevent packages failing to install.
pacman -S --noconfirm archlinux-keyring pacman-contrib

# Ensure we have pacman-contrib installed.
pacman -S --noconfirm --needed pacman-contrib

# Alow parallel downloads.
sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf

# Setup mirrors
pacman -S --noconfirm --needed reflector rsync
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
reflector -c Brazil -a 48 -f 5 --sort rate --save /etc/pacman.d/mirrorlist

# Select and format disks. The disks should be partitioned in Windows, prior to this installation.
efi_partition="/dev/nvme0n1p1"
root_partition="/dev/nvme0n1p4"
home_partition="/dev/sda2"
windows_system="/dev/nvme0n1p3"
windows_storage="/dev/sda1"

# TODO: Change partition type before formatting if partition is marked as "free space". 
mkfs.ext4 -L ROOT $root_partition
mkfs.ext4 -L HOME $home_partition

# Mount partitions
mount $root_partition /mnt
mkdir /mnt/home
mkdir -p /mnt/boot/efi
mkdir -p /mnt/Windows10/{System,Storage}

mount $home_partition /mnt/home
mount $efi_partition /mnt/boot/efi
mount $windows_system /mnt/Windows10/System
mount $windows_storage /mnt/Windows10/Storage

# Base install
pacstrap /mnt base base-devel wget linux linux-headers linux-firmware vim --noconfirm --needed
cp /etc/pacman.d/mirrorlist /mnt/etc/pacman.d/mirrorlist

# Generate an `fstab` file by UUID.
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

# Swapfile
# TODO: Add swapfile section.

# Timezone
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc

# Make Linux use localtime to fix dual boot time problems.
timedatectl set-local-rtc 1 --adjust-system-clock

# Locale
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
sed -i 's/^#pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/' /etc/locale.gen

localectl --no-ask-password set-locale LANG="en_US.UTF-8" LC_ALL="pt_BR.UTF-8"

# Network Setup
pacman -S --noconfirm --needed networkmanager dhclient
systemctl enable --now NetworkManager

# Hostname
echo $hostname > /etc/hostname
echo -e "127.0.0.1\tlocalhost\n::1\t\tlocalhost\n127.0.1.1\t$hostname.localdomain\t$hostname" >> /etc/hosts

# Add sudo no password rights. This will be changed later.
sed -i 's/^# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers
sed -i 's/^# %wheel ALL=(ALL:ALL) NOPASSWD: ALL/%wheel ALL=(ALL:ALL) NOPASSWD: ALL/' /etc/sudoers

# Enable parallel downloads.
sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf

# Enable multilib
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
pacman -Syy --noconfirm --needed

# Setup microcode and graphic drivers.
pacman -S --noconfirm --needed amd-ucode xf86-video-amdgpu
proc_ucode=amd-ucode.img

# Bootloader
pacman -S --noconfirm --needed grub efibootmgr os-prober ntfs-3g dosfstools
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

# Create user and set passwords.
echo "Choose a password for the root user"
passwd

useradd -mG wheel $username
echo "Choose a password for the user $username"
passwd $username

# Display Server
pacman -S --noconfirm --needed xorg xdg-user-dirs xdg-utils

# Desktop environment and some applications.
pacman -S gnome gnome-tweaks firefox kitty
systemctl enable gdm.service

# Cleanup
# Remove no password sudo rights
sed -i 's/^%wheel ALL=(ALL) NOPASSWD: ALL/# %wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers
sed -i 's/^%wheel ALL=(ALL:ALL) NOPASSWD: ALL/# %wheel ALL=(ALL:ALL) NOPASSWD: ALL/' /etc/sudoers

# Add sudo rights
sed -i 's/^# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers
sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

echo "Finished installation! Type 'reboot' to reboot the system. Don't forget to run the other scripts!"
