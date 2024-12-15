#!/usr/bin/env sh
set -x
set -e

podman build --tag testme .
podman run --rm --name testme --replace --interactive --tty --volume "$(pwd)":"/tmp/backup/":ro testme <<EOF
cd "/tmp/backup/aconfmgr" &&  aconfmgr --aur-helper yay --config ./ apply --yes --verbose
EOF
