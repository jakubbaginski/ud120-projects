ud120-projects
==============

Starter project code for students taking Udacity ud120.<br>
The goal of this project is to provide a docker image for the course and make examples/assignments compatibile with Python3<br>

## How to use it:
### 1. Set DISPLAY env to \<your IP\>:0.0
### 2. Run container 
### 3. Play with, modify and execute scripts :)

<code>
export DISPLAY=`ifconfig en0 | grep "inet " | awk '{print $2}'`:0.0
</code><br><code>
xhost +
</code><br><code>
docker container run -it --rm  -e DISPLAY -p 10022:22 -v ud120:/home/ud120/ --name ml jakubbaginski/ud120-projects:debian-python3-1.0.3
</code><br><code>
python3 /home/ud120/ud120-projects/choose_your_own/your_algorithm.py
</code>
<br>
<br>
OR run specific scripts directly
<br><br>
<code>
docker container run -it --rm  -e DISPLAY -p 10022:22 -v ud120:/home/ud120/ --name ml jakubbaginski/ud120-projects:debian-python3-1.0.3 python3 /home/ud120/ud120-projects/choose_your_own/your_algorithm.py
</code>

------------------------------------------------------

## Optional use via ssh
### 1. Start container (detached mode)
### 2. Connect via SSH
### 3. Play with, modify and execute scripts :)

<code>
docker container run --rm  -e DISPLAY -p 10022:22 -v ud120:/home/ud120/ --name ml jakubbaginski/ud120-projects:debian-python3-1.0.3 /bin/bash -c 'while [ 1 ]; do sleep 30; done;'
</code><br><code>
ssh -l ud120 -Y -p 10022 -v 127.0.0.1
</code><br><code>
python3 /home/ud120/ud120-projects/choose_your_own/your_algorithm.py
</code>

------------------------------------------------------

### TO DO
- compatibility with Python 3 - all examples/assignemnts have to be checked and modified<br>
- add code static verification

## Changelog

v.1.0.3
- use of docker volumes (in order code modifications are not lost after container restarts)
- clone of the ud120-projects from git at the very first start of environment
- download of Enron data at the very first start of environment
- docker image optimization
