FROM phusion/baseimage

CMD ["/sbin/my_init"]

RUN apt-get update
RUN apt-get install -y wget
RUN  wget http://github.com/DmitryKoterov/dklab_realplexor/tarball/master


RUN mv /master dklab_realplexor.tar.gz
RUN tar -zxf *realplexor*.tar.gz
RUN ls /opt/
RUN mv DmitryKoterov* /opt/dklab_realplexor
RUN apt-get -y install libev-perl
RUN rm /opt/dklab_realplexor/dklab_realplexor.conf
ADD my.conf /opt/dklab_realplexor/dklab_realplexor.conf


CMD ["/opt/dklab_realplexor/dklab_realplexor.pl"]


# RUN apt-get -y install gcc
# RUN apt-get -y install perl
# RUN ln -s /opt/dklab_realplexor/dklab_realplexor.init /etc/init.d/dklab_realplexor
# RUN rm opt/dklab_realplexor.tar.gz


EXPOSE 10010
EXPOSE 8088
# EXPOSE 443

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
