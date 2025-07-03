
## Setup Steam-Library
``nix-shell -p parted``
```sh
sudo parted /dev/nvme0n1 -- mklabel gpt mkpart primary ext4 1MiB 100%
sudo mkfs.ext4 -L games /dev/nvme0n1
sudo udevadm settle
lsblk -f
sudo mkdir -p /games
sudo chmod -R ugo+wrx /games
sudo mount /dev/nvme0n1 /games
```

## Setup Backup-System
``nix-shell -p parted``
```sh
sudo parted /dev/sda -- mklabel gpt mkpart primary ext4 1MiB 100%
sudo mkfs.ext4 -L backup /dev/sda1
sudo udevadm settle
lsblk -f
sudo mkdir -p /mnt/backup
sudo mount /dev/sda1 /mnt/backup
```

```sh
lsblk -f

NAME        FSTYPE FSVER LABEL        UUID                                 FSAVAIL FSUSE% MOUNTPOINTS
sda                                                                                       
nvme1n1                                                                                   
├─nvme1n1p1 vfat   FAT32              17FA-126F                             998,4M     2% /boot
└─nvme1n1p2 ext4   1.0                9d358b30-5c96-4993-a4ef-d32e9bcbb1c1    1,4T    19% /nix/store
                                                                                          /
nvme0n1                                                                                   
├─nvme0n1p1 vfat   FAT32              29FA-5C75                                           
└─nvme0n1p2 ext4   1.0   kubuntu_2504 7a19eb5b-aa5f-4aa6-8968-8b87cc98493c     
```

```sh
sudo blkid

/dev/nvme0n1p1: UUID="29FA-5C75" BLOCK_SIZE="512" TYPE="vfat" PARTUUID="e5ce7456-1e42-400d-8d97-36318bce5cba"
/dev/nvme0n1p2: LABEL="kubuntu_2504" UUID="7a19eb5b-aa5f-4aa6-8968-8b87cc98493c" BLOCK_SIZE="4096" TYPE="ext4" PARTLABEL="kubuntu_2504" PARTUUID="5130eb37-8331-4cd0-a5f6-89c2567ff263"
/dev/nvme1n1p2: UUID="9d358b30-5c96-4993-a4ef-d32e9bcbb1c1" BLOCK_SIZE="4096" TYPE="ext4" PARTLABEL="root" PARTUUID="34e7843e-70e5-473d-a752-1725a44042c1"
/dev/nvme1n1p1: UUID="17FA-126F" BLOCK_SIZE="512" TYPE="vfat" PARTLABEL="EFI" PARTUUID="37eabead-201e-4cf9-b301-0ad68295f964"

```