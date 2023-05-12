#!/usr/bin/env bash

sudo systemctl stop lanbo
sudo systemctl disable lanbo
sudo rm -rf /var/lib/lanbo
sudo rm -rf /usr/local/bin/lanbo
sudo rm -rf /usr/local/etc/lanbo
sudo rm -rf /etc/systemd/system/lanbo.service
sudo systemctl daemon-reload
