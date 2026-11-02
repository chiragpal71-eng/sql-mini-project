CREATE DATABASE Hospital_Management;
USE Hospital_Management;

-- 1. DEPARTMENT TABLE
CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(100),
    phone VARCHAR(15)
);

-- 2. DOCTOR TABLE
CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15),
    specialization VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- 3. ROOM TABLE
CREATE TABLE Room (
    room_id INT PRIMARY KEY,
    room_number VARCHAR(10),
    room_type VARCHAR(30),
    daily_charge DECIMAL(10,2)
);

-- 4. PATIENT TABLE
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    address VARCHAR(200),
    blood_group VARCHAR(5),
    email VARCHAR(100),
    phone VARCHAR(15),
    date_of_birth DATE,
    gender VARCHAR(10)
);

-- 5. ADMISSION TABLE
CREATE TABLE Admission (
    admission_id INT PRIMARY KEY,
    admission_date DATE,
    discharge_date DATE,
    admission_reason VARCHAR(200),
    status VARCHAR(30),
    patient_id INT,
    room_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (room_id) REFERENCES Room(room_id)
);

-- 6. APPOINTMENT TABLE
CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY,
    appointment_date DATE,
    appointment_time TIME,
    reason VARCHAR(200),
    status VARCHAR(30),
    patient_id INT,
    doctor_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

-- 7. MEDICAL_RECORD TABLE
CREATE TABLE Medical_Record (
    record_id INT PRIMARY KEY,
    record_date DATE,
    diagnosis VARCHAR(200),
    treatment VARCHAR(200),
    notes VARCHAR(300),
    patient_id INT,
    doctor_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

-- 8. PRESCRIPTION TABLE
CREATE TABLE Prescription (
    prescription_id INT PRIMARY KEY,
    prescription_date DATE,
    notes VARCHAR(300),
    patient_id INT,
    doctor_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

-- 9. BILL TABLE
CREATE TABLE Bill (
    bill_id INT PRIMARY KEY,
    bill_date DATE,
    bill_status VARCHAR(30),
    total_amount DECIMAL(10,2),
    patient_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);


-- INSERT DATA INTO DEPARTMENT

INSERT INTO Department VALUES
(1, 'Cardiology', 'Block A', '9876500001'),
(2, 'Neurology', 'Block B', '9876500002'),
(3, 'Orthopedics', 'Block C', '9876500003'),
(4, 'General Medicine', 'Block D', '9876500004');


-- INSERT DATA INTO DOCTOR

INSERT INTO Doctor VALUES
(101, 'Rahul', 'Sharma', 'rahul@gmail.com', '9876511111', 'Heart Specialist', 1),
(102, 'Priya', 'Verma', 'priya@gmail.com', '9876522222', 'Neurologist', 2),
(103, 'Amit', 'Kumar', 'amit@gmail.com', '9876533333', 'Bone Specialist', 3),
(104, 'Neha', 'Gupta', 'neha@gmail.com', '9876544444', 'Physician', 4);


-- INSERT DATA INTO ROOM

INSERT INTO Room VALUES
(201, 'A101', 'General', 1500.00),
(202, 'A102', 'Private', 3000.00),
(203, 'B101', 'ICU', 5000.00),
(204, 'C101', 'General', 1800.00);


-- INSERT DATA INTO PATIENT

INSERT INTO Patient VALUES
(1, 'Chirag', 'Sharma', 'Meerut', 'B+', 'chirag@gmail.com', '9876501234', '2005-05-15', 'Male'),
(2, 'Aman', 'Verma', 'Delhi', 'O+', 'aman@gmail.com', '9876501235', '2004-08-20', 'Male'),
(3, 'Priya', 'Singh', 'Noida', 'A+', 'priya.patient@gmail.com', '9876501236', '2003-02-10', 'Female'),
(4, 'Riya', 'Gupta', 'Ghaziabad', 'AB+', 'riya@gmail.com', '9876501237', '2005-11-25', 'Female');


-- INSERT DATA INTO ADMISSION

INSERT INTO Admission VALUES
(301, '2026-10-01', '2026-10-05', 'Chest Pain', 'Discharged', 1, 201),
(302, '2026-10-10', NULL, 'Headache', 'Admitted', 2, 202),
(303, '2026-10-15', NULL, 'Fracture', 'Admitted', 3, 203),
(304, '2026-10-20', '2026-10-23', 'Fever', 'Discharged', 4, 204);


-- INSERT DATA INTO APPOINTMENT

INSERT INTO Appointment VALUES
(401, '2026-10-25', '10:00:00', 'Heart Checkup', 'Completed', 1, 101),
(402, '2026-10-26', '11:00:00', 'Headache', 'Scheduled', 2, 102),
(403, '2026-10-27', '12:00:00', 'Bone Pain', 'Completed', 3, 103),
(404, '2026-10-28', '14:00:00', 'General Checkup', 'Scheduled', 4, 104);


-- INSERT DATA INTO MEDICAL_RECORD

INSERT INTO Medical_Record VALUES
(501, '2026-10-01', 'Heart Problem', 'Medication', 'Regular checkup required', 1, 101),
(502, '2026-10-10', 'Migraine', 'Painkillers', 'Avoid stress', 2, 102),
(503, '2026-10-15', 'Leg Fracture', 'Plaster', 'Complete bed rest', 3, 103),
(504, '2026-10-20', 'Viral Fever', 'Medicines', 'Drink plenty of water', 4, 104);


-- INSERT DATA INTO PRESCRIPTION

INSERT INTO Prescription VALUES
(601, '2026-10-01', 'Take medicine twice daily', 1, 101),
(602, '2026-10-10', 'Take medicine after meals', 2, 102),
(603, '2026-10-15', 'Calcium supplements', 3, 103),
(604, '2026-10-20', 'Take medicine for five days', 4, 104);


-- INSERT DATA INTO BILL

INSERT INTO Bill VALUES
(701, '2026-10-05', 'Paid', 7500.00, 1),
(702, '2026-10-15', 'Unpaid', 12000.00, 2),
(703, '2026-10-20', 'Paid', 15000.00, 3),
(704, '2026-10-23', 'Pending', 4500.00, 4);


-- DISPLAY ALL TABLES

SHOW TABLES;


-- QUERY 1: DISPLAY ALL PATIENTS

SELECT * FROM Patient;


-- QUERY 2: DISPLAY ALL DOCTORS

SELECT * FROM Doctor;


-- QUERY 3: DISPLAY ALL DEPARTMENTS

SELECT * FROM Department;


-- QUERY 4: DISPLAY ALL ROOMS

SELECT * FROM Room;


-- QUERY 5: DISPLAY ALL ADMISSIONS

SELECT * FROM Admission;


-- QUERY 6: DISPLAY ALL APPOINTMENTS

SELECT * FROM Appointment;


-- QUERY 7: DISPLAY ALL MEDICAL RECORDS

SELECT * FROM Medical_Record;


-- QUERY 8: DISPLAY ALL PRESCRIPTIONS

SELECT * FROM Prescription;


-- QUERY 9: DISPLAY ALL BILLS

SELECT * FROM Bill;


-- QUERY 10: DISPLAY PATIENT DETAILS WITH THEIR BILLS

SELECT
    Patient.patient_id,
    Patient.first_name,
    Patient.last_name,
    Bill.bill_id,
    Bill.total_amount,
    Bill.bill_status
FROM Patient
JOIN Bill ON Patient.patient_id = Bill.patient_id;


-- QUERY 11: DISPLAY DOCTORS WITH THEIR DEPARTMENT NAMES

SELECT
    Doctor.doctor_id,
    Doctor.first_name,
    Doctor.last_name,
    Doctor.specialization,
    Department.department_name
FROM Doctor
JOIN Department
ON Doctor.department_id = Department.department_id;


-- QUERY 12: DISPLAY APPOINTMENTS WITH PATIENT AND DOCTOR DETAILS

SELECT
    Appointment.appointment_id,
    Patient.first_name AS patient_name,
    Doctor.first_name AS doctor_name,
    Appointment.appointment_date,
    Appointment.appointment_time,
    Appointment.status
FROM Appointment
JOIN Patient
ON Appointment.patient_id = Patient.patient_id
JOIN Doctor
ON Appointment.doctor_id = Doctor.doctor_id;


-- QUERY 13: DISPLAY PATIENTS WITH THEIR ROOM DETAILS

SELECT
    Patient.first_name,
    Patient.last_name,
    Admission.admission_date,
    Room.room_number,
    Room.room_type,
    Room.daily_charge
FROM Patient
JOIN Admission
ON Patient.patient_id = Admission.patient_id
JOIN Room
ON Admission.room_id = Room.room_id;


-- QUERY 14: DISPLAY PATIENT MEDICAL RECORDS

SELECT
    Patient.first_name,
    Patient.last_name,
    Medical_Record.diagnosis,
    Medical_Record.treatment,
    Medical_Record.notes
FROM Patient
JOIN Medical_Record
ON Patient.patient_id = Medical_Record.patient_id;


-- QUERY 15: DISPLAY PRESCRIPTIONS WITH DOCTOR DETAILS

SELECT
    Prescription.prescription_id,
    Patient.first_name AS patient_name,
    Doctor.first_name AS doctor_name,
    Prescription.prescription_date,
    Prescription.notes
FROM Prescription
JOIN Patient
ON Prescription.patient_id = Patient.patient_id
JOIN Doctor
ON Prescription.doctor_id = Doctor.doctor_id;


-- QUERY 16: FIND PATIENTS WITH UNPAID BILLS

SELECT
    Patient.first_name,
    Patient.last_name,
    Bill.total_amount,
    Bill.bill_status
FROM Patient
JOIN Bill
ON Patient.patient_id = Bill.patient_id
WHERE Bill.bill_status = 'Unpaid';


-- QUERY 17: COUNT TOTAL PATIENTS

SELECT COUNT(*) AS total_patients
FROM Patient;


-- QUERY 18: FIND TOTAL BILL AMOUNT

SELECT SUM(total_amount) AS total_revenue
FROM Bill;


-- QUERY 19: FIND AVERAGE BILL AMOUNT

SELECT AVG(total_amount) AS average_bill
FROM Bill;


-- QUERY 20: FIND THE MOST EXPENSIVE ROOM

SELECT *
FROM Room
WHERE daily_charge = (
    SELECT MAX(daily_charge)
    FROM Room
);


-- QUERY 21: COUNT DOCTORS IN EACH DEPARTMENT

SELECT
    Department.department_name,
    COUNT(Doctor.doctor_id) AS total_doctors
FROM Department
LEFT JOIN Doctor
ON Department.department_id = Doctor.department_id
GROUP BY Department.department_id, Department.department_name;


-- QUERY 22: DISPLAY CURRENTLY ADMITTED PATIENTS

SELECT
    Patient.first_name,
    Patient.last_name,
    Admission.admission_date,
    Admission.status
FROM Patient
JOIN Admission
ON Patient.patient_id = Admission.patient_id
WHERE Admission.status = 'Admitted';


-- QUERY 23: FIND PATIENTS WHOSE BILLS ARE GREATER THAN 5000

SELECT
    Patient.first_name,
    Patient.last_name,
    Bill.total_amount
FROM Patient
JOIN Bill
ON Patient.patient_id = Bill.patient_id
WHERE Bill.total_amount > 5000;


-- QUERY 24: UPDATE BILL STATUS

UPDATE Bill
SET bill_status = 'Paid'
WHERE bill_id = 702;

SELECT * FROM Bill WHERE bill_id = 702;


-- QUERY 25: UPDATE PATIENT PHONE NUMBER

UPDATE Patient
SET phone = '9999999999'
WHERE patient_id = 1;

SELECT * FROM Patient WHERE patient_id = 1;


-- QUERY 26: DELETE AN APPOINTMENT

DELETE FROM Appointment
WHERE appointment_id = 404;

SELECT * FROM Appointment;


-- QUERY 27: DISPLAY PATIENTS IN ALPHABETICAL ORDER

SELECT *
FROM Patient
ORDER BY first_name ASC;


-- QUERY 28: FIND PATIENTS GROUPED BY BLOOD GROUP

SELECT
    blood_group,
    COUNT(*) AS total_patients
FROM Patient
GROUP BY blood_group;


-- QUERY 29: DISPLAY DEPARTMENTS HAVING MORE THAN ONE DOCTOR

SELECT
    Department.department_name,
    COUNT(Doctor.doctor_id) AS total_doctors
FROM Department
JOIN Doctor
ON Department.department_id = Doctor.department_id
GROUP BY Department.department_id, Department.department_name
HAVING COUNT(Doctor.doctor_id) > 1;


-- QUERY 30: DISPLAY PATIENTS WITHOUT ANY BILL

SELECT
    Patient.patient_id,
    Patient.first_name,
    Patient.last_name
FROM Patient
LEFT JOIN Bill
ON Patient.patient_id = Bill.patient_id
WHERE Bill.bill_id IS NULL;
