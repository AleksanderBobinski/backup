CopyFile /etc/pam.d/kde
CopyFile /etc/apparmor.d/usr.bin.firefox 600
CopyFile /etc/apparmor.d/usr.bin.teams 600
CopyFile /etc/audit/audit.rules 640
CopyFile /etc/audit/auditd.conf
CopyFile /etc/sudoers
SetFileProperty /usr/bin/groupmems group groups
SetFileProperty /usr/bin/groupmems mode 2750
