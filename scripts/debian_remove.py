#!/usr/bin/env python
import os

os.system("dpkg -l | grep tlwg | awk '{ print $2 }' | xargs apt-get remove -y")

os.system("dpkg -l | grep thunderbird | awk '{ print $2 }' | xargs apt-get remove -y")
