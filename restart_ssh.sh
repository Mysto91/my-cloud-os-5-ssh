#!/bin/sh

kill -HUP `cat /var/run/sshd.pid`
