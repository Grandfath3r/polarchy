# Polarchy


# Installation

### Install base Arch
- Flash your Arch Linux ISO onto a USB Drive
    - Use either balenaEtcher or Rufus
- Boot into your BIOS/UEFI and disable Secure Boot if it is Enabled
- Boot from the USB Drive

### If you are on WIFI do:
    
```bash
iwctl
station wlan0 scan
station wlan0 connect [Network Name]
```

### Run archinstall
```bash
archinstall
```
#### Use these options:

|           **Section**          |           **Option**          |
|:------------------------------:|:-----------------------------:|
| Mirrors and repositories       | Select regions > Your country |
| Disk configuration             | Partitioning > Default partitioning layout > 
                                 |Select disk (with space + return) |
| Disk > File system             |                               |
| Disk > Disk encryption         |                               |
| Hostname                       |                               |
| Bootloader                     |                               |
| Authentication > Root password |                               |
| Authentication > User account  |                               |
| Applications > Audio           |                               |
| Network configuration          |                               |
| Timezone                       |                               |