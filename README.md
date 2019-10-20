ud120-projects
==============

Starter project code for students taking Udacity ud120
The goal is to provide a docker image for the course and rewrite all examples/assignments to be python3 compatibile

# How to use it:
# 1. Set DISPLAY env to <your IP>:0.0
# 2. Run container 
# 3. Play with, modify and execute scripts 

<br>export DISPLAY=`ifconfig en0 | grep "inet " | awk '{print $2}'`:0.0
<br>xhost +
<br>docker container run --rm -e DISPLAY -it --name ml jakubbaginski/ud120-projects:debian-python3-1.0.1
<br>python3 /ud120/choose_your_own/your_algorithm_test.py
<br>
OR run specific scripts directly
<br>
<br>docker container run --rm -e DISPLAY jakubbaginski/ud120-projects:debian-python3-1.0.1 python3 choose_your_own/your_algorithm_test.py

---------------------------
---------------------------

# Optional use via ssh
# 1. Start container (detached mode)
# 2. Connect via SSH
# 3. Play with, modify and execute scripts

<br>docker container run -d --rm -p 10022:22 --name ml jakubbaginski/ud120-projects:debian-python3-1.0.1 /bin/bash -c 'while [ 1 ]; do sleep 30; done;'
<br>ssh -l ud120 -Y -p 10022 -v  127.0.0.1
<br>python3 /ud120/choose_your_own/your_algorithm_test.py


---------------------------
---------------------------

TO DO
- compatibility with Python 3 - all examples/assignemnts have to be checked and modified
