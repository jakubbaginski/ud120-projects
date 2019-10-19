ud120-projects
==============

Starter project code for students taking Udacity ud120

The goal is to provide a docker image for the course and rewrite all examples/assignments to be python3 compatibile

v1.0
Working docker image, X11Forwarding used for presentations of output

1.
Start docker container
docker container run --rm -it -p 10022:22 jakubbaginski/ud120-projects:debian-python3-1.0.0 

and execute two commands
/etc/init.d/ssh restart
passwd ud120

in second terminal connect to the docker container
ssh -2 -v -p 10022 -l ud120 -Y 127.0.0.1

and execute (this is just a test)
python3 /ud120/choose_your_own/your_algorithm_test.py


TO DO
- compatibility with Python 3 - all examples/assignemnts have to be checked and modified
- docker image - implement direct X11Forwarding, not by ssh 
