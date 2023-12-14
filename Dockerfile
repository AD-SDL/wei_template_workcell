FROM ghcr.io/ad-sdl/wei

# Set up user permissions for mounting volumes with the same user as the host
# This prevents a lot of permission issues
# Note: if you're not using the build script, you'll need to pass these args in
ARG USER_ID=1000
ARG GROUP_ID=1000
ARG CONTAINER_USER=wei
ARG CONTAINER_USER_ID=1000
ARG CONTAINER_GROUP_ID=1000
USER root
RUN userdel -f ${CONTAINER_USER} &&\
    if getent group ${CONTAINER_USER}; then groupdel ${CONTAINER_USER}; fi &&\
    groupadd -g ${GROUP_ID} ${CONTAINER_USER} &&\
    useradd -l -u ${USER_ID} -g ${CONTAINER_USER} ${CONTAINER_USER} &&\
    chown --changes --silent --no-dereference --recursive \
        --from=${CONTAINER_USER_ID}:${CONTAINER_GROUP_ID} ${USER_ID}:${GROUP_ID} \
        /home/$CONTAINER_USER
USER ${CONTAINER_USER}
WORKDIR /home/${CONTAINER_USER}

######################################
# App specific changes go below here #
######################################

COPY --chown=${USER_ID}:${GROUP_ID} ./example_app example_app

RUN pip install -e example_app

CMD ["python3", "example_app/example_app.py"]