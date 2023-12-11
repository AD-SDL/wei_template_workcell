# wei-template-workcell

This is a template Workcell repository for the [Workcell Execution Interface](https://github.com/AD-SDL/wei).

## Running the Example App

If you're a globus user wishing to use Diaspora to log events, run `scripts/register_diaspora.sh` before running the following. This doesn't need to be done more than once unless your globus auth has timed out.


To start the example workcell and run the example app, run the following in the root of the repository:

```
scripts/build.sh
scripts/start.sh
```

After the example app has completed, you can start additional runs without restarting the entire workcell using `scripts/run_examle_app.sh`
