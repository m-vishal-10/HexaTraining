
patients – stores patient personal details like name, age, gender, city and contact
departments – hospital departments such as Cardiology, Neurology, etc.
doctors – doctor profiles including their specialization, department, and consultation fee
appointments – each appointment links a patient to a doctor on a specific date
treatments – medical procedures or tests performed during an appointment
bills – total billing amount generated for a patient per appointment
payments – payment transaction recorded against a bill


patients → appointments (one to many) — a patient can book multiple appointments
  `appointments.patient_id` → `patients.patient_id`
doctors → appointments (one to many) — a doctor can have multiple appointments
  `appointments.doctor_id` → `doctors.doctor_id`
departments → doctors (one to many) — a department can have multiple doctors
  `doctors.department_id` → `departments.department_id`
appointments → treatments (one to one) — each appointment can have one treatment record
  `treatments.appointment_id` → `appointments.appointment_id`
appointments → bills (one to one) — each appointment generates one bill
  `bills.appointment_id` → `appointments.appointment_id`
patients → bills (one to many) — a patient can have multiple bills across visits
  `bills.patient_id` → `patients.patient_id`
bills → payments (one to one) — each bill has a single payment record
  `payments.bill_id` → `bills.bill_id`


