#!/usr/bin/env sh
set -e
set -x

borg init --progress --storage-quota 100G --encryption=repokey ./borg || true
borg create --progress --compression lzma ./borg::'dane-{now:%Y%m%d%H%M%S}' /Dane/finanse/ /Dane/hobby /Dane/notatki /Dane/pamiątki /Dane/praca /Dane/studia /Dane/zdjęcia/ /Dane/zdjęcia/ /Dane/gwarancje/ /Dane/mieszkania/ /Dane/pamiątki
borg create --progress --compression lzma ./borg::'mail-{now:%Y%m%d%H%M%S}' "$HOME/.thunderbird/5fkf29or.default"
