ud120-projects
==============

Starter project code for students taking Udacity ud120

The goal is to provide a docker image for the course and rewrite all examples/assignments to be python3 compatibile

v1.0.0<br>
Working docker image, X11Forwarding used for presentations of output<br>

1. Start docker container<br>
docker container run --rm -it -p 10022:22 jakubbaginski/ud120-projects:debian-python3-1.0.0 
<br>
and execute two commands<br>
/etc/init.d/ssh restart<br>
passwd ud120<br>

2. in additional terminal connect to the docker container<br>
ssh -2 -v -p 10022 -l ud120 -Y 127.0.0.1<br>

and execute (this is just a test)<br>
python3 /ud120/choose_your_own/your_algorithm_test.py<br>

TO DO<br>
- compatibility with Python 3 - all examples/assignemnts have to be checked and modified<br>
- docker image - implement direct X11Forwarding, not by ssh 
