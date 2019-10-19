FROM debian:latest

#Includes files from https://github.com/jakubbaginski/ud120-projects
#plus Enron data (see comments below)
ADD ./ /ud120/
WORKDIR /ud120/

ENV DEBIAN_FRONTEND=noninteractive, DISPLAY=${DISPLAY}

RUN echo "--" $DISPLAY "--" \
	&& apt-get update \
	&& apt-get -y install python3-sklearn python3-numpy python3-scipy python3-matplotlib cython3 python3-nltk \
	&& apt-get -y install bash xauth sudo vim openssh-server \
	&& apt-get clean \
	&& apt-get purge -y --auto-remove \
	&& useradd ud120 --home /home/ud120/ --shell /bin/bash \
	&& chown -R ud120:ud120 .

# Enable ssh X Forwarding
RUN	sed -i 's/^#X11Forwarding.*/X11Forwarding yes/' /etc/ssh/sshd_config \
	&& sed -i 's/^#X11UseLocalhost.*/X11UseLocalhost no/' /etc/ssh/sshd_config \
	&& mkdir /home/ud120 \
	&& chown ud120:ud120 /home/ud120

#Enron email database is already added to repository
#Download is not needed
#RUN curl --progress-bar --ciphers AES256-SHA --output maildir/enron_mail.tar.gz https://www.cs.cmu.edu/~enron/enron_mail_20150507.tar.gz

ENV DEBIAN_FRONTEND=teletype

#Expose SSH access port
EXPOSE 10022:22

#The final image should be build with USER uncommented
#USER ud120

CMD ["bash"]

