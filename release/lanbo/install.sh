#!/usr/bin/env bash

set -e -o pipefail

if [ -d /usr/local/go ]; then
  export PATH="$PATH:/usr/local/go/bin"
fi

DIR=$(dirname "$0")
PROJECT=$DIR/../..

cd $DIR
./prebuild.sh

pushd $PROJECT
#go install -v -trimpath -ldflags "-s -w -buildid=" -tags with_quic,with_wireguard,with_acme ./cmd/lanbo
go install -v -trimpath -ldflags "-s -w -buildid=" ./cmd/lanbo
popd

sudo cp $(go env GOPATH)/bin/lanbo /usr/local/bin/
sudo mkdir -p /usr/local/etc/lanbo
sudo cp $DIR/config.json /usr/local/etc/lanbo/config.json
sudo cp $DIR/lanbo.service /etc/systemd/system
sudo systemctl daemon-reload
