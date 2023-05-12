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

sudo systemctl stop lanbo
sudo cp $(go env GOPATH)/bin/lanbo /usr/local/bin/
sudo systemctl start lanbo
