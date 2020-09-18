#!/usr/bin/awk -f
BEGIN { FS="\t"; }
/^Performing test ID AUTH-9208/       output=$2; }
$1=="" { output=output " " $2; }
/^"===---"/        { print output; }
