## Piholeblink

Bash script for blinking a led for each ad blocked by PiHole. Requires a Raspberry PI running [PiHole](https://github.com/dstinebaugh/pihole-led/ PiHole). Repo also contains a script for making piholeblink run as a daemon, an a logrotate script. Default pin is physical pin 12(GPIO pin 18).

Inspired by on a script by twotonefox found here:
  https://discourse.pi-hole.net/t/add-gpio-pins-for-led-on-blocked-ad-alerts/53/5

in turn based on this repo by dstinebaugh:
  https://github.com/dstinebaugh/pihole-led

## Install and setup

As root:

### Get piholeblink

Clone repo into /opt/piholeblink: 

```bash
git clone $gitrepo /opt/piholeblink
```

or download the files and put them in /opt/piholeblink.

## Daemon mode: Start on boot

See this repo for adding piholeblink as a service:
  https://github.com/jasonblewis/sample-service-script
