FROM ubuntu:trusty
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive
COPY entrypoint.sh /entrypoint.sh
RUN apt-get update && apt-get -y dist-upgrade && \
	apt-get -y install git authbind python-mysqldb python-twisted python-crypto python-pyasn1 python-gmpy2 python-zope.interface && \
	useradd -d /home/cowrie -s /bin/bash -m -U cowrie && \
	cd /opt && \
	git clone http://github.com/micheloosterhof/cowrie && \
	cd cowrie && \
	cp cowrie.cfg.dist cowrie.cfg && \
	chown -R cowrie:cowrie /opt/cowrie && \
	touch /etc/authbind/byport/22 && \
	chown cowrie /etc/authbind/byport/22 && \
	chmod 500 /etc/authbind/byport/22 && \
	chmod +x /entrypoint.sh

EXPOSE 22
ENTRYPOINT ["/entrypoint.sh"]
