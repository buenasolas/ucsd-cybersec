#!/bin/bash
lynis audit --tests-from-group authentication --report-file ./nosys.dat --log-file ./nosys.log --quiet
lynis audit system --tests-from-group authentication --report-file ./sys.dat --log-file ./sys.log --quiet

echo "comparing LOG output from AUDIT SYSTEM to just AUDIT"
diff -y ./sys.log ./no-sys.log
echo "##############################################################"
echo "comparing REPORT output from AUDIT SYSTEM to just AUDIT"
diff - ./sys.dat ./no-sys.dat


