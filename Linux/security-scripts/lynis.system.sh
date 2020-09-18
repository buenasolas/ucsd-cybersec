#!/bin/bash
lynis audit system --report-file /tmp/lynis.system_scan.dat --logfile /tmp/lynis.system_scan.log --quiet
#lynis -c > /tmp/lynis.stdout.system_scan.dat
