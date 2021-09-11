#!/usr/bin/env bash

set -e # exit immediately if a command return non-zero status
usage() {
  echo "This script create 2 partition:"
  echo
  echo "
   DISK
   |
   ├── Boot (boot partition, fat32, 512MiB)
   |
   └── System (system partition, LUKS2 + LVM, rest of the disk)
"


  echo "Options"
  echo "  -h, --help    prints this message and exits"
  echo "  -s, --start   start the installation"
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

  read -p "nvme or sda/vda: " -r
  drive=$REPLY

  if [[ "$drive" =~ "nvme" ]]; then
    device="/dev/nvme0n1"
    bootDEVICE="${device}p1"
    luksDEVICE="${device}p2"
    addNixosHW=true
  else
    device="/dev/${drive}"
    bootDEVICE="${device}1"
    luksDEVICE="${device}2"
    addNixosHW=false
  fi


  print_error "Wiping out all the data and signatures of the choosen disk (${device})..."

  wipefs --all -f "${device}"

  print_info "Done!"
  print_info "Starting partitioning of ${device} ..."

  parted "${device}"  -- mklabel gpt
  parted "${device}"  -- mkpart ESP fat32 1MiB 513MiB
  parted "${device}"  -- set 1 esp on
  parted "${device}"  -- mkpart primary 513MiB 100%

  print_info "Done!"
  print_ok "Starting cryptsetup..."

  cryptsetup luksFormat "$luksDEVICE"
  cryptsetup open "$luksDEVICE" nix-enc

  print_ok "Starting creation of LVM volumes (swap + root)..."
  pvcreate /dev/mapper/nix-enc

  vgcreate vg /dev/mapper/nix-enc
  lvcreate -L 20G -n swap vg
  lvcreate -l '100%FREE' -n root vg


  print_ok "Formatting partitions created..."

  mkfs.vfat -n boot "$bootDEVICE"
  mkfs.ext4 -L root /dev/vg/root
  mkswap /dev/vg/swap -L SWAP

  print_ok "Mounting partitions..."

  mount /dev/vg/root /mnt
  mkdir -p /mnt/boot
  mount "$bootDEVICE" /mnt/boot
  swapon /dev/vg/swap

  if "$addNixosHW"; then
    print_ok "Adding special channel for PC configuration"
    nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware

    nix-channel --update
    fi


  print_ok "Generating the configuration..."
  nixos-generate-config --root /mnt

  OPTIONS="options = [ \"noatime\"   \"nodiratime\"  \"discard\" ]; "

  echo "$OPTIONS" >> /mnt/etc/nixos/hardware-configuration.nix



}
for arg in "$@"; do
  shift
  case "$arg" in
    "-h" | "--help") usage ;;
    "-s" | "--start") installation ;;
  esac
done
