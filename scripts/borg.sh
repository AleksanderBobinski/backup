#!/usr/bin/env bash
set -e

echo "Password:"
read -s -r BORG_PASSPHRASE
export BORG_PASSPHRASE=$BORG_PASSPHRASE

set -x
borg init --progress --storage-quota 100G --encryption=repokey ./borg || true
borg create --progress --compression lzma ./borg::'dane-{now:%Y%m%d%H%M%S}' "$HOME/ws/dane"
borg create --progress --compression lzma ./borg::'mail-{now:%Y%m%d%H%M%S}' "$HOME/.thunderbird/5fkf29or.default"
