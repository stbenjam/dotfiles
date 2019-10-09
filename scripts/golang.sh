#!/bin/bash

set -ex

sudo yum install -y go
go get -u github.com/golangci/golangci-lint/cmd/golangci-lint
