use smart_home_energy;

db.sensor_logs.insertMany([
  {
    device_id: 1,
    room_id: 1,
    device_name: "Smart TV",
    timestamp: ISODate("2026-06-18T08:00:00Z"),
    sensor_type: "power_meter",
    power_watts: 145.5,
    energy_kwh: 0.29,
    status: "on"
  },
  {
    device_id: 2,
    room_id: 1,
    device_name: "Air Conditioner",
    timestamp: ISODate("2026-06-18T09:00:00Z"),
    sensor_type: "power_meter",
    power_watts: 1480.0,
    energy_kwh: 1.48,
    status: "on"
  },
  {
    device_id: 3,
    room_id: 2,
    device_name: "Refrigerator",
    timestamp: ISODate("2026-06-18T06:00:00Z"),
    sensor_type: "power_meter",
    power_watts: 195.0,
    energy_kwh: 0.39,
    status: "on"
  },
  {
    device_id: 4,
    room_id: 2,
    device_name: "Microwave Oven",
    timestamp: ISODate("2026-06-18T12:30:00Z"),
    sensor_type: "power_meter",
    power_watts: 1080.0,
    energy_kwh: 0.36,
    status: "on"
  },
  {
    device_id: 5,
    room_id: 3,
    device_name: "Ceiling Fan",
    timestamp: ISODate("2026-06-18T07:00:00Z"),
    sensor_type: "power_meter",
    power_watts: 72.0,
    energy_kwh: 0.14,
    status: "on"
  },
  {
    device_id: 6,
    room_id: 3,
    device_name: "Air Conditioner",
    timestamp: ISODate("2026-06-18T23:00:00Z"),
    sensor_type: "power_meter",
    power_watts: 1390.0,
    energy_kwh: 1.39,
    status: "on"
  },
  {
    device_id: 7,
    room_id: 4,
    device_name: "Table Lamp",
    timestamp: ISODate("2026-06-18T19:00:00Z"),
    sensor_type: "power_meter",
    power_watts: 38.5,
    energy_kwh: 0.08,
    status: "on"
  },
  {
    device_id: 8,
    room_id: 4,
    device_name: "Air Purifier",
    timestamp: ISODate("2026-06-18T10:00:00Z"),
    sensor_type: "power_meter",
    power_watts: 48.0,
    energy_kwh: 0.10,
    status: "standby"
  },
  {
    device_id: 9,
    room_id: 5,
    device_name: "Desktop Computer",
    timestamp: ISODate("2026-06-18T09:30:00Z"),
    sensor_type: "power_meter",
    power_watts: 240.0,
    energy_kwh: 0.48,
    status: "on"
  },
  {
    device_id: 10,
    room_id: 5,
    device_name: "Printer",
    timestamp: ISODate("2026-06-18T11:00:00Z"),
    sensor_type: "power_meter",
    power_watts: 28.0,
    energy_kwh: 0.03,
    status: "off"
  },
  {
    device_id: 1,
    room_id: 1,
    device_name: "Smart TV",
    timestamp: ISODate("2026-06-19T08:15:00Z"),
    sensor_type: "power_meter",
    power_watts: 146.0,
    energy_kwh: 0.29,
    status: "on"
  },
  {
    device_id: 2,
    room_id: 1,
    device_name: "Air Conditioner",
    timestamp: ISODate("2026-06-19T22:00:00Z"),
    sensor_type: "power_meter",
    power_watts: 1488.0,
    energy_kwh: 1.49,
    status: "on"
  },
  {
    device_id: 4,
    room_id: 2,
    device_name: "Microwave Oven",
    timestamp: ISODate("2026-06-19T19:45:00Z"),
    sensor_type: "power_meter",
    power_watts: 1102.0,
    energy_kwh: 0.37,
    status: "on"
  },
  {
    device_id: 6,
    room_id: 3,
    device_name: "Air Conditioner",
    timestamp: ISODate("2026-06-19T05:45:00Z"),
    sensor_type: "power_meter",
    power_watts: 1385.0,
    energy_kwh: 1.39,
    status: "on"
  },
  {
    device_id: 9,
    room_id: 5,
    device_name: "Desktop Computer",
    timestamp: ISODate("2026-06-19T17:15:00Z"),
    sensor_type: "power_meter",
    power_watts: 246.0,
    energy_kwh: 0.49,
    status: "on"
  }
]);

db.sensor_logs.createIndex({ device_id: 1 });
db.sensor_logs.createIndex({ timestamp: 1 });
db.sensor_logs.createIndex({ device_id: 1, timestamp: -1 });

db.sensor_logs.find({ device_id: 2 }).sort({ timestamp: -1 });
db.sensor_logs.find({ timestamp: { $gte: ISODate("2026-06-19T00:00:00Z") } });
db.sensor_logs.find({ room_id: 3 }).sort({ timestamp: 1 });

db.sensor_logs.getIndexes();
