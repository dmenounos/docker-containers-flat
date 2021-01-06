#!/bin/bash

IMAGE="dmen/wildfly:10.1"
CONTAINER="test-wildfly"

# Parameters for the initialization of the container
WILDFLY_USERNAME="wildfly"
WILDFLY_PASSWORD="wildfly"

case $1 in
init)
	docker container run -d -it \
	--env WILDFLY_USERNAME="$WILDFLY_USERNAME" \
	--env WILDFLY_PASSWORD="$WILDFLY_PASSWORD" \
	--name $CONTAINER \
	$IMAGE
	;;
start)
	docker container start $CONTAINER
	;;
stop)
	docker container stop $CONTAINER
	;;
rm)
	docker container rm $CONTAINER
	;;
logs)
	docker container logs $CONTAINER
	;;
exec)
	if ([ "$#" -eq "1" ]); then
		echo
		echo "Run a command as root:"
		echo "$0 exec bash -l"
		echo
		echo "Log as user:"
		echo "$0 exec su -l wildfly -s /bin/bash"
		echo
		exit 1
	fi

	shift
	docker container exec -it $CONTAINER "$@"
	;;
ip)
	docker container inspect $CONTAINER | grep IPAddress | grep -v null | head -1 | cut -d '"' -f 4
	;;
*)
	echo >&2
	echo "Usage: $0 { init | start | stop | rm | logs | exec | ip }" >&2
	echo >&2
	exit 1
	;;
esac
