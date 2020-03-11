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
