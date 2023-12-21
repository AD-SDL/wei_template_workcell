# wei-template-workcell

This is a template Workcell repository for the [Workcell Execution Interface](https://github.com/AD-SDL/wei).

## Dependencies

- This template uses GNU make and a `Makefile` for configuration and as a command runner. You can run `make help` for a complete list of supported `make` commands and a brief description of what they do.
- You'll need [docker installed](https://docs.docker.com/engine/install/)
    - Make sure to follow the [post installation steps](https://docs.docker.com/engine/install/linux-postinstall/) to enable non-root user access

## Configuration

As much as possible, this workcell is designed to be configured via the following:

- The "Workcell Configuration" block in the `Makefile`
- The `compose.yaml`
    - Note: whenever you see `${SOME_VARIABLE_NAME}` in the compose file, this value is set in the `Makefile` and should be edited there
- The `Dockerfile` in `example_app/`
- The Workcell Config in `workcell_defs/example_workcell.yaml`

## Building

To build the workcell, run `make build` in the root of the repository.

## Running

Run `make run` to start the workcell and run the example application.

## Using Diaspora

To use Diaspora for logging events, you can change `USE_DIASPORA` to `true` in the `Makefile` or run `make <subcommand> USE_DIASPORA=true`
