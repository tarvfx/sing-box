#!/usr/bin/env bash

set -e -o pipefail

rm -rf $PROJECT/cmd/lanbo
cp -r $PROJECT/cmd/sing-box $PROJECT/cmd/lanbo