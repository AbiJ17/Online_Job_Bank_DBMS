#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
if [ -z "$STR" ]; then
  echo "ERROR: STR not set. Run from menu.sh or set STR before calling this script."
  exit 1
fi

sqlplus64 -s "$STR" <<EOF

SET PAGESIZE 100
SET LINESIZE 200
SET FEEDBACK OFF
SET HEADING ON
SET ECHO OFF
SET WRAP OFF
SET TRIMSPOOL ON

CREATE VIEW ApplicantJobInfo AS
SELECT 
    a.applicantID, 
    a.first_name, 
    a.last_name, 
    j.title AS job_title, 
    c.name AS company_name, 
    r.first_name || ' ' || r.last_name AS recruiter_name
FROM JobApplicant a, JobApplication ja, Job j, Company c, Recruiter r 
WHERE a.applicantID = ja.applicantID
    AND ja.jobID = j.jobID
    AND j.companyID = c.companyID
    AND j.recruiterID = r.recruiterID; 
SELECT * FROM ApplicantJobInfo;

CREATE VIEW InterviewSchedules AS
SELECT
    i.interviewID, 
    a.first_name || ' ' || a.last_name AS applicant_name, 
    j.title AS job_title, 
    r.first_name || ' ' || r.last_name AS recruiter_name, 
    i.location
FROM Interview i, JobApplication ja, Job j, Recruiter r, JobApplicant a
WHERE i.jobAppID = ja.jobAppID
    AND ja.jobID = j.jobID
    AND ja.applicantID = a.applicantID
    AND j.recruiterID = r.recruiterID; 
SELECT * FROM InterviewSchedules;

CREATE VIEW CompanyJobSummary AS
SELECT
    c.name AS company_name, 
    r.first_name || ' ' || r.last_name AS recruiter_name, 
    COUNT(j.jobID) AS total_jobs_posted
FROM Company c, Job j, Recruiter r
WHERE c.companyID = j.companyID
    AND j.recruiterID = r.recruiterID
GROUP BY c.name, r.first_name, r.last_name
ORDER BY c.name ASC; 
SELECT * FROM CompanyJobSummary;

exit;
EOF