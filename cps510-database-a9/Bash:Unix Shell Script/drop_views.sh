#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
if [ -z "$STR" ]; then
  echo "ERROR: STR not set. Run from menu.sh or set STR before calling this script."
  exit 1
fi

sqlplus64 -s "$STR" <<EOF

DROP VIEW ApplicantJobInfo; 
DROP VIEW InterviewSchedules; 
DROP VIEW CompanyJobSummary; 
exit;
EOF