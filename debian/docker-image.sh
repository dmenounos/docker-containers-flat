#!/bin/bash

IMAGE="debian:buster"

case $1 in
remove)
	docker image rm $IMAGE
	;;
*)
	echo >&2
	echo "Usage: $0 { remove }" >&2
	echo >&2
	exit 1
	;;
esac
