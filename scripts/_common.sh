#
# Common Variables
#

APPNAME="ts3server"

# Teamspeak 3 Server version
# TODO: Add mariadb version
TS3S_VERSION="3.0.13.3"

# TODO: Add dependencies here
# libmariadb

# Remote URL to fetch teamspeak tar.bz2 archive
SOURCE_URL=http://dl.4players.de/ts/releases/${TS3S_VERSION}/teamspeak3-server_linux_ARCH-${TS3S_VERSION}.tar.bz2

# TeamSpeak 3 Server tar.bz2 checksums
# TODO: get url for checksums
declare -A SOURCE_SHA256=( [x86]="97a410a68f6567de0ae31aa7c36246f4fd19f9d5b32729e5c66d3ac92f70e2cf" \
						   [amd64]="e9f48c8a9bad75165e3a7c9d9f6b18639fd8aba63adaaa40aebd8114166273ae" )


#
# Common Helpers
#

# Download and extract Teamspeak 3 server source
# usage: extract_ts3server ARCH DESTDIR [USER]
extract_ts3server() {
	local ARCH=$1
	local DESTDIR=$2
	local USER=${3:-admin} # make sure parent script has admin var
	
	# Retrieve tar.bz2
	ts3server_src="/tmp/ts3server.tar.bz2"
	rm -f "$ts3server_src"
	
	# Download source and verify checksum
	wget -q -O "$ts3server_src" "$(sed -e "s/ARCH/${ARCH}/g" <<< $SOURCE_URL)" \
	   || ynh_die "Unable to download teamspeak 3 server source."
	echo "${SOURCE_SHA256[${ARCH}]} $ts3server_src" | sha256sum -c >/dev/null \
	   || ynh_die "Invalid checksum of Teamspeak 3 server source."
	
	# Extract source to specified directory
	exec_as "$USER" tar -xjf "$ts3server_src" -C "$DESTDIR" --strip-components 1 \
		|| ynh_die "Unable to extract Teamspeak 3 server source."
	rm -f "$ts3server_src"
}

# Execute a command as another user (sourced from owncloud_ynh)
# usage: exec_as USER COMMAND [ARG ...]
exec_as() {
  local USER=$1
  shift 1

  if [[ $USER = $(whoami) ]]; then
    eval "$@"
  else
    # use sudo twice to be root and be allowed to use another user
    sudo sudo -u "$USER" "$@"
  fi
}