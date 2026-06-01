# Hospital Management Database

## Table Descriptions

- **patients** – stores patient personal details like name, age, gender, city and contact
- **departments** – hospital departments such as Cardiology, Neurology, etc.
- **doctors** – doctor profiles including their specialization, department, and consultation fee
- **appointments** – each appointment links a patient to a doctor on a specific date
- **treatments** – medical procedures or tests performed during an appointment
- **bills** – total billing amount generated for a patient per appointment
- **payments** – payment transaction recorded against a bill

---

# Table Relationships

### Patients → Appointments (One-to-Many)

A patient can book multiple appointments.

- appointments.patient_id → patients.patient_id

### Doctors → Appointments (One-to-Many)

A doctor can have multiple appointments.

- appointments.doctor_id → doctors.doctor_id

### Departments → Doctors (One-to-Many)

A department can have multiple doctors.


- doctors.department_id → departments.department_id

### Appointments → Treatments (One-to-One)

Each appointment can have one treatment record.

- treatments.appointment_id → appointments.appointment_id

### Appointments → Bills (One-to-One)

Each appointment generates one bill.


- bills.appointment_id → appointments.appointment_id

### Patients → Bills (One-to-Many)

A patient can have multiple bills across visits.

- bills.patient_id → patients.patient_id

### Bills → Payments (One-to-One)

Each bill has a single payment record.

- payments.bill_id → bills.bill_id
