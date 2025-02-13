create database section2;

use section2;

CREATE TABLE Vehicles (
    vehicle_id INT PRIMARY KEY,
    type VARCHAR(50),
    registration_number VARCHAR(50) UNIQUE,
    status varchar(50)
);

CREATE TABLE Drivers (
    driver_id INT PRIMARY KEY ,
    name VARCHAR(100),
    license_number VARCHAR(50) UNIQUE,
    assigned_vehicle_id INT,
    FOREIGN KEY (assigned_vehicle_id) REFERENCES Vehicles(vehicle_id)
);

CREATE TABLE Trips (
    trip_id INT PRIMARY KEY,
    vehicle_id INT,
    driver_id INT,
    start_time DATETIME,
    end_time DATETIME,
    distance DECIMAL(10, 2),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id),
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
);

insert into Vehicles (vehicle_id,type,registration_number,status) values (1,'type1','AB1234','Good');
insert into Vehicles (vehicle_id,type,registration_number,status) values (2,'type2','CD5678','Good');

insert into Drivers (driver_id,name,license_number, assigned_vehicle_id) values(1,'Peter','12345678',1);
insert into Drivers (driver_id,name,license_number, assigned_vehicle_id) values(2,'Amy','98643567',2);

insert into Trips (trip_id, vehicle_id,driver_id ,start_time , end_time, distance) values(1,1,1,'2025-02-01 13:00:00','2025-02-01 13:05:00',100.01);
insert into Trips (trip_id, vehicle_id,driver_id ,start_time , end_time, distance) values(2,1,1,'2025-02-01 13:20:00','2025-02-01 13:25:00',212);
insert into Trips (trip_id, vehicle_id,driver_id ,start_time , end_time, distance) values(3,1,1,'2025-02-01 13:30:00','2025-02-01 13:35:00',310);
insert into Trips (trip_id, vehicle_id,driver_id ,start_time , end_time, distance) values(4,1,1,'2025-02-01 13:40:00','2025-02-01 13:45:00',15);
insert into Trips (trip_id, vehicle_id,driver_id ,start_time , end_time, distance) values(5,1,1,'2025-02-01 13:50:00','2025-02-01 13:55:00',27);
insert into Trips (trip_id, vehicle_id,driver_id ,start_time , end_time, distance) values(6,1,1,'2025-02-01 14:00:00','2025-02-01 14:05:00',28.05);
insert into Trips (trip_id, vehicle_id,driver_id ,start_time , end_time, distance) values(7,1,1,'2025-02-01 14:10:00','2025-02-01 14:15:00',29);
insert into Trips (trip_id, vehicle_id,driver_id ,start_time , end_time, distance) values(8,1,1,'2025-02-01 14:20:00','2025-02-01 14:25:00',33);
insert into Trips (trip_id, vehicle_id,driver_id ,start_time , end_time, distance) values(9,1,1,'2025-02-01 14:30:00','2025-02-01 14:35:00',34);
insert into Trips (trip_id, vehicle_id,driver_id ,start_time , end_time, distance) values(10,1,1,'2025-02-01 14:40:00','2025-02-01 14:45:00',35);
insert into Trips (trip_id, vehicle_id,driver_id ,start_time , end_time, distance) values(12,1,1,'2025-02-01 14:50:00','2025-02-01 14:55:00',35);
insert into Trips (trip_id, vehicle_id,driver_id ,start_time , end_time, distance) values(11,2,2,'2025-02-01 14:40:00','2025-02-01 14:45:00',99);

select v.vehicle_id, count(t.trip_id) as trip_count
from Vehicles v left join Trips t on v.vehicle_id=t.vehicle_id
WHERE t.end_time >= NOW() - INTERVAL 30 DAY
GROUP BY v.vehicle_id
Having count(t.trip_id)>10;

select vehicle_id, sum(distance) as total_distance_covered
from Trips
Group By vehicle_id;