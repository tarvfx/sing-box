#!/usr/bin/env bash

set -e -o pipefail

sudo systemctl enable lanbo
sudo systemctl start lanbo
sudo journalctl -u lanbo --output cat -f
