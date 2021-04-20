#!/usr/bin/env python3
import os

os.system("dpkg -l | grep tlwg | awk '{ print $2 }' | xargs apt-get remove -y")

os.system("dpkg -l | grep thunderbird | awk '{ print $2 }' | xargs apt-get remove -y")

os.system("dpkg -l | grep snapd | awk '{ print $2 }' | xargs apt-get remove -y")


os.system("apt remove fonts-lohit*")
