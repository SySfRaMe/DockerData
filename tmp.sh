#!/bin/bash

mkdir Mounts/influxdb_data
chown 999:999 Mounts/influxdb_data
chmod 755 Mounts/influxdb_data

mkdir Mounts/grafana_data
chown 472:472 Mounts/grafana_data
chmod 777 Mounts/grafana_data
