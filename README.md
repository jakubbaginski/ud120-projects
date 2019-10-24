ud120-projects
===========================

Starter project code for students taking Udacity ud120.<br>
The goal of this project is to provide (in addition to orginal project) a develoment env. based on docker image.<br>
Finally the source code of course's assignemnts is now Python3 and Sklearn 0.20.2 compatibile.<br>

### How to use it:

#### 1. Set DISPLAY env to \<your IP\>:0.0 and allow X11Forwarding on local machine
<code>
export DISPLAY=`ifconfig en0 | grep "inet " | awk '{print $2}'`:0.0
</code><br>
<code>
xhost +
</code>

#### 2. Run container 
<code>
docker container run -it --rm  -e DISPLAY -p 10022:22 -v ud120:/home/ud120/ --name ml jakubbaginski/ud120-projects:debian-python3-1.0.4
</code>

#### 3. Play with, modify and execute scripts :)
<code>
python3 /home/ud120/ud120-projects/choose_your_own/your_algorithm.py
</code>
<br>
<br>

#### Alternative to #2 and #3 is to run specific scripts directly
<code>
docker container run -it --rm  -e DISPLAY -p 10022:22 -v ud120:/home/ud120/ --name ml jakubbaginski/ud120-projects:debian-python3-1.0.4 python3 /home/ud120/ud120-projects/choose_your_own/your_algorithm.py
</code>

------------------------------------------------------

### Optional use by connecting through ssh

#### 1. Start container (detached mode)
<code>
docker container run --rm  -e DISPLAY -p 10022:22 -v ud120:/home/ud120/ --name ml jakubbaginski/ud120-projects:debian-python3-1.0.4 /bin/bash -c 'while [ 1 ]; do sleep 30; done;'
</code>

#### 2. Connect via SSH (IP should point to docker host)
<code>
ssh -l ud120 -Y -p 10022 -v 127.0.0.1
</code>

#### 3. Play with, modify and execute scripts :)
<code>
python3 /home/ud120/ud120-projects/choose_your_own/your_algorithm.py
</code>

------------------------------------------------------

### TO DO

- add static code verification
- detached mode - start command should be simpler
- defaulting password for user ud120 - change direct insert into something else 
- ideas ? :)

### Changelog

v.1.0.4
- compatibility with Python 3 - source code is modified and verified.

v.1.0.3
- use of docker volumes (in order code modifications are not lost after container restarts)
- clone of the ud120-projects from git at the very first start of environment
- download of Enron data at the very first start of environment
- docker image optimization

v.1.0.2
- git packages added to environment, most of scripts are made Python3 compatible. 

v.1.0.1
- development environment ready (python3.7), graphical presentation of results is possible, one example script is provided
