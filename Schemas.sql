
-- Create and use database
CREATE DATABASE IF NOT EXISTS airlinesdb;
USE airlinesdb;
--------------------------------------------------------------------------------------------------------------------------------------------

-- Create tables
CREATE TABLE airport (
    airport_code VARCHAR(255) PRIMARY KEY,
    airport_location VARCHAR(255) NOT NULL
);
--------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE feed_back (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    message VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL
);
--------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE flight (
    flight_number BIGINT PRIMARY KEY,
    arrival VARCHAR(255) NOT NULL,
    carrier_name VARCHAR(255) NOT NULL,
    departure VARCHAR(255) NOT NULL,
    route_id BIGINT NOT NULL,
    seat_capacity INT NOT NULL,
    seat_booked INT NOT NULL
);
--------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE flight_user (
    username VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL
);
--------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE passenger (
    serial_number INT NOT NULL,
    ticket_number BIGINT NOT NULL,
    fare DOUBLE NOT NULL,
    passengerdob VARCHAR(255) NOT NULL,
    passenger_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (serial_number, ticket_number)
);
--------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE payment (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    amount DOUBLE NOT NULL,
    payment_mode VARCHAR(255) NOT NULL,
    status VARCHAR(255) NOT NULL
);
--------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE route (
    route_id BIGINT PRIMARY KEY,
    destination_airport_code VARCHAR(255) NOT NULL,
    fare DOUBLE NOT NULL,
    source_airport_code VARCHAR(255) NOT NULL
);
--------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE ticket (
    ticket_number BIGINT PRIMARY KEY,
    carrier_name VARCHAR(255) NOT NULL,
    flight_number BIGINT NOT NULL,
    route_id BIGINT NOT NULL,
    total_amount DOUBLE NOT NULL
);
--------------------------------------------------------------------------------------------------------------------------------------------

-- Foreign key constraints
ALTER TABLE flight ADD CONSTRAINT fk_route FOREIGN KEY (route_id) REFERENCES route(route_id);
ALTER TABLE passenger ADD CONSTRAINT fk_ticket FOREIGN KEY (ticket_number) REFERENCES ticket(ticket_number);
ALTER TABLE ticket ADD CONSTRAINT fk_flight FOREIGN KEY (flight_number) REFERENCES flight(flight_number);
--------------------------------------------------------------------------------------------------------------------------------------------

Insert into airport

INSERT INTO airport (airport_code, airport_location) VALUES
('DEL', 'New Delhi'),
('BOM', 'Mumbai'),
('BLR', 'Bangalore'),
('HYD', 'Hyderabad'),
('MAA', 'Chennai'),
('CCU', 'Kolkata'),
('GOI', 'Goa'),
('PNQ', 'Pune'),
('AMD', 'Ahmedabad'),
('COK', 'Kochi');
--------------------------------------------------------------------------------------------------------------------------------------------

Insert into route

INSERT INTO route (route_id, destination_airport_code, fare, source_airport_code) VALUES
(101, 'BOM', 4500, 'DEL'),
(102, 'BLR', 5500, 'DEL'),
(103, 'HYD', 3500, 'DEL'),
(104, 'MAA', 4000, 'BOM'),
(105, 'GOI', 3000, 'BOM'),
(106, 'COK', 6000, 'BLR'),
(107, 'PNQ', 4200, 'BLR'),
(108, 'AMD', 3800, 'HYD'),
(109, 'CCU', 4800, 'MAA'),
(110, 'DEL', 5200, 'COK');
--------------------------------------------------------------------------------------------------------------------------------------------

Insert into flight

INSERT INTO flight (flight_number, arrival, carrier_name, departure, route_id, seat_capacity, seat_booked) VALUES
(1001, 'Mumbai', 'IndiGo', 'Delhi', 101, 180, 150),
(1002, 'Bangalore', 'Air India', 'Delhi', 102, 200, 170),
(1003, 'Hyderabad', 'SpiceJet', 'Delhi', 103, 190, 120),
(1004, 'Chennai', 'Go First', 'Mumbai', 104, 160, 130),
(1005, 'Goa', 'Vistara', 'Mumbai', 105, 170, 140),
(1006, 'Kochi', 'IndiGo', 'Bangalore', 106, 210, 200),
(1007, 'Pune', 'Air Asia', 'Bangalore', 107, 180, 175),
(1008, 'Ahmedabad', 'SpiceJet', 'Hyderabad', 108, 150, 140),
(1009, 'Kolkata', 'Go First', 'Chennai', 109, 220, 210),
(1010, 'Delhi', 'Vistara', 'Kochi', 110, 200, 195);
--------------------------------------------------------------------------------------------------------------------------------------------

Insert into flight_user

INSERT INTO flight_user (username, password, type) VALUES
('admin1', 'adminpass', 'ADMIN'),
('user1', 'userpass1', 'USER'),
('user2', 'userpass2', 'USER'),
('user3', 'userpass3', 'USER'),
('admin2', 'adminpass2', 'ADMIN'),
('user4', 'userpass4', 'USER'),
('user5', 'userpass5', 'USER'),
('user6', 'userpass6', 'USER'),
('admin3', 'adminpass3', 'ADMIN'),
('user7', 'userpass7', 'USER');
--------------------------------------------------------------------------------------------------------------------------------------------

Insert into ticket

INSERT INTO ticket (ticket_number, carrier_name, flight_number, route_id, total_amount) VALUES
(5001, 'IndiGo', 1001, 101, 4500),
(5002, 'Air India', 1002, 102, 5500),
(5003, 'SpiceJet', 1003, 103, 3500),
(5004, 'Go First', 1004, 104, 4000),
(5005, 'Vistara', 1005, 105, 3000),
(5006, 'IndiGo', 1006, 106, 6000),
(5007, 'Air Asia', 1007, 107, 4200),
(5008, 'SpiceJet', 1008, 108, 3800),
(5009, 'Go First', 1009, 109, 4800),
(5010, 'Vistara', 1010, 110, 5200);
--------------------------------------------------------------------------------------------------------------------------------------------

Insert into passenger

INSERT INTO passenger (serial_number, ticket_number, fare, passengerdob, passenger_name) VALUES
(1, 5001, 4500, '1995-06-12', 'Amit Kumar'),
(2, 5002, 5500, '1988-11-30', 'Priya Singh'),
(3, 5003, 3500, '2000-01-15', 'Rohit Sharma'),
(4, 5004, 4000, '1993-07-19', 'Anjali Gupta'),
(5, 5005, 3000, '1997-09-25', 'Vikram Verma'),
(6, 5006, 6000, '1990-05-04', 'Sneha Joshi'),
(7, 5007, 4200, '1985-02-14', 'Karan Mehta'),
(8, 5008, 3800, '1992-08-22', 'Neha Kapoor'),
(9, 5009, 4800, '1998-12-11', 'Rahul Yadav'),
(10, 5010, 5200, '1996-03-03', 'Pooja Nair');
--------------------------------------------------------------------------------------------------------------------------------------------

Insert into payment

INSERT INTO payment (amount, payment_mode, status) VALUES
(4500, 'Credit Card', 'Completed'),
(5500, 'Debit Card', 'Completed'),
(3500, 'UPI', 'Completed'),
(4000, 'Net Banking', 'Completed'),
(3000, 'Cash', 'Completed'),
(6000, 'Credit Card', 'Completed'),
(4200, 'UPI', 'Pending'),
(3800, 'Debit Card', 'Completed'),
(4800, 'Net Banking', 'Completed'),
(5200, 'Credit Card', 'Pending');
--------------------------------------------------------------------------------------------------------------------------------------------

Insert into feed_back

INSERT INTO feed_back (message, username) VALUES
('Good service', 'user1'),
('Easy booking', 'user2'),
('Nice staff', 'user3'),
('Comfortable seats', 'user4'),
('Smooth journey', 'user5'),
('Fast check-in', 'user6'),
('On time departure', 'user7'),
('Great app experience', 'user1'),
('Helpful support', 'user2'),
('Affordable tickets', 'user3');

--------------------------------------------------------------------------------------------------------------------------------------------
