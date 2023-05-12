#!/usr/bin/env bash

set -e -o pipefail

DIR=$(dirname "$0")
PROJECT=$DIR/../..

rm -rf $PROJECT/cmd/lanbo
cp $PROJECT/cmd/sing-box $PROJECT/cmd/lanbo