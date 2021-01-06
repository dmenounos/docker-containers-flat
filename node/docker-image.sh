#!/bin/bash

IMAGE="dmen/node:14"

case $1 in
create)
	docker image build -t $IMAGE .
	;;
remove)
	docker image rm $IMAGE
	;;
*)
	echo >&2
	echo "Usage: $0 { create | remove }" >&2
	echo >&2
	exit 1
	;;
esac
