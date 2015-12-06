#!/usr/bin/env python2
""" This script replaces {POSTGRES_DATABASE_HOSTNAME} with RDS_HOSTNAME env """
import os


with open('/opt/traccar/conf/traccar.xml') as f:
    traccar_xml = f.read()

with open('/opt/traccar/conf/traccar.xml', 'w') as f:
    f.write(traccar_xml.format(
        POSTGRES_HOSTNAME=os.environ['RDS_HOSTNAME'],
        POSTGRES_PASSWORD=os.environ['POSTGRES_PASSWORD']))

os.system('/opt/traccar/bin/traccar start && tail -f /opt/traccar/logs/tracker'
          '-server.log')
