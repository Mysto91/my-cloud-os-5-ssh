#!/bin/sh

cat ./ssh_keys/* > authorized_keys

if [ ! -d "/root/.ssh/" ]; 
	then
	mkdir /root/.ssh/
fi

chmod 700 /root/.ssh/

mv ./authorized_keys /root/.ssh/authorized_keys

chmod 600 /root/.ssh/authorized_keys

echo
echo "[INFO] Directory content /root/.ssh/:"
echo

ls -l /root/.ssh/

echo
echo "[INFO] File content authorized_keys:"
echo

cat /root/.ssh/authorized_keys

cp -f ./sshd_config /etc/ssh/sshd_config

echo 
echo "[INFO] File content sshd_config:" 
echo

cat /etc/ssh/sshd_config

echo
echo "[INFO] Restart service sshd..."
echo

./restart_ssh.sh

echo
echo "[SUCCESS] Done."
