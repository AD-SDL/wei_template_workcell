#!/bin/bash

# This script allows you to register Diaspora before running the example app.
docker run -it --rm \
    -v ~/.globus_compute:/root/.globus_compute -v ~/.diaspora:/root/.diaspora ghcr.io/ad-sdl/wei \
    python -c "from diaspora_event_sdk import Client as GlobusClient; GlobusClient()"
