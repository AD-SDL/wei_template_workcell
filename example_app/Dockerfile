FROM ghcr.io/ad-sdl/wei:dev

ARG USER_ID=9999
ARG GROUP_ID=9999
ARG CONTAINER_USER=app
USER ${CONTAINER_USER}
WORKDIR /home/${CONTAINER_USER}

######################################
# App specific changes go below here #
######################################

COPY --chown=${USER_ID}:${GROUP_ID} ./example_app example_app

RUN --mount=type=cache,target=/home/${CONTAINER_USER}/.cache,uid=${USER_ID},gid=${GROUP_ID} \
    pip install -e example_app

######################################
USER root
