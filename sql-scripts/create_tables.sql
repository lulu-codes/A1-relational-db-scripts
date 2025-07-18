-- create_tables.sql

-- create the tables mapped out by the ERD (min 5 + junction table)
-- drop tables in reverse dependency order

DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS appointments;
DROP TABLE IF EXISTS service_options;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS payment_statuses;
DROP TABLE IF EXISTS appointment_statuses;
DROP TABLE IF EXISTS service_categories;
DROP TABLE IF EXISTS lash_styles;


-- LOOK UP TABLES:

-- Create lash_styles table (Look up table for Classic/Hybrid/Volume/ N/A for removal).
-- Added for same reason as above for service_categories. Also can easily add other lash styles in future and only needing to insert here.
CREATE TABLE lash_styles (
    lash_style_id SERIAL PRIMARY KEY,
    style_name VARCHAR(30) NOT NULL UNIQUE,
    style_description TEXT
);

-- Predefined lash styles (used in service_options)
INSERT INTO lash_styles (style_name, style_description) VALUES
('Classic', 'Natural one-to-one application'),
('Hybrid', 'Mix of classic and volume'),
('Volume', 'Fuller volume lashes'),
('N/A', 'Used for removals');

-- Create service_categories table (Look up table for Full Set/Refill/Removal).
-- Initially had in service_options, but normalised out of service_options to remove repeated category text from initial service_options and allows easy addition of new categories in future.
CREATE TABLE service_categories (
    service_category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(30) NOT NULL UNIQUE,
    category_description TEXT
);

-- Predefined service categories (used in service_options)
INSERT INTO service_categories (category_name, category_description) VALUES
('Full Set', 'Full set of lashes'),
('Refill', 'Lash refills'),
('Removal', 'Lash removal service only');

-- Create appointment_statuses table (Look up table for appt booking statuses Confirmed/Cancelled/No Show)
CREATE TABLE appointment_statuses (
    appointment_status_id SERIAL PRIMARY KEY,
    status_name VARCHAR(30) NOT NULL UNIQUE
);

-- Predefined appointment statuses
INSERT INTO appointment_statuses (status_name) VALUES
('Confirmed'), ('Cancelled'), ('No Show');

-- Create payment_statuses table (Look up table for payment statuses Pending/Paid/No Payment - for cancellations/no shows).
CREATE TABLE payment_statuses (
    payment_status_id SERIAL PRIMARY KEY,
    status_name VARCHAR(30) NOT NULL UNIQUE
);

-- Predefined payment statuses
INSERT INTO payment_statuses (status_name) VALUES
('Pending'), ('Paid'), ('No Payment');

-- Create clients table. One row per client = 1NF atomic fields
CREATE TABLE clients (
    client_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    mobile_number VARCHAR(10) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Create service_options table (Junction table). Connects a service_category and lash_style with its service_price and duration_minutes.
CREATE TABLE service_options (
    service_option_id SERIAL PRIMARY KEY,
    service_category_id INT NOT NULL,
    lash_style_id INT NOT NULL,
    service_price NUMERIC(8,2) NOT NULL CHECK (service_price > 0),                                              -- Checks to enforce positive pricing
    duration_minutes INT NOT NULL CHECK (duration_minutes > 0),
    UNIQUE (service_category_id, lash_style_id),                                                -- Added UNIQUE constraints to allow only one row per combo (2NF & 3NF)
    FOREIGN KEY (service_category_id) REFERENCES service_categories(service_category_id),
    FOREIGN KEY (lash_style_id) REFERENCES lash_styles(lash_style_id)
);

-- Predefined service options (Junction table: category + style (unique combos) + price + duration)
INSERT INTO service_options (service_category_id, lash_style_id, service_price, duration_minutes) VALUES
(1, 1, 80.00, 120),     -- Full Set Classic
(1, 2, 95.00, 130),     -- Full Set Hybrid
(1, 3, 110.00, 150),    -- Full Set Volume
(2, 1, 60.00, 90),      -- Refill Classic
(2, 2, 90.00, 100),     -- Refill Hybrid
(2, 3, 120.00, 120),    -- Refill Volume
(3, 4, 30.00, 30);      -- Removal only (no style aplicable = N/A)

-- Create appointment table (Main appointments table). Links clients to a service_options at appt datetime
CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    client_id INT NOT NULL,
    service_option_id INT NOT NULL,
    appointment_datetime TIMESTAMP NOT NULL,                                        -- Booking appt start date and time
    appointment_status_id INT NOT NULL DEFAULT 1,                                   -- Default appointment booking status set as 1 = Confirmed
    FOREIGN KEY (client_id) REFERENCES clients(client_id) ON DELETE CASCADE,        -- Deletes appts if client is removed
    FOREIGN KEY (service_option_id) REFERENCES service_options(service_option_id),
    FOREIGN KEY (appointment_status_id) REFERENCES appointment_statuses(appointment_status_id)
);

-- Create payments table (Main payments table). Links to appointment id for payment record
CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    appointment_id INT NOT NULL UNIQUE,
    amount_paid NUMERIC (8,2) NOT NULL CHECK (amount_paid >= 0),                                -- Checks to enforce positive amounts
    payment_date DATE NOT NULL,
    payment_status_id INT NOT NULL DEFAULT 1,                                                   -- Default payment status set as 1 = Pending
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id) ON DELETE CASCADE,     -- Deletes payment if appt is deleted
    FOREIGN KEY (payment_status_id) REFERENCES payment_statuses(payment_status_id)
);



-- For viewing
-- SELECT * FROM lash_styles;
-- SELECT * FROM service_categories;
-- SELECT * FROM appointment_statuses;
-- SELECT * FROM payment_statuses;
-- SELECT * FROM service_options;
