#!/bin/bash -ex

chown -R gerrit: /var/gerrit/.ssh
chmod 600 /var/gerrit/.ssh/id_rsa

wait-for-it.sh mysqla:3306 -- echo "Mysql is up"
sudo -u gerrit rm -Rf /var/gerrit/git/*
sudo -u gerrit java -jar /var/gerrit/bin/gerrit.war init -d /var/gerrit --batch --install-all-plugins

/etc/init.d/gerrit start &
touch /var/gerrit/logs/error_log /var/gerrit/logs/http_log && chown -R gerrit: /var/gerrit && tail -f /var/gerrit/logs/*

