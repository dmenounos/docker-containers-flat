#!/bin/bash

IMAGE="dmen/java:08"
CONTAINER="test-java"

case $1 in
init)
	docker container run -d -it \
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
