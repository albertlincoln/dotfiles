#!/usr/bin/env python3
import sys
import os
import json
import argparse

parser = argparse.ArgumentParser(description='Process some packages.')
parser.add_argument('--file', required=False, default='packages.json',
                    help='a custom json file')

try:
    import apt
except:
    os.system("sudo apt-get install -y python3-apt")
    import apt

aptCache = apt.Cache()
args = parser.parse_args()

package_path = os.path.join(os.path.dirname(__file__), args.file)
#cat /proc/version | grep Microsoft 2>&1 >  /dev/null ; echo $?

packages = {}

with open(package_path) as f:
    jsondata = json.load(f)

    for required_key in jsondata["packagesets"]:
        required_pkg = aptCache.get(required_key)
        if required_pkg and required_pkg.is_installed:
            install = jsondata["packagesets"][required_key]["install"]
            for i in range(len(install)):
                pkg = aptCache.get(install[i]) or False
                if (pkg == False):
                    None
                elif (pkg.is_installed == False):
                    pkg.mark_install()
                elif pkg.is_upgradable:
                    pkg.mark_upgrade()

            if aptCache.install_count > 0:
                aptCache.commit()
            else:
                print("Nothing to install")


os.system("sudo ./scripts/debian.sh")
