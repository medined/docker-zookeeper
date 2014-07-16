FROM ubuntu

ADD . /docker

RUN apt-get install -y supervisor
RUN mkdir -p /etc/supervisor/conf.d /var/log/supervisor
RUN cp /docker/supervisord.conf /etc/

CMD ["/usr/bin/supervisord", "-n"]
