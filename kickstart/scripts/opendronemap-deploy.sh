#!/bin/bash

##
# Creates directories and configurations for the POSM OpenDroneMap API
# Nginx proxy configuration is done when deploying Nginx
#
# Depends:
#  * redis
##
deploy_opendronemap_ubuntu() {
  mkdir -p /opt/data/{opendronemap,uploads}

  chown posm-admin:posm-admin /opt/data/{opendronemap,uploads}

  docker pull quay.io/mojodna/posm-opendronemap-api

  expand etc/odm-web.upstart /etc/init/odm-web.conf
  expand etc/odm-worker.upstart /etc/init/odm-worker.conf

  service odm-web start
  service odm-worker start
}

deploy opendronemap
