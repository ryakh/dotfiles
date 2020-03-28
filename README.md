# .files
Something something dotfiles. You know, for VIM and stuff.

# Installing
First good step is to grant your user superpowers:

```
sudo visudo

Add following line and restart login session:
<USER_NAME> ALL=(ALL) NOPASSWD: ALL
```

Navigate to `./make` and run `./build.sh`. This will produce a build files.
To jump start a build run:

```
sudo chmod +x <OS_NAME>
./<OS_NAME>
```

Observer your computer turning awesome.

## Installing Manjaro
Install build tools:
```
sudo pacman -S base-devel
```

Install Dropbox:
```
# Clone AUR package
git clone https://aur.archlinux.org/dropbox.git

# Import GPG key
wget https://linux.dropbox.com/fedora/rpm-public-key.asc
gpg --import rpm-public-key.asc

# Build dropbox AUR
makepkg -sirc
```

Proceed with regular make routine.

## Grub Config

`/etc/default/grub`:

```
GRUB_SAVEDEFAULT=true
GRUB_DEFAULT=saved
GRUB_TIMEOUT_STYLE=hidden
GRUB_TIMEOUT=0
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash snd_hda_intel.dmic_detect=0"
GRUB_CMDLINE_LINUX=""
```
