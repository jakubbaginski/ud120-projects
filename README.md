## ud120-projects


Starter project code for students taking Udacity ud120 - https://classroom.udacity.com/courses/ud120 <br><br>
The goal of this project is to provide (in addition to orginal project) a develoment env. based on docker image.<br>
Finally the source code of course's assignemnts is now Python3 and Sklearn 0.20.2 compatibile.<br>
Code and data are initialized during first start of container<br><br>

GitHub Repository: https://github.com/jakubbaginski/ud120-projects <br>
Docker Repository: https://cloud.docker.com/repository/docker/jakubbaginski/ud120-projects

------------------------------------------------------

### How to use it:

#### 1. Set DISPLAY env to \<your IP\>:0.0 and allow X11Forwarding on local machine

<xmp>
export DISPLAY=`ifconfig en0 | grep "inet " | awk '{print $2}'`:0.0
xhost +
</xmp>
<br>

#### 2. Run container 

<xmp>
docker container run -it --rm  -e DISPLAY -p 10022:22 -v ud120:/home/ud120/ --name ml jakubbaginski/ud120-projects
</xmp>
<br>

#### 3. Play with, modify and execute scripts :)

<xmp>
python3 /home/ud120/ud120-projects/choose_your_own/your_algorithm.py
</xmp>
<br>

#### Alternative to #2 and #3 is to run specific scripts directly

<xmp>
docker container run -it --rm  -e DISPLAY -p 10022:22 -v ud120:/home/ud120/ --name ml jakubbaginski/ud120-projects python3 /home/ud120/ud120-projects/choose_your_own/your_algorithm.py
</xmp>
<br>

------------------------------------------------------

### Optional use by connecting through ssh

#### 1. Start container (detached mode)

<xmp>
docker container run --rm  -e DISPLAY -p 10022:22 -v ud120:/home/ud120/ --name ml jakubbaginski/ud120-projects /bin/bash -c 'while [ 1 ]; do sleep 30; done;'
</xmp>
<br>

#### 2. Connect via SSH (IP should point to docker host)

<xmp>
ssh -l ud120 -Y -p 10022 -v 127.0.0.1
</xmp>
<br>

#### 3. Play with, modify and execute scripts :)

<xmp>
python3 /home/ud120/ud120-projects/choose_your_own/your_algorithm.py
</xmp>
<br>

------------------------------------------------------

### TO DO

- add static code verification
- detached mode - start command should be simpler
- defaulting password for user ud120 - change direct insert into something else
- examples ?
- ideas ? :)

------------------------------------------------------

### Changelog

v.1.0.4 / latest
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
