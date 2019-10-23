#!/bin/bash

sudo /etc/init.d/ssh restart

if [ -d ${REPO_PATH} ]; then
	echo "The project code exists already ... skipping clone from git and downloading Enron data."
else
	mkdir ${REPO_PATH} && \
	cd ${REPO_PATH} && \
	echo "Cloning code from git repository: https://github.com/jakubbaginski/ud120-projects.git" && \
	git clone https://github.com/jakubbaginski/ud120-projects.git . && \
	echo "Downloading Enron data ..." && \
	curl --progress-bar --ciphers AES256-SHA --output enron_mail.tar.gz https://www.cs.cmu.edu/~enron/enron_mail_20150507.tar.gz && \
	echo "Unpacking data, this can take few minutes ..." && \
	tar -xzf enron_mail.tar.gz --totals && \
	rm enron_mail.tar.gz && \
	echo "Done."
fi

exec "${@}"
