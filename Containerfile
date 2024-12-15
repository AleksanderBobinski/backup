FROM docker.io/library/archlinux:latest

RUN pacman-key --init
RUN pacman -Syyu --noconfirm --needed git base-devel sudo
RUN echo 'testme ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers
RUN useradd -m testme
USER testme
ENV USER testme
RUN git clone https://aur.archlinux.org/yay.git "/tmp/yay" && cd "/tmp/yay" && makepkg -si --noconfirm --needed
RUN yay -S --noconfirm aconfmgr-git
