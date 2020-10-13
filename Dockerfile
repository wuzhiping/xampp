FROM ubuntu:16.04

ENV LANG C.UTF-8
#jdk8
RUN apt-get -q update && \
    apt-get -y --no-install-recommends install net-tools curl python-glade2 wget vim mysql-client && \
    rm -rf /var/lib/apt/lists/*


WORKDIR /opt

COPY ./xampp-linux-x64-1.8.3-5-installer.run /opt/xampp-linux-x64-1.8.3-5-installer.run
#RUN wget https://udomain.dl.sourceforge.net/project/xampp/XAMPP%20Linux/1.8.3/xampp-linux-x64-1.8.3-5-installer.run --no-check-certificate

RUN chmod +x ./xampp-linux-x64-1.8.3-5-installer.run

RUN ./xampp-linux-x64-1.8.3-5-installer.run --mode unattended

EXPOSE 80

WORKDIR /opt/lampp

CMD /opt/lampp/lampp start && tail -F /opt/lampp/logs/error_log
