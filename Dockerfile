# Version: 0.0.1
# hisx2 M11 2018-2019
# pop server pop3s
# -------------------------------------
FROM fedora:27
LABEL author="parveeen"
LABEL description="popserver"
RUN dnf -y install procps nmap xinetd uw-imap telnet passwd openssl
RUN mkdir /opt/docker
COPY * /opt/docker/
RUN chmod +x /opt/docker/install.sh /opt/docker/startup.sh
WORKDIR /opt/docker
#EXPOSE 110 995
CMD ["/opt/docker/startup.sh"]
