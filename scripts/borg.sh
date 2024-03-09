#!/usr/bin/env sh
set -e
set -x

borg init --progress --append-only --storage-quota 100G --encryption=repokey ./borg || true
borg create --progress --compression lzma ./borg::'dane-{now:%Y%m%d%H%M%S}' /Dane/finanse/ /Dane/hobby /Dane/notatki /Dane/pamiątki /Dane/praca /Dane/studia /Dane/zdjęcia/do_wydrukowania/
