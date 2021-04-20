#!/usr/bin/env python3
import sys
import os
import json
import argparse
from subprocess import call

parser = argparse.ArgumentParser(description='Process some packages.')
parser.add_argument('--file', required=False, default='packages.json',
                    help='a custom json file')


args = parser.parse_args()

package_path = os.path.join(os.path.dirname(__file__), args.file)

packages = {}

with open(package_path) as f:
    jsondata = json.load(f)

    for required_key in jsondata["packagesets"]:
        install = jsondata["packagesets"][required_key]["install"]
        for i in range(len(install)):
            try:
                call(["sudo", "pacman", "-Sy", "--needed", "--noconfirm", install[i]])
            except Exception as e:
                print(e)
