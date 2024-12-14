#!/usr/bin/env sh
set -x
set -e

podman build --no-cache --tag testme .
podman run --rm --name testme --replace --interactive --volume "$(pwd)":"/tmp/backup/":ro testme <<EOF
cd "/tmp/backup/aconfmgr" &&  aconfmgr --aur-helper yay --config ./ apply --yes --verbose
EOF
