use 20220279db;

CREATE TABLE department (
    dept_name VARCHAR(50),
    building VARCHAR(50),
    budget DECIMAL(12, 2)
);


ALTER TABLE department
ADD PRIMARY KEY (dept_name);

CREATE TABLE student (
    SID INT,
    name VARCHAR(100),
    dept_name VARCHAR(50),
    total_credit INT,
    PRIMARY KEY (SID),
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

CREATE TABLE course (
    course_id INT,
    title VARCHAR(100),
    dept_name VARCHAR(50),
    credits INT,
    PRIMARY KEY (course_id),
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

CREATE TABLE instructor (
    IID INT,
    name VARCHAR(100),
    dept_name VARCHAR(50),
    salary DECIMAL(8, 2),
    PRIMARY KEY (IID),
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

CREATE TABLE teaches (
    IID INT,
    course_id INT,
    sec_id INT,
    semester VARCHAR(10),
    year INT,
    PRIMARY KEY (IID, course_id, sec_id, semester, year),
    FOREIGN KEY (IID) REFERENCES instructor(IID),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE takes (
    SID INT,
    course_id INT,
    sec_id INT,
    semester VARCHAR(10),
    year INT,
    grade CHAR(1),
    PRIMARY KEY (SID, course_id, sec_id, semester, year),
    FOREIGN KEY (SID) REFERENCES student(SID),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE advisor (
    SID INT,
    IID INT,
    PRIMARY KEY (SID, IID),
    FOREIGN KEY (SID) REFERENCES student(SID),
    FOREIGN KEY (IID) REFERENCES instructor(IID)
);

CREATE TABLE prereq (
    course_id INT,
    prereq_id INT,
    PRIMARY KEY (course_id, prereq_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (prereq_id) REFERENCES course(course_id)
);

ALTER TABLE instructor
ALTER COLUMN salary SET DEFAULT 10000;


INSERT INTO department VALUES ('Computer Science', 'Science Bldg', 120000);


INSERT INTO takes VALUES (1, 101, 1, '3', 2022, 'A');


DELETE FROM course WHERE course_id = 101;

TRUNCATE TABLE takes;

SELECT * FROM department;



