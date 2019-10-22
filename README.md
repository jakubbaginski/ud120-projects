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
</code><code><br><br>
xhost +
</code><code><br>
docker container run --rm -e DISPLAY -it --name ml jakubbaginski/ud120-projects:debian-python3-1.0.2
</code><code><br>
python3 /ud120/choose_your_own/your_algorithm_test.py
</code>
<br>
<br>
OR run specific scripts directly

<code>
docker container run --rm -e DISPLAY jakubbaginski/ud120-projects:debian-python3-1.0.1 python3 choose_your_own/your_algorithm_test.py
</code>

------------------------------------------------------

### Optional use via ssh
## 1. Start container (detached mode)
## 2. Connect via SSH
## 3. Play with, modify and execute scripts :)

<code>
docker container run -d --rm -p 10022:22 --name ml jakubbaginski/ud120-projects:debian-python3-1.0.1 /bin/bash -c 'while [ 1 ]; do sleep 30; done;'
</code><code><br>
ssh -l ud120 -Y -p 10022 -v  127.0.0.1
</code><code><br>
python3 /ud120/choose_your_own/your_algorithm_test.py
</code>

------------------------------------------------------

### TO DO
- compatibility with Python 3 - all examples/assignemnts have to be checked and modified<br>
- code static verification to be added

