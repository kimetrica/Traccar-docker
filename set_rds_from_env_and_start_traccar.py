#!/usr/bin/env python2
""" This replaces {POSTGRES_HOSTNAME} and {POSTGRES_PASSWORD} with env """
import os


with open('/opt/traccar/conf/traccar.xml') as f:
    traccar_xml = f.read()

with open('/opt/traccar/conf/traccar.xml', 'w') as f:
    f.write(traccar_xml.format(
        POSTGRES_HOSTNAME=os.environ['POSTGRES_HOSTNAME'],
        POSTGRES_USERNAME=os.environ['POSTGRES_USERNAME'],
        POSTGRES_PASSWORD=os.environ['POSTGRES_PASSWORD']))

os.system('/opt/traccar/bin/traccar start && tail -F /opt/traccar/logs/tracker'
          '-server.log')
