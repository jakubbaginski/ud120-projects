FROM debian:stable-20191014

#Includes files from https://github.com/jakubbaginski/ud120-projects
#plus Enron data (see comments below)
WORKDIR /ud120/

ENV DEBIAN_FRONTEND=noninteractive, DISPLAY=${DISPLAY}

RUN apt-get update \
	&& apt-get -y install python3-sklearn python3-numpy python3-scipy python3-matplotlib cython3 python3-nltk \
	&& apt-get -y install bash xauth sudo vim openssh-server git \
	&& apt-get clean \
	&& apt-get purge -y --auto-remove 

# Add content of the Introduction to Machine Learning couse (UdaCity)
ADD ./ /ud120/

# Add ud120 user + default password + sudo rights, enable ssh X11 forwarding	
RUN useradd ud120 --home /home/ud120/ --shell /bin/bash \
	&& chown -R ud120:ud120 . \
	&& mkdir /home/ud120 \
        && chown ud120:ud120 /home/ud120 \
	&& sed -i 's/^#X11Forwarding.*/X11Forwarding yes/' /etc/ssh/sshd_config \
	&& sed -i 's/^#X11UseLocalhost.*/X11UseLocalhost no/' /etc/ssh/sshd_config \
	&& sed -i 's/^ud120:.*/ud120:$6$3BZn8xHToxcZE1TU$rya\/yKhycQAnKqim3K3E7UCmQRgfnJDy2r3Q0.vDyWTnUXHrPUptK1j9CuKRilgzKJuT8rTKlF5A4cnYcTA2g\/:18189:0:99999:7:::/' /etc/shadow \
	&& usermod -a -G sudo ud120 \
	&& echo "ud120     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Enron email database is already added to image
# Download is not needed
# RUN curl --progress-bar --ciphers AES256-SHA --output maildir/enron_mail.tar.gz https://www.cs.cmu.edu/~enron/enron_mail_20150507.tar.gz

ENV DEBIAN_FRONTEND=teletype

#Expose SSH access port if ssh X11 forward is used instead
EXPOSE 10022:22

#The final image should be build with USER uncommented
USER ud120

ENTRYPOINT ["./start.sh"]
CMD ["/bin/bash"]

