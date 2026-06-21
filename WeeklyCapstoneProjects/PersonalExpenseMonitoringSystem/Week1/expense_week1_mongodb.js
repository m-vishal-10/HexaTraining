use expense_tracker;

db.receipts.insertMany([
  {
    user_id: 1,
    expense_id: 1,
    category: "Groceries",
    amount: 2600.00,
    note: "Weekly grocery run at Nilgiris",
    receipt_file: "receipts/user1_exp1.jpg",
    uploaded_at: ISODate("2026-06-01T18:30:00Z")
  },
  {
    user_id: 1,
    expense_id: 7,
    category: "Shopping",
    amount: 3200.00,
    note: "New running shoes, Decathlon",
    receipt_file: "receipts/user1_exp7.jpg",
    uploaded_at: ISODate("2026-06-12T14:15:00Z")
  },
  {
    user_id: 1,
    expense_id: 8,
    category: "Healthcare",
    amount: 850.00,
    note: "Pharmacy bill, prescription refill",
    receipt_file: "receipts/user1_exp8.jpg",
    uploaded_at: ISODate("2026-06-14T09:45:00Z")
  },
  {
    user_id: 2,
    expense_id: 13,
    category: "Dining Out",
    amount: 1100.00,
    note: "Weekend brunch with family",
    receipt_file: "receipts/user2_exp13.jpg",
    uploaded_at: ISODate("2026-06-06T11:20:00Z")
  },
  {
    user_id: 2,
    expense_id: 15,
    category: "Shopping",
    amount: 2800.00,
    note: "Clothing purchase, Lifestyle store",
    receipt_file: "receipts/user2_exp15.jpg",
    uploaded_at: ISODate("2026-06-11T16:50:00Z")
  },
  {
    user_id: 2,
    expense_id: 17,
    category: "Healthcare",
    amount: 1200.00,
    note: "Doctor consultation fee",
    receipt_file: "receipts/user2_exp17.jpg",
    uploaded_at: ISODate("2026-06-17T10:00:00Z")
  },
  {
    user_id: 3,
    expense_id: 21,
    category: "Transportation",
    amount: 650.00,
    note: "Metro card recharge",
    receipt_file: "receipts/user3_exp21.jpg",
    uploaded_at: ISODate("2026-06-05T08:10:00Z")
  },
  {
    user_id: 3,
    expense_id: 23,
    category: "Shopping",
    amount: 4200.00,
    note: "Bluetooth headphones, Croma",
    receipt_file: "receipts/user3_exp23.jpg",
    uploaded_at: ISODate("2026-06-10T17:35:00Z")
  },
  {
    user_id: 4,
    expense_id: 29,
    category: "Shopping",
    amount: 3600.00,
    note: "Festive shopping, new outfits",
    receipt_file: "receipts/user4_exp29.jpg",
    uploaded_at: ISODate("2026-06-12T13:00:00Z")
  },
  {
    user_id: 4,
    expense_id: 32,
    category: "Healthcare",
    amount: 700.00,
    note: "Annual health checkup",
    receipt_file: "receipts/user4_exp32.jpg",
    uploaded_at: ISODate("2026-06-19T09:30:00Z")
  },
  {
    user_id: 5,
    expense_id: 37,
    category: "Shopping",
    amount: 2950.00,
    note: "New gadget, smartwatch",
    receipt_file: "receipts/user5_exp37.jpg",
    uploaded_at: ISODate("2026-06-13T15:45:00Z")
  },
  {
    user_id: 5,
    expense_id: 34,
    category: "Dining Out",
    amount: 1050.00,
    note: "Lunch with colleagues",
    receipt_file: "receipts/user5_exp34.jpg",
    uploaded_at: ISODate("2026-06-09T12:25:00Z")
  }
]);

db.receipts.createIndex({ user_id: 1 });
db.receipts.createIndex({ expense_id: 1 });
db.receipts.createIndex({ user_id: 1, uploaded_at: -1 });

db.receipts.find({ user_id: 1 }).sort({ uploaded_at: -1 });
db.receipts.find({ expense_id: 23 });
db.receipts.find({ category: "Shopping" }).sort({ amount: -1 });

db.receipts.getIndexes();
