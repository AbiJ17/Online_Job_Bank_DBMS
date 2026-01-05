#!/bin/sh
MainMenu()
{
        while [ "$CHOICE" != "START" ]
        do
                clear
                echo "================================================================="
                echo "|                 Online Job Bank System                 |"
                echo "|         Query Menu - Select Desired Query(ies):        |"
                echo "|    <CTRL-Z Anytime to Enter Interactive CMD Prompt>    |"
                echo "-----------------------------------------------------------------"
        echo " $IS_SELECTEDM M) View Manual"
        echo " "
        echo " $IS_SELECTED1 1) All Industries of Companies (a4_1)"
        echo " $IS_SELECTED2 2) All Emails of Recrutiers (a4_1)"
        echo " $IS_SELECTED3 3) Number of Jobs Posted by Each Company (a4_1)"
        echo " $IS_SELECTED4 4) Find Youngest Job Applicant (a4_1)"
        echo " $IS_SELECTED5 5) All Job Applicants That Have Uploaded a Resume (a4_1)"
        echo " $IS_SELECTED6 6) Number of Job Applications Submitted to a Job Posting (a4_1)"
        echo " $IS_SELECTED7 7) Scheduled Interviews (a4_1)"
        echo " $IS_SELECTED8 8) Job Applicants That Applied to Jobs Posted by Recruiter Bob William (a4_2)"
        echo " $IS_SELECTED9 9) Job Applicants That Applied to the Software Engineer Job at Apple Canada (a4_2)"
        echo " $IS_SELECTED10 10) Job Applicants With Interviews For Jobs Posted by Each Recrutier (a4_2)"
        echo " $IS_SELECTED11 11) Job Applicants Who Applied to Apple Canada or AMD (a5)"
        echo " $IS_SELECTED12 12) Total Job Applications Per Company (a5)"
        echo " $IS_SELECTED13 13) Job Applicants With Interviews For Jobs Posted by Each Recrutier (a5)"
        echo " $IS_SELECTED14 14) Job Applicants Who Applied to Apple Canada or AMD (a5)"
        echo " $IS_SELECTED15 15) Total Job Applications Per Company (a5)"
        echo " "
        echo " $IS_SELECTEDX X) Force/Stop/Kill Oracle DB"
        echo " "
        echo " $IS_SELECTEDE E) End/Exit"
        echo "Choose: "

        read CHOICE

        if [ "$CHOICE" == "0" ]
        then
                echo "Nothing Here"

        elif [ "$CHOICE" == "1" ]
        then
		echo "Creating query..."
if [ -z "$STR" ]; then
  echo "ERROR: STR not set. Run from menu.sh or set STR before calling this script."
  exit 1
fi

sqlplus64 -s "$STR" <<EOF
SELECT DISTINCT industry 
FROM Company 
WHERE industry IS NOT NULL
ORDER BY industry;
EOF
            	while true; do
                	read -rsn1 key  # Read a single character silently
                	if [[ -n "$key" ]]; then
                        	echo "Key pressed. Continuing..."
                        	break  # Exit the loop if a key is pressed
                	fi
            	done 

        elif [ "$CHOICE" == "2" ]
        then
		echo "Creating query..."
if [ -z "$STR" ]; then
  echo "ERROR: STR not set. Run from menu.sh or set STR before calling this script."
  exit 1
fi

sqlplus64 -s "$STR" <<EOF
SELECT DISTINCT email
FROM Recruiter
ORDER BY email;
EOF
                while true; do
                        read -rsn1 key  # Read a single character silently
                        if [[ -n "$key" ]]; then
                                echo "Key pressed. Continuing..."
                                break  # Exit the loop if a key is pressed
                        fi
                done 


        elif [ "$CHOICE" == "3" ]
        then
		echo "Creating query..." 
if [ -z "$STR" ]; then
  echo "ERROR: STR not set. Run from menu.sh or set STR before calling this script."
  exit 1
fi

sqlplus64 -s "$STR" <<EOF
SELECT companyID, COUNT(jobID) AS job_count, employer
FROM Job
GROUP BY companyID, employer
ORDER BY job_count DESC, companyID ASC;
EOF
		while true; do
                        read -rsn1 key  # Read a single character silently
                        if [[ -n "$key" ]]; then
                                echo "Key pressed. Continuing..."
                                break  # Exit the loop if a key is pressed
                        fi
                done 


        elif [ "$CHOICE" == "4" ]
        then
                echo "Creating query..."
if [ -z "$STR" ]; then
  echo "ERROR: STR not set. Run from menu.sh or set STR before calling this script."
  exit 1
fi

sqlplus64 -s "$STR" <<EOF
SELECT DISTINCT first_name, last_name, birthdate
FROM JobApplicant
WHERE last_name IS NOT NULL AND birthdate IS NOT NULL
ORDER BY birthdate DESC; 
EOF
                while true; do
                        read -rsn1 key  # Read a single character silently
                        if [[ -n "$key" ]]; then
                                echo "Key pressed. Continuing..."
                                break  # Exit the loop if a key is pressed
                        fi
                done 


        elif [ "$CHOICE" == "5" ]
        then
		echo "Creating query..."
if [ -z "$STR" ]; then
  echo "ERROR: STR not set. Run from menu.sh or set STR before calling this script."
  exit 1
fi

sqlplus64 -s "$STR" <<EOF
SELECT jobID, COUNT(jobAppID) AS application_count
FROM JobApplication
GROUP BY jobID
ORDER BY application_count DESC, jobID ASC;
EOF
                while true; do
                        read -rsn1 key  # Read a single character silently
                        if [[ -n "$key" ]]; then
                                echo "Key pressed. Continuing..."
                                break  # Exit the loop if a key is pressed
                        fi
                done 

        elif [ "$CHOICE" == "6" ]
        then
		echo "Creating query..."
if [ -z "$STR" ]; then
  echo "ERROR: STR not set. Run from menu.sh or set STR before calling this script."
  exit 1
fi

sqlplus64 -s "$STR" <<EOF
SELECT DISTINCT applicantID, uploadDate
FROM Resume
ORDER BY uploadDate DESC, applicantID ASC; 
EOF
                while true; do
                        read -rsn1 key  # Read a single character silently
                        if [[ -n "$key" ]]; then
                                echo "Key pressed. Continuing..."
                                break  # Exit the loop if a key is pressed
                        fi
                done 

        elif [ "$CHOICE" == "7" ]
        then
		echo "Creating query..."
if [ -z "$STR" ]; then
  echo "ERROR: STR not set. Run from menu.sh or set STR before calling this script."
  exit 1
fi

sqlplus64 -s "$STR" <<EOF
SELECT jobAppID, COUNT(interviewID) AS interview_count
FROM Interview
GROUP BY jobAppID
ORDER BY interview_count;
EOF
                while true; do
                        read -rsn1 key  # Read a single character silently
                        if [[ -n "$key" ]]; then
                                echo "Key pressed. Continuing..."
                                break  # Exit the loop if a key is pressed
                        fi
                done  

        elif [ "$CHOICE" == "8" ]
        then
		echo "Creating query..."
if [ -z "$STR" ]; then
  echo "ERROR: STR not set. Run from menu.sh or set STR before calling this script."
  exit 1
fi

sqlplus64 -s "$STR" <<EOF
SELECT a.applicantID, a.first_name || ' ' || a.last_name AS applicant_name
FROM JobApplicant a, JobApplication ja, Job j, Recruiter r
WHERE r.first_name = 'Bob'
 AND r.last_name = 'William' 
 AND r.recruiterID = j.recruiterID
 AND j.jobID = ja.jobID
 AND ja.applicantID = a.applicantID
ORDER BY a.applicantID asc; 
EOF
                while true; do
                        read -rsn1 key  # Read a single character silently
                        if [[ -n "$key" ]]; then
                                echo "Key pressed. Continuing..."
                                break  # Exit the loop if a key is pressed
                        fi
                done  

        elif [ "$CHOICE" == "9" ]
        then
		echo "Creating query..."
if [ -z "$STR" ]; then
  echo "ERROR: STR not set. Run from menu.sh or set STR before calling this script."
  exit 1
fi

sqlplus64 -s "$STR" <<EOF
SELECT a.applicantID, a.first_name || ' ' || a.last_name AS applicant_name
FROM JobApplicant a, JobApplication ja, Job j, Company c
WHERE j.title = 'Software Engineer'
 AND c.name = 'Apple Canada'
 AND j.companyID = c.companyID
 AND ja.jobID = j.jobID
 AND ja.applicantID = a.applicantID
ORDER BY a.applicantID asc;
EOF
                while true; do
                        read -rsn1 key  # Read a single character silently
                        if [[ -n "$key" ]]; then
                                echo "Key pressed. Continuing..."
                                break  # Exit the loop if a key is pressed
                        fi
                done  
 

        elif [ "$CHOICE" == "10" ]
        then
		echo "Creating query..."
if [ -z "$STR" ]; then
  echo "ERROR: STR not set. Run from menu.sh or set STR before calling this script."
  exit 1
fi

sqlplus64 -s "$STR" <<EOF
SELECT r.first_name || ' ' || r.last_name AS recruiter_name, COUNT(DISTINCT a.applicantID) AS applicant_count
FROM Interview i, JobApplication ja, Job j, Recruiter r, JobApplicant a
WHERE r.recruiterID = j.recruiterID
 AND j.jobID = ja.jobID
 AND ja.jobAppID = i.jobAppID
 AND ja.applicantID = a.applicantID
GROUP BY r.first_name, r.last_name
ORDER BY applicant_count DESC;
EOF
                while true; do
                        read -rsn1 key  # Read a single character silently
                        if [[ -n "$key" ]]; then
                                echo "Key pressed. Continuing..."
                                break  # Exit the loop if a key is pressed
                        fi
                done  

        elif [ "$CHOICE" == "11" ]
        then
		echo "Creating query..."
if [ -z "$STR" ]; then
  echo "ERROR: STR not set. Run from menu.sh or set STR before calling this script."
  exit 1
fi

sqlplus64 -s "$STR" <<EOF
SELECT DISTINCT a.applicantID, a.first_name, a.last_name
FROM JobApplicant a
JOIN JobApplication ja ON a.applicantID = ja.applicantID
JOIN Job j ON ja.jobID = j.jobID
JOIN Company c ON j.companyID = c.companyID
WHERE c.name = 'Apple Canada'
UNION
SELECT DISTINCT a.applicantID, a.first_name, a.last_name
FROM JobApplicant a
JOIN JobApplication ja ON a.applicantID = ja.applicantID
JOIN Job j ON ja.jobID = j.jobID
JOIN Company c ON j.companyID = c.companyID
WHERE c.name = 'AMD';
EOF
                while true; do
                        read -rsn1 key  # Read a single character silently
                        if [[ -n "$key" ]]; then
                                echo "Key pressed. Continuing..."
                                break  # Exit the loop if a key is pressed
                        fi
                done 

        elif [ "$CHOICE" == "12" ]
        then
		echo "Creating query..."
if [ -z "$STR" ]; then
  echo "ERROR: STR not set. Run from menu.sh or set STR before calling this script."
  exit 1
fi

sqlplus64 -s "$STR" <<EOF
SELECT c.name AS CompanyName, COUNT(ja.jobAppID) AS TotalJobApplications
FROM Company c
JOIN Job j ON c.companyID = j.companyID
JOIN JobApplication ja ON j.jobID = ja.jobID
GROUP BY c.name
HAVING COUNT(ja.jobAppID) > ( 
 SELECT AVG(job_app_count) 
 FROM (
  SELECT COUNT(ja2.jobAppID) AS job_app_count
  FROM JobApplication ja2
  JOIN Job j2 ON ja2.jobID = j2.jobID
  GROUP BY j2.companyID
 )
)
ORDER BY TotalJobApplications DESC;
EOF
                while true; do
                        read -rsn1 key  # Read a single character silently
                        if [[ -n "$key" ]]; then
                                echo "Key pressed. Continuing..."
                                break  # Exit the loop if a key is pressed
                        fi
                done 

        elif [ "$CHOICE" == "13" ]
        then
		echo "Creating query..."
if [ -z "$STR" ]; then
  echo "ERROR: STR not set. Run from menu.sh or set STR before calling this script."
  exit 1
fi

sqlplus64 -s "$STR" <<EOF
SELECT DISTINCT c.name AS CompanyName
FROM Company c
WHERE EXISTS ( 
 SELECT 1
 FROM Job j 
 JOIN JobApplication ja ON j.jobID = ja.jobID
 WHERE j.companyID = c.companyID
);
EOF
                while true; do
                        read -rsn1 key  # Read a single character silently
                        if [[ -n "$key" ]]; then
                                echo "Key pressed. Continuing..."
                                break  # Exit the loop if a key is pressed
                        fi
                done 

        elif [ "$CHOICE" == "14" ]
        then
		echo "Creating query..."
if [ -z "$STR" ]; then
  echo "ERROR: STR not set. Run from menu.sh or set STR before calling this script."
  exit 1
fi

sqlplus64 -s "$STR" <<EOF
SELECT DISTINCT a.applicantID, a.first_name, a.last_name
FROM JobApplicant a
JOIN JobApplication ja ON a.applicantID = ja.applicantID
MINUS
SELECT DISTINCT a.applicantID, a.first_name, a.last_name
FROM JobApplicant a
JOIN JobApplication ja ON a.applicantID = ja.applicantID
JOIN Interview i ON ja.jobAppID = i.jobAppID; 
EOF
                while true; do
                        read -rsn1 key  # Read a single character silently
                        if [[ -n "$key" ]]; then
                                echo "Key pressed. Continuing..."
                                break  # Exit the loop if a key is pressed
                        fi
                done

        elif [ "$CHOICE" == "15" ]
        then
		echo "Creating query..."
if [ -z "$STR" ]; then
  echo "ERROR: STR not set. Run from menu.sh or set STR before calling this script."
  exit 1
fi

sqlplus64 -s "$STR" <<EOF
SELECT 
 c.name AS CompanyName,
 AVG(j.salary) AS AvgSalary, 
 MIN(j.salary) AS MinSalary, 
 MAX(j.salary) AS MaxSalary
FROM Company c
JOIN Job j ON c.companyID = j.companyID
GROUP BY c.name
ORDER BY AvgSalary DESC;
EOF
                while true; do
                        read -rsn1 key  # Read a single character silently
                        if [[ -n "$key" ]]; then
                                echo "Key pressed. Continuing..."
                                break  # Exit the loop if a key is pressed
                        fi
                done
 
        elif [ "$CHOICE" == "E" ]
        then
                exit
        fi
        done
}
MainMenu