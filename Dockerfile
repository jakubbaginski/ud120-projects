FROM debian:stable-20191014

LABEL version="1.0.4"
LABEL author="Jakub Bagiński"
LABEL contact="jakub.baginski@gmail.com"
LABEL project.docker.hub.url="https://cloud.docker.com/u/jakubbaginski/repository/docker/jakubbaginski/ud120-projects"
LABEL project.github.url="https://github.com/jakubbaginski/ud120-projects"
LABEL project.udacity.url="https://classroom.udacity.com/courses/ud120"
LABEL description="Python3 based development environment dedicated for 'Intro to Machine Learning course' from UdaCity."

ENV DISPLAY=${DISPLAY}
ARG USER=ud120
ARG USER_HOME=/home/${USER}
ENV REPO_PATH=${USER_HOME}/ud120-projects/

# Repository dir
ADD ./start.sh ${USER_HOME}/
WORKDIR ${USER_HOME}/                                          

# Add packages required - used in the code 
# Add packages supporting development - vim, pylint
# Add packages supporting ssh and display forwarding + enable X11Forwarding
# Add dedicated linux user "ud120" + set sudo rights 

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
	&& apt-get update \
	&& apt-get -y install python3-sklearn python3-numpy python3-scipy python3-matplotlib cython3 python3-nltk \
	&& apt-get -y install bash xauth sudo curl vim openssh-server git pylint3 \
	&& apt-get clean \
	&& apt-get purge -y --auto-remove \
	&& echo 'debconf debconf/frontend select Dialog' | debconf-set-selections \
	&& useradd ${USER} --home ${USER_HOME} --shell /bin/bash \
        && chown -R ${USER}:${USER} ${USER_HOME} \
	&& usermod -a -G sudo ${USER} \
	&& echo ${USER}"     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
        && sed -i 's/^#X11Forwarding.*/X11Forwarding yes/' /etc/ssh/sshd_config \
        && sed -i 's/^#X11UseLocalhost.*/X11UseLocalhost no/' /etc/ssh/sshd_config \
	&& sed -i 's/^ud120:.*/ud120:$6$3BZn8xHToxcZE1TU$rya\/yKhycQAnKqim3K3E7UCmQRgfnJDy2r3Q0.vDyWTnUXHrPUptK1j9CuKRilgzKJuT8rTKlF5A4cnYcTA2g\/:18189:0:99999:7:::/' /etc/shadow
#	TO DO - correct the code
#	&& SECRET=`python3 -c 'import crypt; print(crypt.crypt("ud120", crypt.mksalt(crypt.METHOD_SHA512)))'` \
#       && sed -i 's/^${USER}:.*/${USER}:${SECRET}:18189:0:99999:7:::/' /etc/shadow 

USER ${USER}:${USER}
VOLUME ${USER_HOME}                                                                                                                                                                    
# Expose SSH access port enabling remote access to the container
EXPOSE 10022:22

# Startup script
ENTRYPOINT ["./start.sh"]
CMD ["/bin/bash"]

