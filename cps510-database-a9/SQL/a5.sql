DROP TABLE Interview CASCADE CONSTRAINTS; 
DROP TABLE Resume CASCADE CONSTRAINTS; 
DROP TABLE JobApplication CASCADE CONSTRAINTS; 
DROP TABLE JobApplicant CASCADE CONSTRAINTS; 
DROP TABLE Job CASCADE CONSTRAINTS; 
DROP TABLE Recruiter CASCADE CONSTRAINTS; 
DROP TABLE Company CASCADE CONSTRAINTS; 

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

-- Inserting Data Values into Tables
-- Adds sample companies with their companyID, name, industry, location, email, and phone
INSERT INTO Company VALUES (1, 'Apple Canada', 'Software', '120 Bremner Boulevard Suite 1600, Toronto, Ontario, M5J 0A8', '', '647-943-4400'); 
INSERT INTO Company VALUES (2, 'Royal Bank of Canada (RBC)', 'Banking', 'Toronto, Ontario, Canada', 'recruitment@rbc.com', '1-800-769-2511'); 
INSERT INTO Company VALUES (3, 'AMD', 'Technology', 'Markham, Ontario, Canada', '', '905-882-2600'); 
INSERT INTO Company VALUES (4, 'SAMSUNG', 'Hardware', 'Vancouver, British Columbia', 'recruitment@samsung.com', '416-230-8121');

-- Adds sample recruiters linked to companies with their recruiterID, respective companyID (company that recruiter works for), first and last names, email, and phone. 
INSERT INTO Recruiter VALUES (1, 1, 'Jane', 'Doe', 'jane.doe@apple.com', '647-222-3333'); 
INSERT INTO Recruiter VALUES (2, 2, 'Bob', 'William', 'bob.william@rbc.com', '416-111-1111'); 
INSERT INTO Recruiter VALUES (3, 3, 'John', 'Daniels', 'john.daniels@amd.com', '905-423-5678'); 
INSERT INTO Recruiter VALUES (4, 4, 'Jack', 'Jones', 'jack.jones@samsung.com', '647-333-4444');

-- Adds sample jobs posted by recruiters with jobID, respective recruiterID (recruiter who posted job), respective companyID (company that the job is for), salary, hours, date posted, location, title, and description
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

-- Adds sample job applicants with their first and last names, industry, birthdate, address, email, and phone.
INSERT INTO JobApplicant VALUES (1, 'Alice', 'Bob', 'Technology', TO_DATE('2002-04-13', 'YYYY-MM-DD'), '123 Bay Street, Toronto, Ontario, Canada, M1B 2K3', 'alice.bob@gmail.com', '416-123-455'); 
INSERT INTO JobApplicant VALUES (2, 'Jake', 'Blake', 'Technology', TO_DATE('2004-05-06', 'YYYY-MM-DD'), '456 Main Street, Markham, Ontario, Canada, L6H 1F3', 'jake.blake@hotmail.com', '647-444-1947'); 
INSERT INTO JobApplicant VALUES (3, 'Griffin', 'Walker', 'Banking', TO_DATE('2003-12-25', 'YYYY-MM-DD'), '789 Bond Avenue, Ajax, Ontario, Canada, L0H 1H9', 'griffin.walker@outlook.com', '905-289-9876'); 
INSERT INTO JobApplicant VALUES (4, 'Ed', 'Stephens', 'Software', TO_DATE('2004-01-25', 'YYYY-MM-DD'), '145 Bloor Avenue, Toronto, Ontario, Canada, M5B 3K9', 'ed.stephens@outlook.com', '905-444-2121'); 
INSERT INTO JobApplicant VALUES (5, 'Joe', 'Random', 'Technology', TO_DATE('2001-07-29', 'YYYY-MM-DD'), '7622 Markham Road, Markham, Ontario, Canada, L6H 9A3', 'joe.random@gmail.com', '647-543-2211'); 
INSERT INTO JobApplicant VALUES (6, 'Michael', 'Jordan', 'Hardware', TO_DATE('2002-11-09', 'YYYY-MM-DD'), '116 Bond Street, Hamilton, Ontario, Canada, LOP 1B9', 'michael.jordan@gmail.com', '416-989-7777'); 
INSERT INTO JobApplicant VALUES (7, 'Sam', 'Inactive', 'Technology', TO_DATE('2002-04-13', 'YYYY-MM-DD'), '123 Bay Street, Toronto, Ontario, Canada, M1B 2K3', 'sam.inactive@gmail.com', '416-123-8293'); 

-- Adds sample applications linking applicants (respective applicantID) to jobs (respective jobID) with jobAppID, status, and date.
INSERT INTO JobApplication VALUES (1, 1, 1, TO_DATE('2025-09-28', 'YYYY-MM-DD'), 'Rejected'); 
INSERT INTO JobApplication VALUES (2, 2, 2, TO_DATE('2025-09-29', 'YYYY-MM-DD'), 'Under Review');
INSERT INTO JobApplication VALUES (3, 3, 3, TO_DATE('2025-09-30', 'YYYY-MM-DD'), 'Submitted'); 
INSERT INTO JobApplication VALUES (4, 1, 4, TO_DATE('2025-09-30', 'YYYY-MM-DD'), 'Interview Pending');
INSERT INTO JobApplication VALUES (5, 3, 5, TO_DATE('2025-09-30', 'YYYY-MM-DD'), 'Interview Pending');
INSERT INTO JobApplication VALUES (6, 4, 6, TO_DATE('2025-09-30', 'YYYY-MM-DD'), 'Interview Pending');
INSERT INTO JobApplication VALUES (7, 4, 5, TO_DATE('2025-10-04', 'YYYY-MM-DD'), 'Interview Pending');

-- Adds sample resumes for applicants with resumeID, respective applicantID (each resume belongs to an job applicant), upload_file (resume file), and uploadDate (date when resume was uploaded).
INSERT INTO Resume VALUES (1, 1, UTL_RAW.CAST_TO_RAW('Alice Bob'), TO_DATE('2002-04-13', 'YYYY-MM-DD')); 
INSERT INTO Resume VALUES (2, 2, UTL_RAW.CAST_TO_RAW('Jake Blake Resume'), TO_DATE('2025-09-28', 'YYYY-MM-DD')); 
INSERT INTO Resume VALUES (3, 3, UTL_RAW.CAST_TO_RAW('Griffin Walker Resume'), TO_DATE('2025-09-29', 'YYYY-MM-DD')); 
INSERT INTO Resume VALUES (4, 4, UTL_RAW.CAST_TO_RAW('Ed Stephens Resume'), TO_DATE('2025-09-28', 'YYYY-MM-DD')); 
INSERT INTO Resume VALUES (5, 5, UTL_RAW.CAST_TO_RAW('Joe Random Resume'), TO_DATE('2025-09-29', 'YYYY-MM-DD')); 
INSERT INTO Resume VALUES (6, 6, UTL_RAW.CAST_TO_RAW('Michael Jordan Resume'), TO_DATE('2025-09-30', 'YYYY-MM-DD')); 
INSERT INTO Resume VALUES (7, 6, UTL_RAW.CAST_TO_RAW('Michael Jordan Resume 2'), TO_DATE('2025-10-04', 'YYYY-MM-DD')); 

-- Adds sample interviews linked to job applications (includes respective jobAppID) with interviewID, date, time, and location. 
INSERT INTO Interview VALUES (1, 4, TO_DATE('2025-10-1 10:00 AM', 'YYYY-MM-DD HH:MI AM'), 'Toronto, Ontario, Canada');
INSERT INTO Interview VALUES (2, 5, TO_DATE('2025-10-2 11:00 AM', 'YYYY-MM-DD HH:MI AM'), 'Markham, Ontario, Canada');
INSERT INTO Interview VALUES (3, 6, TO_DATE('2025-10-3 1:00 PM', 'YYYY-MM-DD HH:MI PM'), 'Vancouver, British Columbia, Canada'); 

-- UPDATE, SET, WHERE queries: Used to update the attribute values of an existing row in a selected table.
-- Updates the location of the company whose companyID is 1 (Apple Canada).
UPDATE Company
SET location = 'Toronto, Ontario, Canada' 
WHERE companyID = 1; 

-- Updates the industry of the company whose companyID is 1 (Apple Canada). 
UPDATE Company
SET industry = 'Technology' 
WHERE companyID = 1; 

-- Updates the uploadDate of the resume whose resumeID is 1. 
UPDATE Resume
SET uploadDate = TO_DATE('2025-09-27', 'YYYY-MM-DD')
WHERE resumeID = 1; 

-- Updates the upload_file of the resume whose resumeID is 1. 
UPDATE Resume
SET upload_file = UTL_RAW.CAST_TO_RAW('Alice Bob Resume')
WHERE resumeID = 1; 

-- List of job applicants who applied to either Apple Canada or AMD - Combines two sets: Job applicants who applied to Apple Canada or AMD, uses UNION
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

-- Count total job applications per company and show only those above average - uses GROUP BY, aggregate COUNT, and HAVING with a subquery
SELECT c.name AS CompanyName, COUNT(ja.jobAppID) AS TotalJobApplications
FROM Company c
JOIN Job j ON c.companyID = j.companyID
JOIN JobApplication ja ON j.jobID = ja.jobID
GROUP BY c.name
HAVING COUNT(ja.jobAppID) > ( 
    SELECT AVG(job_app_count) 
    FROM (
        SELECT COUNT(ja2.jobAppID) AS job_app_count
        From JobApplication ja2
        JOIN Job j2 ON ja2.jobID = j2.jobID
        GROUP BY j2.companyID
    )
)
ORDER BY TotalJobApplications DESC; 

-- Lists all companies that have at least one job posting where at least one job applicant has applied (sent a job application) - uses EXISTS
SELECT DISTINCT c.name AS CompanyName
FROM Company c
WHERE EXISTS ( 
    SELECT 1
    FROM Job j 
    JOIN JobApplication ja ON j.jobID = ja.jobID
    WHERE j.companyID = c.companyID
); 

-- Lists all the job applicants that have applied (sent a job application) for at least one job, but have never been interviewed - uses MINUS
SELECT DISTINCT a.applicantID, a.first_name, a.last_name
FROM JobApplicant a
JOIN JobApplication ja ON a.applicantID = ja.applicantID
MINUS
SELECT DISTINCT a.applicantID, a.first_name, a.last_name
FROM JobApplicant a
JOIN JobApplication ja ON a.applicantID = ja.applicantID
JOIN Interview i ON ja.jobAppID = i.jobAppID; 

-- Lists the average salary of all jobs posted, including the minimum and maximum salaries of the jobs posted by the company - uses aggregates AVG, MIN, and MAX
SELECT 
    c.name AS CompanyName,
    AVG(j.salary) AS AvgSalary, 
    MIN(j.salary) AS MinSalary, 
    MAX(j.salary) AS MaxSalary
FROM Company c
JOIN Job j ON c.companyID = j.companyID
GROUP BY c.name
ORDER BY AvgSalary DESC; 


    





