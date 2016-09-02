#!/bin/sh
### BEGIN INIT INFO
# Provides: 		APP
# Required-Start: 	$local_fs $network $mariadb
# Required-Stop:	$local_fs $network $mariadb
# Default-Start: 	2 3 4 5
# Default-Stop: 	0 1 6
# Description: 		Teamspeak 3 Server
### END INIT INFO
 

# INIT Script by www.SysADMINsLife.com
######################################

USER="TS_USER"
DIR="SERVER_ROOT"
 
###### Teamspeak 3 server start/stop script ######
 
case "$1" in
start)
su $USER -c "${DIR}/ts3server_startscript.sh start inifile=ts3server.ini"
;;
stop)
su $USER -c "${DIR}/ts3server_startscript.sh stop"
;;
restart)
su $USER -c "${DIR}/ts3server_startscript.sh restart inifile=ts3server.ini"
;;
status)
su $USER -c "${DIR}/ts3server_startscript.sh status"
;;
*)
echo "Usage: {start|stop|restart|status}" >&2
exit 1
;;
esac
exit 0