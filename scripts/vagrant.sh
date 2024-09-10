#!/usr/bin/env sh
set -x
set -e

vagrant box update
vagrant up
vagrant ssh -c 'sudo pacman-key --refresh'
vagrant ssh -c 'sudo pacman -Syyu --noconfirm --needed git base-devel'
vagrant ssh -c 'rm -Rf ~/yay-bin'
vagrant ssh -c 'git clone https://aur.archlinux.org/yay-bin.git ~/yay-bin'
vagrant ssh -c 'cd ~/yay-bin && makepkg -si --noconfirm --needed'
vagrant ssh -c 'yay -S --noconfirm aconfmgr-git'
vagrant ssh -c 'rm -Rf ~/backup'
vagrant ssh -c 'git clone https://github.com/AleksanderBobinski/backup.git ~/backup'
vagrant ssh -c 'cd ~/backup/aconfmgr &&  aconfmgr --aur-helper yay --config ./ apply --yes --verbose'
