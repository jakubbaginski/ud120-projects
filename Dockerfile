FROM python:3.8.0-buster

ADD ./ /ud120/
WORKDIR /ud120/

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
	&& apt-get -y install libopenblas-dev liblapack-dev gfortran \
	&& pip install --upgrade pip \
	&& pip install cython numpy \
	&& pip install -r requirements.txt \
	&& useradd ud120 

RUN curl --progress-bar --ciphers AES256-SHA --output maildir/enron_mail.tar.gz https://www.cs.cmu.edu/~enron/enron_mail_20150507.tar.gz \
	&& chown -R ud120:ud120 . 

VOLUME ./maildir/:/ud120/maildir/

ENV DEBIAN_FRONTEND teletype
USER ud120

CMD ["bash"]

