#!/usr/bin/env bash

# USEFUL LINKS AND LECTURE

# https://grahamc.com/blog/nixos-on-zfs

# https://grahamc.com/blog/erase-your-darlings

# https://elis.nu/blog/2020/05/nixos-tmpfs-as-root/

# https://elis.nu/blog/2020/06/nixos-tmpfs-as-home/

# https://www.reddit.com/r/NixOS/comments/g9wks6/root_on_tmpfs/

# https://elis.nu/blog/2019/08/encrypted-zfs-mirror-with-mirrored-boot-on-nixos/

# https://www.reddit.com/r/NixOS/comments/o1er2p/tmpfs_as_root_but_without_hardcoding_your/

# https://linuxhint.com/configuring-zfs-cache/

# https://jrs-s.net/2018/08/17/zfs-tuning-cheat-sheet

# https://www.reddit.com/r/zfs/comments/nsc235/what_are_all_the_properties_that_cant_be_modified/

# https://www.reddit.com/r/NixOS/comments/q19bu1/multiboot_archlinux_nixos_grub_zfs_encrypted_setup/

set -e # exit immediately if a command return non-zero status
usage() {
  echo "This script generate a full working Nixos installation with encrypted ZFS partition as root"


  echo "Options"
  echo "  -h, --help    prints this message and exits"
  echo "  -s, --start   start the installation"
  echo "   *            print this menu"
  exit 1
}

print_ok() {
    printf "\e[32m%b\e[0m" "$1"
    printf "\n"
}

print_info() {
    printf "\e[36m%b\e[0m" "$1"
    printf "\n"
}

print_error() {
    printf "\e[31m%b\e[0m" "$1"
    printf "\n"
}

installation(){

  if [[ $EUID -ne 0 ]]; then
    print_error "This scripts needs to be runned as root!"
    exit 1
  fi

  read -p "nvme or sda/vda: " -r
  drive=$REPLY

  if [[ "$drive" =~ "nvme" ]]; then
    device="/dev/nvme0n1"
    bootDEVICE="${device}p1"
    swapDEVICE="${device}p2"
    luksDEVICE="${device}p3"
  else
    device="/dev/${drive}"
    bootDEVICE="${device}1"
    swapDEVICE="${device}2"
    luksDEVICE="${device}3"
  fi

  print_error "Wiping out all the data and signatures of the choosen disk (${device})..."

  wipefs --all -f "${device}"
  #sgdisk --zap-all "${device}"

  print_info "Done!"
  print_info "Starting partitioning of ${device} ..."

  # MEMO
  # -n <a>:<b>:<c>: New partition with number a, starting at sector b and ending at sector c.
  # Note that specifying a partition number of 0 always takes the first available number
  # -t (partition type code):
  #    EF00 -> boot efi
  #    8200 -> swap
  #    BF01 -> ZFS

  sgdisk -n 1:0:+512M -t 1:EF00 "${device}"
  sgdisk -n 2:0:+20G -t 2:8200 -c 2:swap "${device}"
  sgdisk -n 3:0:0 -t 3:BF01 -c 3:ZFS "${device}"

  print_info "Done!"
  print_ok "Starting cryptsetup..."


  cryptsetup luksFormat "$luksDEVICE"
  cryptsetup open --type luks "$luksDEVICE" nix-enc

  print_ok "Generating ZFS pool..."
  zpool create -O mountpoint=none -o ashift=12 -O atime=off -O acltype=posixacl -O xattr=sa -O compression=lz4 zroot /dev/mapper/nix-enc

  zfs create -o mountpoint=legacy zroot/root
  zfs create -o mountpoint=legacy zroot/root/nixos
  zfs create -o mountpoint=legacy zroot/home

  print_info "Done!"

  print_ok "Formatting boot & swap partitions..."
  mkfs.vfat -n boot "$bootDEVICE"
  mkswap "$swapDEVICE" -L SWAP

  print_info "Done!"

  print_ok "Mounting partitions"

  mount -t zfs zroot/root/nixos /mnt
  mkdir /mnt/{boot,home}
  mount -t zfs zroot/home /mnt/home

  mount "$bootDEVICE" /mnt/boot
  swapon "$swapDEVICE"

  print_info "Done!"

  nixos-generate-config --root /mnt

}


if [ $# -eq 0  ]
then
        usage
        exit
fi


case "$1" in
    "-h" | "--help") usage ;;
    "-s" | "--start") installation ;;
    *) echo "DEFAULT"
esac
