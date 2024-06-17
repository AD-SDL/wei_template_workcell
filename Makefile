.DEFAULT_GOAL := init

.PHONY += init paths checks test clean

init: # Do the initial configuration of the project
	@test -e .env || cp example.env .env
ifeq ($(shell uname),Darwin)
	@sed -i '' 's/^USER_ID=.*/USER_ID=1000/' .env
	@sed -i '' 's/^GROUP_ID=.*/GROUP_ID=1000/' .env
else
	@sed -i 's/^USER_ID=.*/USER_ID=$(shell id -u)/' .env
	@sed -i 's/^GROUP_ID=.*/GROUP_ID=$(shell id -g)/' .env
endif

.env: init

checks: # Runs all the pre-commit checks
	@pre-commit install
	@pre-commit run --all-files || { echo "Checking fixes\n" ; pre-commit run --all-files; }

clean:
	@rm .env
