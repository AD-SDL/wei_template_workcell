# wei-template-workcell

This is a template Workcell repository for the [Workcell Execution Interface](https://github.com/AD-SDL/wei).

## Running the Example App

- First, build the project by running `scripts/build.sh`
- If you're a globus user wishing to use Diaspora to log events, run `scripts/register_diaspora.sh`. This doesn't need to be done more than once unless your globus auth has timed out.
- To start the example workcell and run the example app, run `scripts/start.sh`

After the example app has completed, you can start additional runs without restarting the entire workcell using `scripts/run_example_app.sh`
