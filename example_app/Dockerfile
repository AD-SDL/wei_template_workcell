FROM ghcr.io/ad-sdl/wei

######################################
# App specific changes go below here #
######################################

COPY ./ example_app

RUN --mount=type=cache,target=/root/.cache \
    pip install -e example_app

######################################
