CopyFile /etc/default/grub
CopyFile /etc/mkinitcpio.conf
CopyFile /etc/mkinitcpio.d/linux-zen.preset
CopyFile /etc/mkinitcpio.d/linux.preset
CopyFile /etc/pam.d/sddm
CopyFile /etc/sddm.conf.d/kde_settings.conf
CreateFile /etc/sddm.conf > /dev/null
CopyFile /etc/shells
CopyFile /etc/mkinitcpio.d/linux.preset
