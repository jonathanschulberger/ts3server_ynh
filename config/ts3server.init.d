#! /bin/sh
### BEGIN INIT INFO
# Provides:          ts3server
# Required-Start:    $network mysql
# Required-Stop:     $network
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: TeamSpeak3 Server Daemon
# Description:       Starts/Stops/Restarts the TeamSpeak Server Daemon
### END INIT INFO

set -e

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
DESC="TeamSpeak3 Server"
NAME=teamspeak3-server
USER=teamspeak3-user
DIR=/opt/teamspeak3-server
OPTIONS=inifile=ts3server.ini
DAEMON=$DIR/ts3server_startscript.sh
#PIDFILE=/var/run/$NAME.pid
SCRIPTNAME=/etc/init.d/$NAME

# Gracefully exit if the package has been removed.
test -x $DAEMON || exit 0

sleep 2
sudo -u $USER $DAEMON $1 $OPTIONS