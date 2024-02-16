# wei-template-workcell

This is a template Workcell repository for the [Workcell Execution Interface](https://github.com/AD-SDL/wei).

## Dependencies

- You'll need [docker installed](https://docs.docker.com/engine/install/)
    - Make sure on Linux to follow the [post installation steps](https://docs.docker.com/engine/install/linux-postinstall/) to enable non-root user access
- You'll need Python 3.8 or greater installed to run the Example Application.

## Configuration

As much as possible, this workcell is designed to be configured declaratively. This is done with:

- A `.env` file, which you can create by copying `example.env` (`cp example.env .env` on Linux).
- The `compose.yaml` docker compose file, which defines a "stack" of containers that control your workcell
    - Note: whenever you see `${SOME_VARIABLE_NAME}` in the compose file, this value is being taken from the `.env`
- The Workcell Config in `workcell_defs/example_workcell.yaml`, which allows you to define WEI specific configuration for your workcell

## Building, Running, and Managing your Workcell

- `docker compose up` to start your workcell (`docker compose up -d` starts it in the background)
- `docker compose down` to stop a workcell
- `docker compose logs -f` to view the output

## Experiment Application

See `example_app/README.md` for info on installing and running the example application using your workcell.
