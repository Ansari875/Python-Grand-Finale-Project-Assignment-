-- clinic_booking.sql
-- Clinic Booking System SQL Schema

-- Drop tables if they already exist (for reset)
DROP TABLE IF EXISTS Appointment, Patient, Doctor, Specialization, DoctorSpecialization;

-- Create Specialization table
CREATE TABLE Specialization (
    specialization_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Create Doctor table
CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Many-to-Many: Doctor <-> Specialization
CREATE TABLE DoctorSpecialization (
    doctor_id INT,
    specialization_id INT,
    PRIMARY KEY (doctor_id, specialization_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
    FOREIGN KEY (specialization_id) REFERENCES Specialization(specialization_id)
);

-- Create Patient table
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    phone VARCHAR(15) UNIQUE
);

-- Create Appointment table
CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    reason TEXT,
    status VARCHAR(20) DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);
