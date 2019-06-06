#! /bin/bash
# Crear i engegar xinetd
# -------------------------------------

/opt/docker/install.sh && echo "Install Ok"
/sbin/xinetd -dontfork  && echo "xinetd Ok"
