#!/usr/bin/env bash

source "$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"/script_helper.sh

# This script allows you to register Diaspora before running the example app.
docker run -it --rm \
    -v ~/.diaspora:/home/wei/.diaspora \
    $project_name \
    python -c "from diaspora_event_sdk import Client, block_until_ready; Client(); print("Validating diaspora is ready"); block_until_ready()"
