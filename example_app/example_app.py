#!/usr/bin/env python3
"""Runs an example of a WEI workflow"""

import json
from pathlib import Path

from wei import ExperimentClient


def main() -> None:
    """Runs an example WEI workflow"""
    # The path to the Workflow definition yaml file
    wf_path = Path(__file__).parent / "workflows" / "example_workflow.yaml"

    # This defines the Experiment object that will communicate with the WEI server
    exp = ExperimentClient("wei_server", "8000", "Example_Program")

    # This runs the workflow
    flow_info = exp.start_run(
        wf_path.resolve(),
        payload={
            "wait_time": 5,
            "file_name": "experiment_output.jpg",
        },
    )
    print(json.dumps(flow_info, indent=2))

    # The below line can be used to fetch the result and save it in our local directory
    exp.get_file(
        flow_info["hist"]["Take Picture"]["action_msg"],
        "/home/app/.wei/experiment_output.jpg",
    )


if __name__ == "__main__":
    main()
