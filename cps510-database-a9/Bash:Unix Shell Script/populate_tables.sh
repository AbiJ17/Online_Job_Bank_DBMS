#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
if [ -z "$STR" ]; then
  echo "ERROR: STR not set. Run from menu.sh or set STR before calling this script."
  exit 1
fi

sqlplus64 -s "$STR" <<EOF

INSERT INTO Company VALUES (1, 'Apple Canada', 'Software', '120 Bremner Boulevard Suite 1600, Toronto, Ontario, M5J 0A8', '', '647-943-4400'); 
INSERT INTO Company VALUES (2, 'Royal Bank of Canada (RBC)', 'Banking', 'Toronto, Ontario, Canada', 'recruitment@rbc.com', '1-800-769-2511'); 
INSERT INTO Company VALUES (3, 'AMD', 'Technology', 'Markham, Ontario, Canada', '', '905-882-2600'); 
INSERT INTO Company VALUES (4, 'SAMSUNG', 'Hardware', 'Vancouver, British Columbia', 'recruitment@samsung.com', '416-230-8121');

INSERT INTO Recruiter VALUES (1, 1, 'Jane', 'Doe', 'jane.doe@apple.com', '647-222-3333'); 
INSERT INTO Recruiter VALUES (2, 2, 'Bob', 'William', 'bob.william@rbc.com', '416-111-1111'); 
INSERT INTO Recruiter VALUES (3, 3, 'John', 'Daniels', 'john.daniels@amd.com', '905-423-5678'); 
INSERT INTO Recruiter VALUES (4, 4, 'Jack', 'Jones', 'jack.jones@samsung.com', '647-333-4444');

INSERT INTO Job VALUES (1, 1, 1, 'Apple Canada', 31.50, 36.25, TO_DATE('2025-09-22', 'YYYY-MM-DD'), 'Toronto, Ontario, Canada', 'Software Engineer', 'Develop and maintain Apple software products.'); 
INSERT INTO Job VALUES (2, 2, 2, 'Royal Bank of Canada (RBC)', 24.50, 35.00, TO_DATE('2025-09-24', 'YYYY-MM-DD'), 'Toronto, Ontario, Canada', 'Financial Analyst', 'Analyze financial data and provide insights for RBC clients.');  
INSERT INTO Job VALUES (3, 3, 3, 'AMD', 28.50, 40.00, TO_DATE('2025-09-26', 'YYYY-MM-DD'), 'Markham, Ontario, Canada', 'Systems Design Engineer', 'Responsible for designing, integrating, and validating complex hardware and software systems.');
INSERT INTO Job VALUES (4, 4, 4, 'Samsung', 25, 42, DATE '2025-09-28', 'Vancouver, British Columbia, Canada', 'Software Developer', 'Develop and maintain applications for Samsung.');
INSERT INTO Job VALUES (5, 1, 1, 'Apple Canada', 31.50, 36.25, TO_DATE('2025-09-22', 'YYYY-MM-DD'), 'Toronto, Ontario, Canada', 'Mobile Developer', 'Develop and maintain Apple mobile products and services.'); 
INSERT INTO Job VALUES (6, 1, 1, 'Apple Canada', 31.50, 36.25, TO_DATE('2025-10-04', 'YYYY-MM-DD'), 'Toronto, Ontario, Canada', 'Janitor', 'Mop the floors and clean the bathrooms.'); 
INSERT INTO Job VALUES (7, 1, 1, 'Apple Canada', 40.75, 40.00, TO_DATE('2025-10-10', 'YYYY-MM-DD'), 'Toronto, Ontario, Canada', 'Data Engineer', 'Design and maintain Apple’s data pipelines.');
INSERT INTO Job VALUES (8, 1, 1, 'Apple Canada', 29.00, 38.00, TO_DATE('2025-10-11', 'YYYY-MM-DD'), 'Toronto, Ontario, Canada', 'IT Support Specialist', 'Provide internal tech support for Apple employees.');
INSERT INTO Job VALUES (9, 2, 2, 'Royal Bank of Canada (RBC)', 22.00, 35.00, TO_DATE('2025-10-08', 'YYYY-MM-DD'), 'Toronto, Ontario, Canada', 'Bank Teller', 'Assist clients with daily transactions.');
INSERT INTO Job VALUES (10, 2, 2, 'Royal Bank of Canada (RBC)', 31.50, 37.50, TO_DATE('2025-10-09', 'YYYY-MM-DD'), 'Toronto, Ontario, Canada', 'Data Analyst', 'Analyze customer trends to improve banking performance.');
INSERT INTO Job VALUES (11, 3, 3, 'AMD', 45.00, 40.00, TO_DATE('2025-10-06', 'YYYY-MM-DD'), 'Markham, Ontario, Canada', 'Hardware Engineer', 'Develop and test AMD hardware components.');
INSERT INTO Job VALUES (12, 3, 3, 'AMD', 35.00, 40.00, TO_DATE('2025-10-07', 'YYYY-MM-DD'), 'Markham, Ontario, Canada', 'Software Engineer', 'Develop internal tools and automation frameworks for AMD.');
INSERT INTO Job VALUES (13, 4, 4, 'Samsung', 26.50, 40.00, TO_DATE('2025-10-05', 'YYYY-MM-DD'), 'Vancouver, British Columbia, Canada', 'QA Tester', 'Perform software and hardware quality assurance tests.');
INSERT INTO Job VALUES (14, 4, 4, 'Samsung', 30.00, 40.00, TO_DATE('2025-10-06', 'YYYY-MM-DD'), 'Vancouver, British Columbia, Canada', 'UI/UX Designer', 'Design user interfaces for Samsung applications.');

INSERT INTO JobApplicant VALUES (1, 'Alice', 'Bob', 'Technology', TO_DATE('2002-04-13', 'YYYY-MM-DD'), '123 Bay Street, Toronto, Ontario, Canada, M1B 2K3', 'alice.bob@gmail.com', '416-123-455'); 
INSERT INTO JobApplicant VALUES (2, 'Jake', 'Blake', 'Technology', TO_DATE('2004-05-06', 'YYYY-MM-DD'), '456 Main Street, Markham, Ontario, Canada, L6H 1F3', 'jake.blake@hotmail.com', '647-444-1947'); 
INSERT INTO JobApplicant VALUES (3, 'Griffin', 'Walker', 'Banking', TO_DATE('2003-12-25', 'YYYY-MM-DD'), '789 Bond Avenue, Ajax, Ontario, Canada, L0H 1H9', 'griffin.walker@outlook.com', '905-289-9876'); 
INSERT INTO JobApplicant VALUES (4, 'Ed', 'Stephens', 'Software', TO_DATE('2004-01-25', 'YYYY-MM-DD'), '145 Bloor Avenue, Toronto, Ontario, Canada, M5B 3K9', 'ed.stephens@outlook.com', '905-444-2121'); 
INSERT INTO JobApplicant VALUES (5, 'Joe', 'Random', 'Technology', TO_DATE('2001-07-29', 'YYYY-MM-DD'), '7622 Markham Road, Markham, Ontario, Canada, L6H 9A3', 'joe.random@gmail.com', '647-543-2211'); 
INSERT INTO JobApplicant VALUES (6, 'Michael', 'Jordan', 'Hardware', TO_DATE('2002-11-09', 'YYYY-MM-DD'), '116 Bond Street, Hamilton, Ontario, Canada, LOP 1B9', 'michael.jordan@gmail.com', '416-989-7777'); 
INSERT INTO JobApplicant VALUES (7, 'Sam', 'Inactive', 'Technology', TO_DATE('2002-04-13', 'YYYY-MM-DD'), '123 Bay Street, Toronto, Ontario, Canada, M1B 2K3', 'sam.inactive@gmail.com', '416-123-8293'); 

INSERT INTO JobApplication VALUES (1, 1, 1, TO_DATE('2025-09-28', 'YYYY-MM-DD'), 'Rejected'); 
INSERT INTO JobApplication VALUES (2, 2, 2, TO_DATE('2025-09-29', 'YYYY-MM-DD'), 'Under Review');
INSERT INTO JobApplication VALUES (3, 3, 3, TO_DATE('2025-09-30', 'YYYY-MM-DD'), 'Submitted'); 
INSERT INTO JobApplication VALUES (4, 1, 4, TO_DATE('2025-09-30', 'YYYY-MM-DD'), 'Interview Pending');
INSERT INTO JobApplication VALUES (5, 3, 5, TO_DATE('2025-09-30', 'YYYY-MM-DD'), 'Interview Pending');
INSERT INTO JobApplication VALUES (6, 4, 6, TO_DATE('2025-09-30', 'YYYY-MM-DD'), 'Interview Pending');
INSERT INTO JobApplication VALUES (7, 4, 5, TO_DATE('2025-10-04', 'YYYY-MM-DD'), 'Interview Pending');

INSERT INTO Resume VALUES (1, 1, UTL_RAW.CAST_TO_RAW('Alice Bob'), TO_DATE('2002-04-13', 'YYYY-MM-DD')); 
INSERT INTO Resume VALUES (2, 2, UTL_RAW.CAST_TO_RAW('Jake Blake Resume'), TO_DATE('2025-09-28', 'YYYY-MM-DD')); 
INSERT INTO Resume VALUES (3, 3, UTL_RAW.CAST_TO_RAW('Griffin Walker Resume'), TO_DATE('2025-09-29', 'YYYY-MM-DD')); 
INSERT INTO Resume VALUES (4, 4, UTL_RAW.CAST_TO_RAW('Ed Stephens Resume'), TO_DATE('2025-09-28', 'YYYY-MM-DD')); 
INSERT INTO Resume VALUES (5, 5, UTL_RAW.CAST_TO_RAW('Joe Random Resume'), TO_DATE('2025-09-29', 'YYYY-MM-DD')); 
INSERT INTO Resume VALUES (6, 6, UTL_RAW.CAST_TO_RAW('Michael Jordan Resume'), TO_DATE('2025-09-30', 'YYYY-MM-DD')); 
INSERT INTO Resume VALUES (7, 6, UTL_RAW.CAST_TO_RAW('Michael Jordan Resume 2'), TO_DATE('2025-10-04', 'YYYY-MM-DD')); 

INSERT INTO Interview VALUES (1, 4, TO_DATE('2025-10-1 10:00 AM', 'YYYY-MM-DD HH:MI AM'), 'Toronto, Ontario, Canada');
INSERT INTO Interview VALUES (2, 5, TO_DATE('2025-10-2 11:00 AM', 'YYYY-MM-DD HH:MI AM'), 'Markham, Ontario, Canada');
INSERT INTO Interview VALUES (3, 6, TO_DATE('2025-10-3 1:00 PM', 'YYYY-MM-DD HH:MI PM'), 'Vancouver, British Columbia, Canada'); 

UPDATE Company
SET location = 'Toronto, Ontario, Canada' 
WHERE companyID = 1; 

UPDATE Company
SET industry = 'Technology' 
WHERE companyID = 1; 

UPDATE Resume
SET upload_file = UTL_RAW.CAST_TO_RAW('Alice Bob Resume')
WHERE resumeID = 1; 

UPDATE Resume
SET uploadDate = TO_DATE('2025-09-27', 'YYYY-MM-DD')
WHERE resumeID = 1; 

exit;
EOF