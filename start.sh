#!/bin/bash

docker container run --rm -e DISPLAY=192.168.1.50:0.0 --network=host -v /tmp/.X11-unix:/tmp/.X11-unix jakubbaginski/ud120-projects:debian python3 choose_your_own/your_algorithm_test.py

