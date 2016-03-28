# TeamSpeak3 server
TeamSpeak3 server app for [YunoHost](http://yunohost.org/).
Works with x64 Debian 3.16.7 
<p>(moulinette: 2.2.1.1
moulinette-yunohost: 2.2.4
yunohost-admin: 2.2.1)</p>

## Installation
You can install this package by going through the administration web interface by choosing "Install custom app", or using the moulinette:
```bash
yunohost app install https://github.com/KnooL/ts3_ynh
```

## Features
- [x] Installer (x64/x86)
- [x] Uninstaller
- [x] MariaDB instead of SQLite
- [x] Integrated service (systemd and yunohost-admin)
- [x] Default ports set open via yunohost in firewall
- [ ] Give user choice to set ports
- [ ] Get and validate sourcefiles from source and validate md5/sha256
- [ ] Choose between MariaDB and SQLite (?)
- [ ] Post generated admin token into primary logfile

## Ports used
```bash
netstat -tulpn | grep ts3
```
Proto | Local Address         |    State  |     PID/Program name
--- | --- | --- | ---
tcp   | 0.0.0.0:10011             |       LISTEN    |  11306/ts3server 
tcp    |  0.0.0.0:30033            |      LISTEN    |  11306/ts3server 
udp     | 0.0.0.0:9987              | |   11306/ts3server 

# x86 systems untested?!
