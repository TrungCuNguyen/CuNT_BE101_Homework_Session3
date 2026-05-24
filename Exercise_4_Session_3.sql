CREATE SCHEMA hospital;

CREATE TABLE hospital.Patient
(
    patient_id      SERIAL PRIMARY KEY,
    patient_name    VARCHAR(50) NOT NULL,
    patient_age     INT         NOT NULL,
    patient_address VARCHAR(100),
    patient_phone   VARCHAR(11)
);

CREATE TABLE hospital.Doctor
(
    doctor_id   SERIAL PRIMARY KEY,
    doctor_name VARCHAR(100) NOT NULL,
    major       VARCHAR(50)  NOT NULL
);

CREATE TABLE hospital.Department
(
    department_id   SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    description     TEXT         NOT NULL,
    doctor_id       INT REFERENCES hospital.Doctor (doctor_id)
);

CREATE TABLE hospital.Medical_File
(
    medical_file_id  SERIAL PRIMARY KEY,
    file_description TEXT,
    file_title       VARCHAR(50) NOT NULL,
    appointment_date DATE        NOT NULL,
    result           TEXT        NOT NULL,
    patient_id       INT REFERENCES hospital.Patient (patient_id),
    doctor_id        INT REFERENCES hospital.Doctor (doctor_id),
    department_id    INT REFERENCES hospital.Department (department_id)
);