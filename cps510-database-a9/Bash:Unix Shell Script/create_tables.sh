#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
if [ -z "$STR" ]; then
  echo "ERROR: STR not set. Run from menu.sh or set STR before calling this script."
  exit 1
fi

sqlplus64 -s "$STR" <<EOF

CREATE TABLE Company ( 
    companyID      INTEGER PRIMARY KEY, 
    name           VARCHAR(30) NOT NULL UNIQUE,
    industry       VARCHAR(100), 
    location       VARCHAR(200), 
    email          VARCHAR(100), 
    phone          VARCHAR(20)
); 

CREATE TABLE Recruiter ( 
    recruiterID    INTEGER PRIMARY KEY, 
    companyID      INTEGER NOT NULL, 
    first_name     VARCHAR(30),
    last_name      VARCHAR(30), 
    email          VARCHAR(100) NOT NULL UNIQUE, 
    phone          VARCHAR(20), 
    FOREIGN KEY (companyID) REFERENCES Company (companyID)
); 

CREATE TABLE Job ( 
    jobID          INTEGER PRIMARY KEY, 
    companyID      INTEGER NOT NULL, 
    recruiterID    INTEGER NOT NULL, 
    employer       VARCHAR(30) NOT NULL,
    salary         FLOAT, 
    workingHours   FLOAT, 
    datePosted     DATE, 
    location       VARCHAR(200), 
    title          VARCHAR(100) NOT NULL, 
    description    VARCHAR(500) NOT NULL, 
    FOREIGN KEY (companyID) REFERENCES Company (companyID), 
    FOREIGN KEY (recruiterID) REFERENCES Recruiter (recruiterID)
); 

CREATE TABLE JobApplicant ( 
    applicantID    INTEGER PRIMARY KEY, 
    first_name     VARCHAR(30) NOT NULL,
    last_name      VARCHAR(30), 
    industry       VARCHAR(100), 
    birthdate      DATE, 
    address        VARCHAR(200), 
    email          VARCHAR(100) NOT NULL UNIQUE, 
    phone          VARCHAR(20)
); 

CREATE TABLE JobApplication ( 
    jobAppID       INTEGER PRIMARY KEY,
    jobID          INTEGER NOT NULL,
    applicantID    INTEGER NOT NULL, 
    dateTime       DATE,
    status         VARCHAR(20), 
    FOREIGN KEY (jobID) REFERENCES Job (jobID), 
    FOREIGN KEY (applicantID) REFERENCES JobApplicant (applicantID)
); 

CREATE TABLE Resume ( 
    resumeID       INTEGER PRIMARY KEY, 
    applicantID    INTEGER NOT NULL, 
    upload_file    BLOB NOT NULL, 
    uploadDate     DATE DEFAULT SYSDATE NOT NULL,
    FOREIGN KEY (applicantID) REFERENCES JobApplicant (applicantID)
);

CREATE TABLE Interview ( 
    interviewID    INTEGER PRIMARY KEY, 
    jobAppID       INTEGER NOT NULL, 
    dateTime       DATE DEFAULT SYSDATE NOT NULL, 
    location       VARCHAR(100) NOT NULL, 
    FOREIGN KEY (jobAppID) REFERENCES JobApplication (jobAppID)
); 

exit;
EOF