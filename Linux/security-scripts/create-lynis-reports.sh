#!/bin/bash
lynis audit system --tests-from-group authentication --report-file ./sys.dat --log-file ./sys.log --quiet
lynis audit system --report-file ./full.dat --log-file ./full.log --quiet



