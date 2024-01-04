############################################
# Docker- and Docker Compose-related rules #
############################################

run: # Runs APP_COMMAND in a container named APP_NAME
# The line below ensures that if we're using diaspora, we register it before running
run: $(if $(findstring $(USE_DIASPORA),true), register_diaspora)
	docker compose -f $(COMPOSE_FILE) exec -u app $(APP_NAME) $(APP_COMMAND) $(args)

exec: init # Opens a shell in the APP_NAME container
	docker compose -f $(COMPOSE_FILE) exec -u app $(APP_NAME) /bin/bash $(args)

build: init # Builds the docker image for APP_NAME
	docker compose -f $(COMPOSE_FILE) build $(args)

start: init # Starts all the docker containers and detaches, allowing you to run other commands
start: $(if $(findstring $(USE_DIASPORA),true), register_diaspora)
	docker compose -f $(COMPOSE_FILE) up -d $(args)

up: init # Starts all the docker containers and attaches, allowing you to see the logs
	docker compose -f $(COMPOSE_FILE) up $(args)

ps: init # Shows the status of all the docker containers
	docker compose -f $(COMPOSE_FILE) ps $(args)

restart: init # Restarts all the docker containers
	docker compose -f $(COMPOSE_FILE) restart $(args)

pull: init # Pull the latest versions of the required containers
	docker compose -f ${COMPOSE_FILE} pull

update: init pull build stop start # Pulls, builds, stops, and then starts all containers

down: stop # Stops all the docker containers
stop: init # Stops all the docker containers
	docker compose -f $(COMPOSE_FILE) down $(args)

logs: init # Shows the logs for all the docker containers
	docker compose -f $(COMPOSE_FILE) logs -f $(args)

remove: init # Removes all the docker containers, but preserves volumes
	docker compose -f $(COMPOSE_FILE) down --rmi all $(args)
