#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
if [ -z "$STR" ]; then
  echo "ERROR: STR not set. Run from menu.sh or set STR before calling this script."
  exit 1
fi

sqlplus64 -s "$STR" <<EOF

DROP TABLE Interview CASCADE CONSTRAINTS; 
DROP TABLE Resume CASCADE CONSTRAINTS; 
DROP TABLE JobApplication CASCADE CONSTRAINTS; 
DROP TABLE JobApplicant CASCADE CONSTRAINTS; 
DROP TABLE Job CASCADE CONSTRAINTS; 
DROP TABLE Recruiter CASCADE CONSTRAINTS; 
DROP TABLE Company CASCADE CONSTRAINTS; 
exit;
EOF