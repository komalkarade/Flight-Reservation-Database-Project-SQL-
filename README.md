# Flight Reservation Database Project (SQL)------------
![Online-airlines-reservation-system](https://github.com/user-attachments/assets/922cd30e-d788-40a6-9d11-dcdb55f18874)



Overview
This project involves building and analyzing a Flight Reservation System database using SQL. The goal is to design relational tables, manage airline booking operations, and extract valuable insights to support airline business needs. This README outlines the project's objectives, dataset schema, key queries, findings, and conclusions.

Objectives
Design a relational database to manage flights, users, tickets, passengers, payments, and routes.

Write SQL queries to handle booking operations, cancellations, and payment processing.

Analyze booking patterns, flight occupancy rates, revenue generation, and customer behavior.

Use SQL clauses like JOIN, GROUP BY, ORDER BY, AGGREGATE FUNCTIONS, and SUBQUERIES for business reporting.

Dataset
The data structure was designed and populated manually to simulate real-world flight reservation scenarios.

Schema
sql
Copy
Edit
DROP TABLE IF EXISTS airport, route, flight, flight_user, ticket, passenger, payment, feed_back;

CREATE TABLE airport (
    airport_code VARCHAR(255) PRIMARY KEY,
    airport_location VARCHAR(255) NOT NULL
);

CREATE TABLE route (
    route_id BIGINT PRIMARY KEY,
    destination_airport_code VARCHAR(255) NOT NULL,
    fare DOUBLE NOT NULL,
    source_airport_code VARCHAR(255) NOT NULL
);

CREATE TABLE flight (
    flight_number BIGINT PRIMARY KEY,
    arrival VARCHAR(255) NOT NULL,
    carrier_name VARCHAR(255) NOT NULL,
    departure VARCHAR(255) NOT NULL,
    route_id BIGINT NOT NULL,
    seat_capacity INT NOT NULL,
    seat_booked INT NOT NULL,
    FOREIGN KEY (route_id) REFERENCES route(route_id)
);

CREATE TABLE flight_user (
    username VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL
);

CREATE TABLE ticket (
    ticket_number BIGINT PRIMARY KEY,
    carrier_name VARCHAR(255) NOT NULL,
    flight_number BIGINT NOT NULL,
    route_id BIGINT NOT NULL,
    total_amount DOUBLE NOT NULL,
    FOREIGN KEY (flight_number) REFERENCES flight(flight_number)
);

CREATE TABLE passenger (
    serial_number INT NOT NULL,
    ticket_number BIGINT NOT NULL,
    fare DOUBLE NOT NULL,
    passengerdob VARCHAR(255) NOT NULL,
    passenger_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (serial_number, ticket_number),
    FOREIGN KEY (ticket_number) REFERENCES ticket(ticket_number)
);

CREATE TABLE payment (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    amount DOUBLE NOT NULL,
    payment_mode VARCHAR(255) NOT NULL,
    status VARCHAR(255) NOT NULL
);

CREATE TABLE feed_back (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    message VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL
);
Findings and Conclusion
Flight and Route Analysis: Identified the busiest routes, flight occupancy rates, and average seat bookings.

Revenue Insights: Aggregated ticket sales and payment data to analyze total revenue generation.

User and Booking Behavior: Analyzed user registration patterns, common destinations, and booking trends.

Operational Efficiency: Identified flights with maximum seat bookings and flagged low-occupancy flights for optimization.

This project offers a practical application of SQL database design and advanced query writing, useful for data analysts, database developers, and backend engineers working in the airline or transportation industry.

Author – Komal Karade
This project is part of my portfolio to showcase SQL skills for database management and business analysis roles. Feel free to connect if you'd like to collaborate or discuss similar projects!

