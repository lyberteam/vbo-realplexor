FROM phusion/baseimage

LABEL Vendor="lyberteam"
LABEL Description="This is a reaplexor image"
LABEL Version="1.1.2"
LABEL SpecialThanks="DmitryKoterov"


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

RUN echo "#####################################################################################################"
RUN echo "\
            _                _                     _
           | |              | |                   | |
           | |       _   _  | |__     ___   _ __  | |_    ___    __ _   _ __ ___
           | |      | | | | | '_ \   / _ \ | '__| | __|  / _ \  / _` | | '_ ` _ \|
           | |____  | |_| | | |_) | |  __/ | |    | |_  |  __/ | (_| | | | | | | |
           |______|  \__, | |_.__/   \___| |_|     \__|  \___|  \__,_| |_| |_| |_|
                      __/ |
                     |___/                                                          "
RUN echo "#####################################################################################################"
