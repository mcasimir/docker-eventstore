#!/usr/bin/env bash

set -e

docker build -t mcasimir/eventstore:latest -t mcasimir/eventstore:3.8.1 .
docker push mcasimir/eventstore:latest
docker push mcasimir/eventstore:3.8.1
