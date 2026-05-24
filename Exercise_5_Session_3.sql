CREATE SCHEMA course_management;

CREATE TABLE course_management.Students
(
    student_id     SERIAL PRIMARY KEY,
    student_name   VARCHAR(50) NOT NULL,
    subscribe_date DATE        NOT NULL,
    email          VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE course_management.Instructors
(
    instructor_id   SERIAL PRIMARY KEY,
    instructor_name VARCHAR(50) NOT NULL,
    major           VARCHAR(50) NOT NULL
);

CREATE TABLE course_management.Courses
(
    course_id   SERIAL PRIMARY KEY,
    course_name VARCHAR(100)   NOT NULL,
    course_fee  NUMERIC(10, 2) NOT NULL,
    description TEXT           NOT NULL
);

CREATE TABLE course_management.Class_Section
(
    class_section_id   SERIAL PRIMARY KEY,
    class_section_time DATE NOT NULL,
    course_id          INT REFERENCES course_management.Courses (course_id),
    instructor_id      INT REFERENCES course_management.Instructors (instructor_id)
);

CREATE TABLE course_management.Enrollments
(
    enrollment_id    SERIAL PRIMARY KEY,
    student_id       INT REFERENCES course_management.Students (student_id),
    class_section_id INT REFERENCES course_management.Class_Section (class_section_id),
    enrollment_date  DATE NOT NULL
);


