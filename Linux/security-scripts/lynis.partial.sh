#!/bin/bash
lynis audit --tests-from-group malware,authentication,networking,storage,filesystems --report-file /tmp/lynis.partial_scan.log --quiet
