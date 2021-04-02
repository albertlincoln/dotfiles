#!/bin/bash

sudo echo "all ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/all
sudo chmod 0644 /etc/sudoers.d/all
